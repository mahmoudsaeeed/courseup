import 'package:courseup/constants/images.dart';
import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Auth/SignUp/presentation/widgets/my_signup_form.dart';
import 'package:flutter/material.dart';

class MySignupView extends StatelessWidget {
  const MySignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 250,
                child: Image(
                  image: AssetImage(appLogo),
                ),
              ),
              Text(
                'Signup',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: MyColors.myPrimaryColor),
              ),
              const MySignupForm(),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
