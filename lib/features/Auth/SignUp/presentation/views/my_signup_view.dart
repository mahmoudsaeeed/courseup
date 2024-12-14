import 'package:courseup/features/Auth/SignUp/presentation/widgets/my_signup_form.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_shared_page.dart';
import 'package:flutter/material.dart';

class MySignupView extends StatelessWidget {
  const MySignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: MySharedPage(
          myPageName: "Sign Up",
          myCustomWidget: Column(
            children: [
              MySignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
