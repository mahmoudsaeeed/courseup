import 'package:bloc/bloc.dart';
import 'package:courseup/features/Auth/data/repository/my_user_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/models/my_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final MyUserRepoImpl firebaseUserRepo;

  AuthCubit(this.firebaseUserRepo) : super(AuthInitial()) {
    firebaseUserRepo.user.listen((user) {
      if (user != null) {
        debugPrint("authCubit | already user authed");
        emit(AuthAuthenticated(user: user));
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

    result.fold((success) async {
      //can cause problems
      final currentUser = firebaseUserRepo.currentUser;

      emit(AuthAuthenticated(user: currentUser));
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
          final currentUser = FirebaseAuth.instance.currentUser;
          emit(AuthAuthenticated(user: currentUser));
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
