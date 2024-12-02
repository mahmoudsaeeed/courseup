import 'package:courseup/features/Auth/SignUp/presentation/widgets/my_signup_btn.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../sharedPresentation/sharedWidgets/my_form_input_field.dart';

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
    RegExp myEmailExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
            MyTextFormField(
              myController: myEmailController,
              myHint: "Email",
              myValidator: (input) {
                if (input!.isEmpty) {
                  return "please Enter your email";
                } else if (!myEmailExp.hasMatch(input)) {
                  return "Please Enter valid email";
                } else {
                  return null;
                }
              },
            ),
            MyTextFormField(
              myController: myPasswordController,
              myHint: "Password",
              isSecret: true,
              myValidator: (input) {
                if (input!.isEmpty) {
                  return "please Enter your password";
                } else {
                  return null;
                }
              },
            ),
            MyTextFormField(
              myController: mySecondPasswordController,
              myHint: "repeat Password",
              isSecret: true,
              myValidator: (input) {
                if (input!.isEmpty) {
                  return "please Enter your password";
                } else {
                  return null;
                }
              },
            ),
            const Gap(60),
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
