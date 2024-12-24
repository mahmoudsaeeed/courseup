part of 'my_get_courses_cubit.dart';

sealed class MyGetCoursesState extends Equatable {
  const MyGetCoursesState();

  @override
  List<Object> get props => [];
}

final class MyGetCoursesInitial extends MyGetCoursesState {}

final class MyGetCoursesLoading extends MyGetCoursesState {}

final class MyGetCoursesSuccess extends MyGetCoursesState {
  final List<MyCourse> myData;

  const MyGetCoursesSuccess({required this.myData});
}

final class MyGetCoursesFailed extends MyGetCoursesState {
  final String errMessage;

  const MyGetCoursesFailed({required this.errMessage});
}
