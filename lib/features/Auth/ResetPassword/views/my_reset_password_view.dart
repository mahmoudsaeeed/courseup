import 'package:courseup/features/Auth/ResetPassword/widgets/my_reset_password_form.dart';
import 'package:flutter/material.dart';

class MyResetPasswordView extends StatefulWidget {
  const MyResetPasswordView({super.key});

  @override
  State<MyResetPasswordView> createState() => _MyResetPasswordViewState();
}

class _MyResetPasswordViewState extends State<MyResetPasswordView> {
    late TextEditingController _myEmailController;

    @override
    void initState() {
      super.initState();
      _myEmailController = TextEditingController();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(child: MyResetPasswordForm(myEmailController: _myEmailController)),
      ),
    );
  }
}