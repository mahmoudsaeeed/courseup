part of 'my_upload_course_cubit.dart';

sealed class MyUploadCourseState {
  const MyUploadCourseState();
}

final class MyUploadCourseInitial extends MyUploadCourseState {}

final class MyUploadCourseLoading extends MyUploadCourseState {}

final class MyUploadCourseSuccess extends MyUploadCourseState {
  final MyCourse myCourse;

  MyUploadCourseSuccess({required this.myCourse});
}

final class MyUploadCourseFailed extends MyUploadCourseState {
  final Object errMessage;

  MyUploadCourseFailed({required this.errMessage});
}
