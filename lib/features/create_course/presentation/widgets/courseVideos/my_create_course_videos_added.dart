import 'package:courseup/features/create_course/presentation/MyController/cubits/videoCubit/video_cubit.dart';
import 'package:courseup/features/create_course/presentation/widgets/courseVideos/my_create_course_video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MyCreateCourseVideosAdded extends StatelessWidget {
  const MyCreateCourseVideosAdded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, List<String?>>(
      builder: (context, state) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // return Row(
            //   children: [const Text("hello"), Text("$index")],
            // );
            return MyCreateCourseVideoCard(
              index: index,
            );
          },
          separatorBuilder: (context, index) => const Gap(10),
          itemCount: state.length,
        );
      },
    );
  }
}
