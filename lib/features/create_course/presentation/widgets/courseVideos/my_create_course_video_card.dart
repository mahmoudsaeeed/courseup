import 'package:flutter/material.dart';

class MyCreateCourseVideoCard extends StatelessWidget {
  final int index;
  const MyCreateCourseVideoCard({super.key, required this.index});
//TODO recieved video title and the state of video
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Video ${index + 1}: hello world'
                ),
              ),
            ),
            // Text("chapter 1 : hello world"),
            const Icon(Icons.cloud_done_outlined),
          ],
        ),
      ),
    );
  }
}
