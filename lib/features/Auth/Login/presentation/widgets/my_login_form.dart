import 'package:courseup/core/constants.dart';
import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Auth/Login/presentation/widgets/my_login_btn.dart';
import 'package:courseup/features/Auth/sharedPresentation/sharedWidgets/my_email_text_form.dart';
import 'package:courseup/features/Auth/sharedPresentation/sharedWidgets/my_password_text_form.dart';
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
    return Form(
        key: _formState,
        child: Column(
          children: [
            MyEmailTextForm(myEmail: myEmail),
            MyPasswordTextForm(myPassword: myPassword),
            // const Gap(10),
            Row(
              children: [
                TextButton(
                  onPressed: () {

                    Navigator.pushNamed(context, MyPages.myResetPassword);
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: MyColors.myPrimaryColor),
                  ),
                ),
              ],
            ),
            const Gap(10),
            MyLoginBtn(
              myButtonText: "Login",
              formState: _formState,
              myEmail: myEmail,
              myPassword: myPassword,
            ),
          ],
        ));
  }
}
