import 'package:bloc/bloc.dart';
import 'package:courseup/features/Home/data/repository/my_repo_impl.dart';
import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:equatable/equatable.dart';

part 'get_courses_state.dart';

class MyGetCourseCubit extends Cubit<MyGetCoursesState> {
  MyGetCourseCubit({required this.myRepo}) : super(MyGetCoursesInitial());

  final MyRepoImpl myRepo;

  Future<void> getAllCourses() async {
      emit(MyGetCoursesLoading());
      final myData = await myRepo.getAllCourses();
      myData.fold(
        (success) {
          emit(MyGetCoursesSuccess(myData: success));
        },
        (failed) {
          emit(
            MyGetCoursesFailed(errMessage: failed.failureMessage!),
          );
        },
      );
  }
}
