import 'package:flutter/material.dart';

class CreateCourseView extends StatelessWidget {
  const CreateCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Create your course now!'),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Course Title'
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'course description'
            ),
          ),
        ],
      ),
    );
  }
}