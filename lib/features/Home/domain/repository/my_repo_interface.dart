import 'package:courseup/core/error/result.dart';
import 'package:dartz/dartz.dart';

abstract class MyRepoInterface {
  Future<Either<Success<List>, FailureMessage>> getAllCourses();
}
