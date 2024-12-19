import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/data/repository/my_user_repo_impl.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final MyUserRepoImpl firebaseUserRepo;
  MyUserEntity? _authenticatedUser;
  AuthCubit(this.firebaseUserRepo) : super(AuthInitial()) {
    firebaseUserRepo.user.listen((user) async {
      if (user != null) {
        debugPrint("authCubit | already user authed");
        final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        MyUserEntity myUserEntity = MyUserEntity.fromDocument(userDoc.data()!);
        _authenticatedUser = myUserEntity;
        emit(AuthAuthenticated(user: myUserEntity));
      } else {
        debugPrint("authCubit | user not authed");
        _authenticatedUser = null;
        emit(AuthUnAuthenticated());
      }
    }).onError((error) {
      emit(AuthError(message: error.toString()));
    });
  }

  MyUserEntity? get authenticatedUser => _authenticatedUser;

  Future<void> checkAuthStatus() async {
  emit(AuthLoading());
  try {
    final user = firebaseUserRepo.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      MyUserEntity myUserEntity = MyUserEntity.fromDocument(userDoc.data()!);
      emit(AuthAuthenticated(user: myUserEntity));
    } else {
      emit(AuthUnAuthenticated());
    }
  } catch (e) {
    emit(AuthError(message: e.toString()));
  }
}

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await firebaseUserRepo.login(email, password);
    debugPrint("login in auth_cubit  ||  result = auth error");
    result.fold((success) async {
      emit(AuthAuthenticated(user: success.value));
    }, (failure) {
      emit(AuthError(message: failure.exception.toString()));
    });
  }

  Future<void> signup(MyUserEntity myUser, String password) async {
    emit(AuthLoading());
    final result = await firebaseUserRepo.signUp(myUser, password);
    result.fold((success) async {
      final setUserResult = await firebaseUserRepo.setUserData(success.value);
      setUserResult.fold(
        (userSuccess) async {
          // final currentUser = await firebaseUserRepo.user.first;
          MyUserEntity userEntity = userSuccess.value;
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
