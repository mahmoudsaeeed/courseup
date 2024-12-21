import 'package:courseup/features/Auth/SignUp/presentation/widgets/my_signup_btn.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_password_text_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../sharedWidgetsBetweenScreens/my_email_text_form.dart';
import '../../../../sharedWidgetsBetweenScreens/my_text_form_field.dart';

class MySignupForm extends StatefulWidget {
  const MySignupForm({super.key});

  @override
  State<MySignupForm> createState() => _MySignupFormState();
}

class _MySignupFormState extends State<MySignupForm> {
  late GlobalKey<FormState> _formState;

  late TextEditingController myNameController;
  late TextEditingController myEmailController;
  late TextEditingController myPasswordController;
  late TextEditingController mySecondPasswordController;
  @override
  void initState() {
    super.initState();
    _formState = GlobalKey<FormState>();
    myNameController = TextEditingController();
    myEmailController = TextEditingController();
    myPasswordController = TextEditingController();
    mySecondPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formState,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            MyTextFormField(
              myController: myNameController,
              myHint: "Username",
              myValidator: (input) {
                if (input!.isEmpty) {
                  return "please Enter your Name";
                } else {
                  return null;
                }
              },
            ),
            MyEmailTextForm(myEmail: myEmailController),
            MyPasswordTextForm(
              myPassword: myPasswordController,
              checkPassword: true,
            ),
            MyPasswordTextForm(
              myPassword: mySecondPasswordController,
              myHint: "Repeat password",
              checkPassword: true,
              isRepeatedPassword: true,
              myRepeatedValidator: (value) {
                if (value != myPasswordController.text) {
                  return "Passwords doesn't matches";
                } else {
                  return null;
                }
              },
            ),
            const Gap(30),
            MySignupBtn(
              formState: _formState,
              myButtonText: "SignUp",
              myNameController: myNameController,
              myEmailController: myEmailController,
              myPasswordController: myPasswordController,
              mySecondPasswordController: mySecondPasswordController,
            ),
          ],
        ));
  }
}
