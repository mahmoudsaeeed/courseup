import 'package:courseup/features/EditProfile/presentation/widgets/my_ep_text_field.dart';
import 'package:flutter/material.dart';

class MyEpForm extends StatelessWidget {
  const MyEpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Form(
          child: Column(
        children: [
          MyEpTextField(myLabel: "Email Address"),
          MyEpTextField(myLabel: "Username"),
          MyEpTextField(
            myLabel: "Password",
            isPassword: true,
          ),
        
        ],
      )),
    );
  }
}
