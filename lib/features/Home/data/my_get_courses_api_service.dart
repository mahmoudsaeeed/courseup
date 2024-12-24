import 'package:courseup/core/constants.dart';
import 'package:courseup/core/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyGetCoursesApiService {
  late Dio myDio;
  MyGetCoursesApiService() {
    BaseOptions myOptions = BaseOptions(
      baseUrl: MyApiUrlEndpoints.baseUrl,
    );
    myDio = Dio(myOptions);
  }

  Future<Either<Success<Response>, FailureMessage>> getAllCourses() async{
    try {
    
      final Response response = await myDio.get(MyApiUrlEndpoints.courseGetEndPoint);
      response.statusCode != 200 ? debugPrint("====== Error here") : debugPrint("=== Successfully get");
      return left(Success(value: response));
    } catch (e) {

      debugPrint("======== myCreateCourseApiService ||  uploadCourse method  ||  failed ========");
      return right(FailureMessage(failureMessage: e.toString()));
    } 
  }
}
