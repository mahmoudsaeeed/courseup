import 'package:courseup/features/sharedWidgetsBetweenScreens/my_email_text_form.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_password_text_form.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_text_form_field.dart';
import 'package:flutter/material.dart';

class MyEpForm extends StatefulWidget {
  const MyEpForm({super.key});

  @override
  State<MyEpForm> createState() => _MyEpFormState();
}

class _MyEpFormState extends State<MyEpForm> {
  late TextEditingController myEmail;
  late TextEditingController myUsername;
  late TextEditingController myPassword;

  @override
  void initState() {
    super.initState();
    myEmail = TextEditingController();
    myUsername = TextEditingController();
    myPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          MyEmailTextForm(myEmail: myEmail),
          MyTextFormField(myController: myUsername, myHint: "Username"),
          MyPasswordTextForm(myPassword: myPassword)
        ],
      )),
    );
  }
}
