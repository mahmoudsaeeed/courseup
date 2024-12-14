import 'dart:developer';

import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/Auth/shared/error/result.dart';
import 'package:courseup/features/ViewProfile/data/services/cloudinary_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/ViewProfile/domain/user_profile_repo.dart';
import 'package:dartz/dartz.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final FirebaseFirestore _firestore;
  final CloudinaryService _cloudinaryService;

  UserProfileRepoImpl({
    required FirebaseFirestore firestore,
    required CloudinaryService cloudinaryService,
  })  : _firestore = firestore,
        _cloudinaryService = cloudinaryService;

  @override
Future<Either<Success<String>, Failure>> updateUserProfileImage(
    MyUserEntity userEntity, String imagePath) async {
  final response = await _cloudinaryService.uploadProfileImage(imagePath);

  return response.fold(
    (success) {
      try {
        _firestore.collection('users').doc(userEntity.userId).update({
          'profileImage': success.value,
        });
        log('successfully updated');
        return left(Success(value: 'Profile image url saved successfully'));
      } catch (e) {
        log('error updating the firestore');
        return right(Failure(exception: e));
      }
    },
    (error) {
      return right(error);
    },
  );
}


  @override
  Future<Either<Success<MyUserEntity>, Failure>> getUserData(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      final data = doc.data();
      if (data != null) {
        return left(Success(value: MyUserEntity.fromDocument(data)));
      } else {
        return right(Failure(exception: Exception('user not found')));
      }
    } catch (e) {
      return right(Failure(exception: e));
    }
  }
}
