import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_email_text_form.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_password_text_form.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_text_form_field.dart';
import 'package:flutter/material.dart';

class MyEpForm extends StatefulWidget {
  const MyEpForm({super.key, required this.myUser});
  final MyUserEntity myUser;
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
    myEmail = TextEditingController(text: widget.myUser.email);
    myUsername = TextEditingController(text: widget.myUser.name);
    // myPassword = TextEditingController(text: widget.myUser.);
  }

  @override
  void dispose() {
    debugPrint("closed");
    super.dispose();
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
