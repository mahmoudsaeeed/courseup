import 'dart:io';

import 'package:courseup/features/create_course/presentation/MyController/providers/my_course_img_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyCreateCourseImage extends StatelessWidget {
  const MyCreateCourseImage({super.key});

  @override
  Widget build(BuildContext context) {
    final mySaveImgProvider = Provider.of<MyCourseImgProvider>(context,listen: false);
    return InkWell(onTap: () async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        mySaveImgProvider.saveImageUrl(path: pickedFile.path);
        // myUploadBlocProvider.uploadImage(pickedFile.path.toString());
      }
    }, child: Consumer<MyCourseImgProvider>(
      builder: (context, imgUrlProvider, child) {
        if (imgUrlProvider.getImgUrl() != "") {
          File myImage = File(imgUrlProvider.getImgUrl());
          return Image(
            image: FileImage(myImage),
            fit: BoxFit.cover,
          );
        } else {
          return const Center(
            widthFactor: 2,
            child: Text(
              "Press to upload course image",
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    ));
  }
}
