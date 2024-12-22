import 'package:flutter/material.dart';

class MyCreateCourseVideoCard extends StatelessWidget {
  const MyCreateCourseVideoCard({super.key});
//TODO recieved video title and the state of video
  @override
  Widget build(BuildContext context) {
    return const Card(
        margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("chapter 1 : hello world"),
          Icon(Icons.cloud_done_outlined),
        ],
      ),
    );
  }
}
