import 'package:courseup/core/error/result.dart';
import 'package:courseup/features/Home/data/my_get_courses_api_service.dart';
import 'package:courseup/features/Home/domain/repository/my_repo_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MyRepoImpl extends MyRepoInterface {
  final MyGetCoursesApiService _myGetCoursesApiService;

  MyRepoImpl({required MyGetCoursesApiService myGetCoursesApiService})
      : _myGetCoursesApiService = myGetCoursesApiService;
  @override
  Future<Either<Success<Response>, FailureMessage>> getAllCourses() async {
      final response = await _myGetCoursesApiService.getAllCourses();
      return response.fold(
        (success) {
          return left(success);
        },
        (failed) {
          return right(FailureMessage(failureMessage: failed.toString()));
        },
      );
  }
}
