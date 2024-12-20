import 'package:courseup/core/constants.dart';
import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/test.dart';
import 'package:flutter/material.dart';

class MyBottomRowLogin extends StatelessWidget {
  const MyBottomRowLogin({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Test.showNotWorkMsg(context);
          },
          child: const Text("Forget password"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, MyPages.mySignupPage);
          },
          child: Text(
            "Register",
            style: TextStyle(color: MyColors.myPrimaryColor),
          ),
        ),
      ],
    );
  }
}
