import 'package:courseup/features/create_course/data/services/my_upload_course_api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/error/result.dart';
import '../../../../data/models/my_course.dart';

part 'my_upload_course_state.dart';

class MyUploadCourseCubit extends Cubit<MyUploadCourseState> {
  MyUploadCourseCubit(this.myUploadCourseApiService)
      : super(MyUploadCourseInitial());
  final MyUploadCourseApiService myUploadCourseApiService;

  Future<Either<Success<Response>, Failure>> uploadCourse(
      MyCourse myCourse) async {
    emit(MyUploadCourseLoading());
    try {
      final result = await myUploadCourseApiService.uploadCourse(myCourse);
      result.fold(
        (success) {
          emit(MyUploadCourseSuccess(myCourse: myCourse));
          return left(success);
        },
        (failed) {
          emit(MyUploadCourseFailed(errMessage: failed.exception));
          return right(failed.exception);
        },
      );
    } catch (e) {
      emit(MyUploadCourseFailed(errMessage: e));
      debugPrint(
          "==== myuploadCourseCubit  ||  failed || upload course =============");
      return right(Failure(exception: e));
    }

    return right(Failure(exception: "Nothing"));
  }
}
