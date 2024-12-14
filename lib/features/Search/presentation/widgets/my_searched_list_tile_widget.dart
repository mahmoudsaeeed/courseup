import 'package:courseup/features/create_course/domain/my_course_entity.dart';
import 'package:flutter/material.dart';

class MySearchedListTileWidget extends StatelessWidget {
  const MySearchedListTileWidget({super.key, required this.myCourse, required this.myController,});

  final MyCourseEntity myCourse;
  final SearchController myController;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text("leading"),
      ),
      title: Text(myCourse.title),
      subtitle: Text(myCourse.description),
      onTap: () {
        debugPrint("item ${myCourse.title} is Created");
      },
    );
  }
}
