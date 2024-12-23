import 'package:courseup/features/create_course/presentation/MyController/cubits/cubit/add_video_cubit.dart';
import 'package:courseup/features/create_course/presentation/MyController/provider/my_course_updating_data.dart';
import 'package:courseup/features/create_course/presentation/widgets/courseVideos/my_create_course_videos_added.dart';
import 'package:courseup/features/create_course/presentation/widgets/floatingButton/my_create_course_floating_row.dart';
import 'package:courseup/features/create_course/presentation/widgets/courseInfo/my_create_course_form.dart';
import 'package:courseup/features/create_course/presentation/widgets/courseImage/my_create_course_image_container.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyCreateCourseView extends StatefulWidget {
  const MyCreateCourseView({super.key});

  @override
  State<MyCreateCourseView> createState() => _MyCreateCourseViewState();
}

class _MyCreateCourseViewState extends State<MyCreateCourseView> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCourseUpdatingData>(
      create: (context) => MyCourseUpdatingData(),
      builder: (context, child) => BlocProvider(
        create: (context) => AddVideoCubit(),
        child: MyMainAppBar(
          //? provide a provider here
          myBody: SingleChildScrollView(
            child: Column(
              children: [
                const MyCourseImageContainer(),
                MyCreateCourseForm(formState: formState),
                const MyCreateCourseVideosAdded(),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
          myFloatingButton: MyCreateCourseFloatingRow(formState: formState),
          myFloatingButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
