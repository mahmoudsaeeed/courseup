import 'package:courseup/features/create_course/presentation/MyController/cubits/myCourseDataCubit/my_course_data_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/my_colors.dart';
import '../../MyController/cubits/videoCubit/video_cubit.dart';

class MyCreateCourseAddVideoButton extends StatelessWidget {
  const MyCreateCourseAddVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final vidCubit = BlocProvider.of<VideoCubit>(context ,listen: false);
    // final vidCubit = context.read<VideoCubit>();
    final myCourseCubit = BlocProvider.of<MyCourseDataCubit>(context ,listen: false);
    // final myCourseCubit = context.read<MyCourseDataCubit>();

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
          List<String> videoPaths =
            //? the file must have a path
              picker.files.map((file) => file.path!).toList();
          if (videoPaths.isNotEmpty) {
            vidCubit.addVideo(videoPaths);
            myCourseCubit.takeVideos(videoPaths);
          }
        }
      },
      icon: const Icon(Icons.add),
      color: MyColors.myThirdColor,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(MyColors.mySecondaryColor),
      ),
    );
  }
}
