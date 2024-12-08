import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/sharedPresentation/sharedWidgets/my_email_text_form.dart';
import 'package:courseup/features/Auth/sharedPresentation/sharedWidgets/my_form_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyResetPasswordForm extends StatelessWidget {
  const MyResetPasswordForm({super.key, required this.myEmailController});
  final TextEditingController myEmailController;
  @override
  Widget build(BuildContext context) {
    return MyFormContainer(
      myFormWidget: Form(
        child: Column(
          children: [
            MyEmailTextForm(myEmail: myEmailController),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(
                  email: myEmailController.text.trim(),
                )
                    .then(
                  (val) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text("Sending email"),
                          content: Text(
                              "Please Check your email messages and press on link to enter new password"),
                        );
                      },
                    );

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, MyPages.myLoginPage);
                      },
                      child: const Text("Ok"),
                    );
                  },
                );
              },
              child: const Text("Send email"),
            ),
          ],
        ),
      ),
    );
  }
}
