part of 'my_course_data_cubit.dart';

sealed class MyCourseDataState {
  const MyCourseDataState();
}

final class MyCourseDataInitial extends MyCourseDataState {}

final class MyCourseDataLoading extends MyCourseDataState {}

final class MyCourseDataSuccess extends MyCourseDataState {
  final MyCourse myCourse;

  MyCourseDataSuccess({required this.myCourse});
}

final class MyCourseDataFailed extends MyCourseDataState {
  final String errorMessage;

  MyCourseDataFailed({required this.errorMessage});
}

class MyCourseDataError extends MyCourseDataState {
  
}