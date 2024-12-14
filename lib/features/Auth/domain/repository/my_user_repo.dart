import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/Auth/shared/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class MyUserRepo {
  Stream<User?> get user;
  User? get currentUser;
  Future<Either<Success<MyUserEntity>, Failure>> signUp(
      MyUserEntity userEntity, String password);
  Future<Either<Success<MyUserEntity>, Failure>> login(
    String email, String password);
  Future<Either<Success<MyUserEntity>, Failure>> setUserData(MyUserEntity userEntity);
   Future<Either<Success<String>, Failure>> resetPassword(MyUserEntity userEntity);
  Future<Either<Success<String>, Failure>> logout();

}
