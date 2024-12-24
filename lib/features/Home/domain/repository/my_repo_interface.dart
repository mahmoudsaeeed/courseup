import 'package:courseup/core/error/result.dart';
import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:dartz/dartz.dart';

abstract class MyRepoInterface {
  Future<Either<List<MyCourse>, FailureMessage>> getAllCourses();
}
