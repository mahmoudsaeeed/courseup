import 'package:flutter/material.dart';

import 'my_text_form_field.dart';

class MyEmailTextForm extends StatelessWidget {
  const MyEmailTextForm({super.key, required this.myEmail});

  final TextEditingController myEmail;
  @override
  Widget build(BuildContext context) {
  final RegExp myEmailExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return MyTextFormField(
              myController: myEmail,
              myHint: "Email",
              isEmail: true,
              myValidator: (input) {
                if (input!.isEmpty) {
                  return "please Enter your email";
                } else if (!myEmailExp.hasMatch(input)) {
                  return "Please Enter valid email";
                } else {
                  return null;
                }
              },
            );
  }
}