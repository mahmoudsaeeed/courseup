
import 'package:courseup/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../MyController/provider/my_course_updating_data.dart';

class MyCreateCourseImage extends StatelessWidget {
  const MyCreateCourseImage({super.key});

  @override
  Widget build(BuildContext context) {
    final myCourseProvided = context.read<MyCourseUpdatingData>();
    return Stack(
      fit: StackFit.expand,
      children: [
        InkWell(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? pickedFile = await picker.pickImage(
                source: ImageSource.gallery,
              );
              if(pickedFile != null){
                myCourseProvided.uploadImage(pickedFile.path);
              }

            },
            child: myCourseProvided.myCourse.imageUrl != ""
                ? const Image(
                    image: AssetImage(MyImages.book),
                    fit: BoxFit.cover,
                  )
                : const Center(
                    widthFactor: 2,
                    child: Text(
                      "Press to upload course image",
                      textAlign: TextAlign.center,
                    ),
                  )),
        // Positioned(
        //   top: 130,
        //   left: MediaQuery.sizeOf(context).width / 2 - 80,
        //   child: MyChangeImageIcon(
        //     onPressed: () {
        //       debugPrint("Help");
        //     },
        //   ),
        // ),
      ],
    );
  }
}
