import 'package:courseup/features/create_course/presentation/widgets/floatingButton/my_create_course_add_video_button.dart';
import 'package:flutter/material.dart';

import 'my_create_course_save_button.dart';

class MyCreateCourseFloatingRow extends StatelessWidget {
  const MyCreateCourseFloatingRow({super.key, required this.formState});
  final GlobalKey<FormState> formState;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //^  =====   Save Button =====  ^\\
          Expanded(
            child: MyCreateCourseSaveButton(formState: formState),
          ),
          //^  ======     add videos icon  ===== ^\\

          const MyCreateCourseAddVideoButton(),
        ],
      ),
    );
  }
}
