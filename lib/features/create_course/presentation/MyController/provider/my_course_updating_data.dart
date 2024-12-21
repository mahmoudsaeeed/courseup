import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:flutter/material.dart';

/*
  ? this provider is responsible at notifiy any editing occure in course object
  ? there exist two method
  ! uploadImage
  ! updateData


 */

class MyCourseUpdatingData extends ChangeNotifier {
  MyCourse myCourse = MyCourse();

  void uploadImage(String imgPath) {
    myCourse.imageUrl = imgPath;
    notifyListeners();
  }

  void uploadData(MyCourse course) {
    myCourse.courseId = course.courseId;
    myCourse.title = course.title;
    myCourse.description = course.description;
    myCourse.price = course.price;
    notifyListeners();
    // myCourse.publisherId = publisherId;
    // myCourse.title = title;
    // myCourse.description = description;
    // myCourse.videosUrl =
  }

  void uploadVideos(List<String> vidoesUrl) {
    myCourse.videosUrl = vidoesUrl;
    notifyListeners();
  }
}
