import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/create_course/presentation/MyController/cubits/cubit/add_video_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ///////////////
          Expanded(
            child: MyCreateCourseSaveButton(formState: formState),
          ),
          ///////////////
          IconButton(
            onPressed: () async {
              final picker = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type: FileType.custom,
                allowedExtensions: [
                  'MP4',
                  'MOV',
                  'WAV',
                  'FLV',
                  'WebM',
                ],
              );
              if(picker != null) {
                List<String?> videoPaths = picker.files.map((file) => file.path).toList();
                if(videoPaths.isNotEmpty) {
                  context.read<AddVideoCubit>().addVideo(videoPaths);
                }
              }
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
