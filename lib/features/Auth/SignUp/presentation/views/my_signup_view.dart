import 'package:courseup/features/Auth/SignUp/presentation/widgets/my_signup_form.dart';
import 'package:flutter/material.dart';

import '../../../sharedWidgets/my_form_container.dart';

class MySignupView extends StatelessWidget {
  const MySignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "CourseUp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/images/books.jpg"),
          //         fit: BoxFit.cover)),
          // height: MediaQuery.of(context).size.height,
          child: const Center(
            heightFactor: 2,
            child: MyFormContainer(
              myFormWidget: MySignupForm(),
            ),
          ),
        ),
      ),
    );
  }
}
