// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:courseup/core/error/result.dart';
import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:dartz/dartz.dart';

abstract class MyCreateCourseRepoInterface {

  Future<Either<Success<String?>, FailureMessage>> uploadCourseImage(String imgPath);
  Future<Either<Success<String?>, FailureMessage>> uploadVideos(List<String> videosUrl );

  Future<Either<Success<String?>, FailureMessage>> uploadCourse(MyCourse course );
  
}
