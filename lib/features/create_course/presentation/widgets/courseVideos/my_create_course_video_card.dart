import 'package:courseup/features/sharedWidgetsBetweenScreens/my_text_form_field.dart';
import 'package:flutter/material.dart';

class MyCreateCourseVideoCard extends StatelessWidget {
  final int index;
  final TextEditingController myController;
  const MyCreateCourseVideoCard({super.key, required this.index, required this.myController});

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
            // Expanded(
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Video ${index + 1}: hello world'
            //     ),
            //   ),
            // ),
            Expanded(child: 
            MyTextFormField(myController: myController, myHint: "write the name of video $index here "),),
            // Text("chapter 1 : hello world"),
            const Icon(Icons.cloud_done_outlined),
          ],
        ),
      ),
    );
  }
}
