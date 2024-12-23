import 'package:flutter/material.dart';

import 'my_text_form_field.dart';

class MyPasswordTextForm extends StatelessWidget {
  const MyPasswordTextForm({
    super.key,
    required this.myPassword,
    this.checkPassword = false,
    this.myHint = "Password",
    this.myRepeatedValidator,
    this.isRepeatedPassword = false,
  });
  final TextEditingController myPassword;
  final bool checkPassword;
  final String myHint;
  final String? Function(String?)? myRepeatedValidator;
  final bool isRepeatedPassword;
  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      myController: myPassword,
      myHint: myHint,
      isSecret: true,
      myValidator: (input) {
        RegExp passwordRegex = RegExp(
            // r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
            r'^[a-zA-Z\d]{6,}$');

        if (input!.isEmpty) {
          return "please Enter your password";
        } else if (input.length < 4) {
          return "password should be more than 3 character";
        } else if (checkPassword && !passwordRegex.hasMatch(input)) {
          return "Weak Password";
        } else if (isRepeatedPassword) {
          return myRepeatedValidator!(input);
        } else {
          return null;
        }
      },
    );
  }
}
