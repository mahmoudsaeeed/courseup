import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/my_colors.dart';
import '../../MyController/cubits/cubit/add_video_cubit.dart';

class MyCreateCourseAddVideoButton extends StatelessWidget {
  const MyCreateCourseAddVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
        final vidCubit = context.read<AddVideoCubit>();

    return IconButton(
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
              if (picker != null) {
                List<String?> videoPaths =
                    picker.files.map((file) => file.path).toList();
                if (videoPaths.isNotEmpty) {
                  vidCubit.addVideo(videoPaths);
                }
              }
            },
            icon: const Icon(Icons.add),
            color: MyColors.myThirdColor,
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(MyColors.mySecondaryColor),
            ),
          );
  }
}