import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/data/repository/my_user_repo_impl.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/my_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final MyUserRepoImpl firebaseUserRepo;

  AuthCubit(this.firebaseUserRepo) : super(AuthInitial()) {
    firebaseUserRepo.user.listen((user) async {
      if (user != null) {
        debugPrint("authCubit | already user authed");
        final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        MyUserEntity myUserEntity = MyUserEntity.fromDocument(userDoc.data()!);
        emit(AuthAuthenticated(user: myUserEntity));
      } else {
        debugPrint("authCubit | user not authed");
        emit(AuthUnAuthenticated());
      }
    }).onError((error) {
      emit(AuthError(message: error.toString()));
    });
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    //TODO (mahmoud) result either success msg or failure
    final result = await firebaseUserRepo.login(email, password);
    debugPrint("result = ${result.isLeft()}");
    result.fold((success) async {
      //can cause problems
      final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(success.value.uid).get();
      MyUserEntity myUserEntity = MyUserEntity.fromDocument(userDoc.data()!);
      emit(AuthAuthenticated(user: myUserEntity));
    }, (failure) {
      emit(AuthError(message: failure.exception.toString()));
    });
  }

  Future<void> signup(MyUser myUser, String password) async {
    emit(AuthLoading());
    final result = await firebaseUserRepo.signUp(myUser, password);
    result.fold((success) async {
      final setUserResult = await firebaseUserRepo.setUserData(success.value);
      setUserResult.fold(
        (userSuccess) async {
          // final currentUser = await firebaseUserRepo.user.first;
          MyUserEntity userEntity = userSuccess.value.toEntity();
          emit(AuthAuthenticated(user: userEntity));
        },
        (failure) => emit(AuthError(message: failure.exception.toString())),
      );
    }, (failure) {
      emit(AuthError(
        message: failure.exception.toString(),
      ));
    });
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await firebaseUserRepo.logout();

    result.fold((success) {
      emit(AuthUnAuthenticated());
    }, (failure) {
      emit(
        AuthError(
          message: failure.exception.toString(),
        ),
      );
    });
  }
}
