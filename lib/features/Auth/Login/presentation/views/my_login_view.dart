import 'package:courseup/constants/images.dart';
import 'package:courseup/core/constants.dart';
import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Auth/Login/presentation/widgets/my_login_form.dart';
import 'package:flutter/material.dart';

class MyLoginView extends StatelessWidget {
  const MyLoginView({super.key});

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
              'Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: MyColors.myPrimaryColor),
            ),
            const MyLoginForm(),
            const SizedBox(
              height: 60,
            ),
            const Row(
              children: [
                Text(
                  'Don\'t have an account yet?',
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    Navigator.pushNamed(context, MyPages.mySignupPage);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: MyColors.myPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
