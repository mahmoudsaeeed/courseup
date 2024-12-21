import 'package:courseup/constants/images.dart';
import 'package:flutter/material.dart';

class MyCreateCourseImage extends StatelessWidget {
  const MyCreateCourseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("Pressed on image");
      },
      child: const Image(
        image: AssetImage(MyImages.book),
        fit: BoxFit.cover,
      ),
    );
  }
}
