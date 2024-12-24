import 'package:courseup/core/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MyRepoInterface {
  Future<Either<Success<Response>, FailureMessage>> getAllCourses();
}
