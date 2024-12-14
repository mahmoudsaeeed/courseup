import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/Auth/shared/error/result.dart';
import 'package:dartz/dartz.dart';

abstract class UserProfileRepo {
  Future<Either<Success<String>, Failure>> updateUserProfileImage(MyUserEntity userEntity, String imagePath);
  Future<Either<Success<MyUserEntity>, Failure>> getUserData(String userId);
}