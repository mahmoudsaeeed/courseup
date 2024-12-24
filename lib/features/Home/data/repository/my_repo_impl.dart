import 'package:courseup/core/error/result.dart';
import 'package:courseup/features/Home/data/my_get_courses_api_service.dart';
import 'package:courseup/features/Home/domain/repository/my_repo_interface.dart';
import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:dartz/dartz.dart';

class MyRepoImpl extends MyRepoInterface {
  final MyGetCoursesApiService _myGetCoursesApiService;

  MyRepoImpl({required MyGetCoursesApiService myGetCoursesApiService})
      : _myGetCoursesApiService = myGetCoursesApiService;

  /// get data list or error
  @override
  Future<Either<Success<List>, FailureMessage>> getAllCourses() async {
    final response = await _myGetCoursesApiService.getAllCourses();
    List myData;
    return response.fold(
      (success) {
        final List myDataBeforeHandel = success.value.data;
        // myData = myDataBeforeHandel.map(
        //   (map) => MyCourse.fromJson(map),
        // );
        return left(success.value.data);
      },
      (failed) {
        return right(FailureMessage(failureMessage: failed.toString()));
      },
    );
  }
}
