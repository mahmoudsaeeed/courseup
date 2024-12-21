import 'package:courseup/features/create_course/presentation/widgets/floatingButton/my_create_course_floating_row.dart';
import 'package:courseup/features/create_course/presentation/widgets/courseInfo/my_create_course_form.dart';
import 'package:courseup/features/create_course/presentation/widgets/courseImage/my_create_course_image_container.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_main_app_bar.dart';
import 'package:flutter/material.dart';

class MyCreateCourseView extends StatelessWidget {
  const MyCreateCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyMainAppBar(
      myBody: Column(
        children: [
          MyCourseImageContainer(),
          MyCreateCourseForm(),

        ],
      ),
      myFloatingButton: MyCreateCourseFloatingRow(),
      myFloatingButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
