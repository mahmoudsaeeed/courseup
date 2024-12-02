import 'package:courseup/features/Auth/Login/presentation/widgets/my_login_form.dart';
import 'package:courseup/features/Auth/sharedPresentation/sharedWidgets/my_form_container.dart';
import 'package:flutter/material.dart';

class MyLoginView extends StatelessWidget {
  const MyLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
              myFormWidget: MyLoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
