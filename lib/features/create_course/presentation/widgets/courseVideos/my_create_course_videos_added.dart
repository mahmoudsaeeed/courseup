import 'package:courseup/features/create_course/presentation/widgets/courseVideos/my_create_course_video_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyCreateCourseVideosAdded extends StatelessWidget {
  const MyCreateCourseVideosAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      child: ListView.separated(
        itemBuilder: (context, index) {
          // return Row(
          //   children: [const Text("hello"), Text("$index")],
          // );

          return const MyCreateCourseVideoCard();
        },
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: 8,
      ),
    );
  }
}
