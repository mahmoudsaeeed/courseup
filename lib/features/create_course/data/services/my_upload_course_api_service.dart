import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/shared/error/result.dart';
import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyUploadCourseApiService {
  late Dio myDio;
  MyUploadCourseApiService() {
    BaseOptions myOptions = BaseOptions(
      baseUrl: MyApiUrlEndpoints.baseUrl,
    );
    myDio = Dio(myOptions);
  }

  Future<Either<Success<Response>, Failure>> uploadCourse(MyCourse myCourse) async{
    try {
    
      final Response response = await myDio.post(MyApiUrlEndpoints.courseUploadEndPoint ,data: myCourse);
      response.statusCode != 200 ? debugPrint("====== Error here") : debugPrint("=== Successfully upload");
      return left(Success(value: response));
    } catch (e) {

      debugPrint("======== myCreateCourseApiService ||  uploadCourse method  ||  failed ========");
      return right(Failure(exception: e));
    } 
  }
}
