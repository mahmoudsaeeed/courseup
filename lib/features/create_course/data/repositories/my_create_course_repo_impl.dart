import 'package:courseup/core/error/result.dart';
import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:courseup/features/create_course/data/services/cloudinary_service.dart';
import 'package:courseup/features/create_course/domain/repositories/my_create_course_repo_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class MyCreateCourseRepoImpl extends MyCreateCourseRepoInterface {
  final CloudinaryService _cloudinaryService;

  MyCreateCourseRepoImpl({required CloudinaryService cloudinaryService})
      : _cloudinaryService = cloudinaryService;

  @override
  Future<Either<Success<String?>, FailureMessage>> uploadCourseImage(
      String imgPath) async {

      final response = await _cloudinaryService.uploadCourseImage(imgPath);
      return response.fold(
        (success) {
          try {
            //TODO cloudinary code
            // _firestore.collection('users').doc(userEntity.userId).update({
            //   'profileImage': success.value,
            // });
            // log('successfully updated');
            // return left(Success(value: 'Course image url saved successfully'));
            return left(Success(value: 'upload course img to cloudinary not working yet'));
          } catch (e) {
            debugPrint('error updating the Database');
            return right(FailureMessage(failureMessage: e.toString()));
          }
        },
        (error) {
          return right(error);
        },
      );
    }
    //TODO upload course in db
      @override
      Future<Either<Success<String?>, FailureMessage>> uploadCourse(MyCourse course) {
    // TODO: implement uploadCourse
    throw UnimplementedError();
      }
    //TODO upload videos in cloudinary
      @override
      Future<Either<Success<String?>, FailureMessage>> uploadVideos(List<String> videosUrl) {
    // TODO: implement uploadVideos
    throw UnimplementedError();
      } 
  }
