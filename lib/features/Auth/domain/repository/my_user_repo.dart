import 'package:courseup/features/Auth/data/models/my_user.dart';
import 'package:courseup/features/Auth/shared/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class MyUserRepo {
  Stream<User?> get user;
  User? get currentUser;
  Future<Either<Success<MyUser>, Failure>> signUp(
      MyUser myUser, String password);
  Future<Either<Success<String>, Failure>> login(
      String email, String password);
  Future<Either<Success<String>, Failure>> setUserData(MyUser myUser);
  Future<Either<Success<String>, Failure>> resetPassword(MyUser myUser);
  Future<Either<Success<String>, Failure>> logout();

}
