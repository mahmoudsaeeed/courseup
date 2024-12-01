

import 'package:bloc/bloc.dart';
import 'package:courseup/features/Auth/data/firebase_user_repo.dart';
import 'package:courseup/features/Auth/models/my_user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseUserRepo firebaseUserRepo;
  AuthCubit(this.firebaseUserRepo) : super(AuthInitial()) {
    firebaseUserRepo.user.listen((user) {
      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(AuthUnAuthenticated());
      }
    });
  }

  Future<void> login(MyUser myUser, String password) async {
    emit(AuthLoading());
    final result = await firebaseUserRepo.logIn(myUser, password);
    result.fold((success) async {
      final currentUser = await firebaseUserRepo.user.first;
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
          (userSuccess) async{
            final currentUser = await firebaseUserRepo.user.first;
            emit(AuthAuthenticated(user: currentUser));
          } ,
          (failure) => emit(AuthError(message: failure.exception.toString())),
        );
    }, (failure) {
      emit(AuthError(message: failure.exception.toString()));
    });
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await firebaseUserRepo.logout();
    result.fold((success) {
      emit(AuthUnAuthenticated());
    }, (failure) {
      emit(AuthError(message: failure.exception.toString()));
    });
  }
}
