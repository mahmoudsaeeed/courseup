import 'package:courseup/features/Auth/Login/presentation/widgets/my_bottom_row_login.dart';
import 'package:courseup/features/Auth/Login/presentation/widgets/my_login_btn.dart';
import 'package:courseup/features/Auth/sharedWidgets/my_form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({super.key});

  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  late TextEditingController myEmail;
  late TextEditingController myPassword;
  late GlobalKey<FormState> _formState;
  @override
  void initState() {
    super.initState();

    myEmail = TextEditingController();
    myPassword = TextEditingController();
    _formState = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    RegExp myEmailExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return Form(
        key: _formState,
        child: Column(
          children: [
            MyTextFormField(
              myController: myEmail,
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
              myController: myPassword,
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
            const Gap(60),
            MyLoginBtn(
              myButtonText: "Login",
              formState: _formState,
              myEmail: myEmail,
              myPassword: myPassword,
            ),
            const MyBottomRowLogin(),
          ],
        ));
  }
}
