import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/test.dart';
import 'package:flutter/material.dart';

import 'my_create_course_save_button.dart';

class MyCreateCourseFloatingRow extends StatelessWidget {
  const MyCreateCourseFloatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///////////////
          const Expanded(
            child: MyCreateCourseSaveButton(),
          ),
          ///////////////
          IconButton(
            onPressed: () {
              Test.showNotWorkMsg(context);
            },
            icon: const Icon(Icons.add),
            color: MyColors.myThirdColor,
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(MyColors.mySecondaryColor),
            ),
          )
        ],
      ),
    );
  }
}
