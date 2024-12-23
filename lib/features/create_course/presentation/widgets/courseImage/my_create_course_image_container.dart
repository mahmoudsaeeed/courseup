import 'package:flutter/material.dart';

import '../../../../../core/utils/my_colors.dart';
import 'my_create_course_image.dart';

class MyCourseImageContainer extends StatelessWidget {
  const MyCourseImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 150,
      decoration: BoxDecoration(
        color: MyColors.mySecondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: const MyCreateCourseImage(),
    );
  }
}
