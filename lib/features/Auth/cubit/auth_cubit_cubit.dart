

import 'package:bloc/bloc.dart';
import 'package:courseup/features/Auth/data/firebase_user_repo.dart';
import 'package:courseup/features/Auth/models/my_user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final FirebaseUserRepo firebaseUserRepo;
  AuthCubitCubit(this.firebaseUserRepo) : super(AuthCubitInitial()) {
    firebaseUserRepo.user.listen((user) {
      if (user != null) {
        emit(AuthCubitAuthenticated(user: user));
      } else {
        emit(AuthCubitUnAuthenticated());
      }
    });
  }

  Future<void> login(MyUser myUser, String password) async {
    emit(AuthCubitLoading());
    final result = await firebaseUserRepo.logIn(myUser, password);
    result.fold((success) async {
      final currentUser = await firebaseUserRepo.user.first;
      emit(AuthCubitAuthenticated(user: currentUser));
    }, (failure) {
      emit(AuthCubitError(message: failure.exception.toString()));
    });
  }

  Future<void> signup(MyUser myUser, String password) async {
    emit(AuthCubitLoading());
    final result = await firebaseUserRepo.signUp(myUser, password);
    result.fold((success) async {
      final setUserResult = await firebaseUserRepo.setUserData(success.value);
        setUserResult.fold(
          (userSuccess) async{
            final currentUser = await firebaseUserRepo.user.first;
            emit(AuthCubitAuthenticated(user: currentUser));
          } ,
          (failure) => emit(AuthCubitError(message: failure.exception.toString())),
        );
    }, (failure) {
      emit(AuthCubitError(message: failure.exception.toString()));
    });
  }

  Future<void> logout() async {
    emit(AuthCubitLoading());
    final result = await firebaseUserRepo.logout();
    result.fold((success) {
      emit(AuthCubitUnAuthenticated());
    }, (failure) {
      emit(AuthCubitError(message: failure.exception.toString()));
    });
  }
}
