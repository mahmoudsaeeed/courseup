import 'package:courseup/features/Auth/ResetPassword/widgets/my_send_email_button.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_email_text_form.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_page_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyResetPasswordForm extends StatelessWidget {
  const MyResetPasswordForm({super.key, required this.myEmailController});
  final TextEditingController myEmailController;

  @override
  Widget build(BuildContext context) {
    return MyPageWithLogo(
      myPageName: "Reset Password",
      myCustomWidget: Form(
        child: Column(
          children: [
            MyEmailTextForm(myEmail: myEmailController),
            const Gap(40),
            MySendEmailButton(
              myEmailController: myEmailController,
            ),
          ],
        ),
      ),
    );
  }
}
