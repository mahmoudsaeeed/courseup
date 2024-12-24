import 'package:courseup/features/create_course/presentation/MyController/cubits/videoCubit/video_cubit.dart';
import 'package:courseup/features/create_course/presentation/widgets/courseVideos/my_create_course_video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MyCreateCourseVideosAdded extends StatefulWidget {
  const MyCreateCourseVideosAdded({
    super.key,
  });

  @override
  State<MyCreateCourseVideosAdded> createState() =>
      _MyCreateCourseVideosAddedState();
}

class _MyCreateCourseVideosAddedState extends State<MyCreateCourseVideosAdded> {
  //? list of videos name
  List<TextEditingController> myContollers = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, List<String?>>(
      builder: (context, state) {
        //? add all controllers in the list
        for (var i = 0; i < state.length; i++) {
          myContollers.add(TextEditingController());
        }
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // return Row(
            //   children: [const Text("hello"), Text("$index")],
            // );
            return MyCreateCourseVideoCard(
              index: index,
              //? assigned the specific controller to his widget
              myController: myContollers[index],
            );
          },
          separatorBuilder: (context, index) => const Gap(10),
          itemCount: state.length,
        );
      },
    );
  }
}
