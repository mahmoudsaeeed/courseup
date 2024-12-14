import 'package:courseup/core/constants.dart';
import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Auth/Login/presentation/widgets/my_login_form.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_shared_page.dart';
import 'package:flutter/material.dart';

class MyLoginView extends StatelessWidget {
  const MyLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: MySharedPage(
        myPageName: "Login",
        myCustomWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyLoginForm(),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Don\'t have an account yet?',
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
