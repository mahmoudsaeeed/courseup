import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../sharedWidgetsBetweenScreens/my_button.dart';

class MySendEmailButton extends StatelessWidget {
  const MySendEmailButton({super.key, required this.myEmailController});

  final TextEditingController myEmailController;

  @override
  Widget build(BuildContext context) {
    return MyButton(
        buttonName: "Send Email",
        onPressed: () {
          FirebaseAuth.instance.sendPasswordResetEmail(
            email: myEmailController.text.trim(),
          );
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Check your email"),
              content: Text(
                  "Please , Chek your email and press the link on it to set new password , thank you!"),
            ),
          );
          Future.delayed(
            const Duration(seconds: 5),
            () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                MyPages.myLoginPage,
                (route) => false,
              );
            },
          );
        },
      
    );
  }
}
