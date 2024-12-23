import 'package:courseup/features/create_course/domain/repositories/my_create_course_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/my_course.dart';

part 'my_course_data_state.dart';

class MyCourseDataCubit extends Cubit<MyCourseDataState> {
  late MyCourse myCourse;
  final MyCreateCourseRepoInterface myRepo;

  MyCourseDataCubit({required this.myRepo}) : super(MyCourseDataInitial()) {
    myCourse = MyCourse();
  }

  Future<void> uploadImage(String imgPath) async {
    //TODO  emit هشوف بديل ل الاستيت
    /*
    TODO المفروض ان الاستيت تتغير بالقيمة الجديد للكورس
     */
    emit(MyCourseDataLoading());
    try {
      final response = await myRepo.uploadCourseImage(imgPath);
      response.fold(
        (success) {
          myCourse.imageUrl = imgPath;
          emit(MyCourseDataSuccess(myCourse: myCourse));
        },
        (failed) {
          emit(MyCourseDataFailed(errorMessage: "Image Not Found"));
        },
      );
    } catch (e) {
      emit(MyCourseDataFailed(errorMessage: e.toString()));
    }
  }

  void takeImg(String imageUrl) {
    myCourse.imageUrl = imageUrl;
  }

  void takeTitle(String title) {
    emit(MyCourseDataLoading());
    myCourse.title = title;
    emit(MyCourseDataSuccess(myCourse: myCourse));
  }

  void takePrice(double? price) {
    emit(MyCourseDataLoading());
    if (price != null) {
      myCourse.price = price;
      emit(MyCourseDataSuccess(myCourse: myCourse));
    } else {
      emit(MyCourseDataFailed(errorMessage: "title not found"));
    }
  }

  void takeDescription(String? description) {
    emit(MyCourseDataLoading());
    if (description != null) {
      myCourse.description = description;
      emit(MyCourseDataSuccess(myCourse: myCourse));
    } else {
      emit(MyCourseDataFailed(errorMessage: "title not found"));
    }
  }

  void uploadVideos(List<String>? vidoesUrl) {
    emit(MyCourseDataLoading());
    if (vidoesUrl != null) {
      myCourse.videosUrl = vidoesUrl;
      emit(MyCourseDataSuccess(myCourse: myCourse));
    } else {
      emit(MyCourseDataFailed(errorMessage: "title not found"));
    }
  }
}
