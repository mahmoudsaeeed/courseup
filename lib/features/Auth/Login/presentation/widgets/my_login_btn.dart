import 'dart:developer';

import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLoginBtn extends StatelessWidget {
  const MyLoginBtn({
    super.key,
    required this.formState,
    required this.myButtonText,
    required this.myEmail,
    required this.myPassword,
  });
  final GlobalKey<FormState> formState;
  final String myButtonText;

  final TextEditingController myEmail;
  final TextEditingController myPassword;

  @override
  Widget build(BuildContext context) {
    return MyButton(
        onPressed: () {
          if (formState.currentState!.validate()) {
            debugPrint("validation success");
            // MyUser myUser = MyUser(email: myEmail.text , );
            // BlocProvider.of<AuthCubit>(context).login(
            //   myUser, //!  change to myEmail not myUser
            //   myPassword.text,
            // );
            //TODO check if data is correct and stored
            //TODO navigate to home page
            log(myEmail.text);
            log(myPassword.text);
              BlocProvider.of<AuthCubit>(context)
                .login(myEmail.text.trim(), myPassword.text);
            Navigator.pushReplacementNamed(context, MyPages.myBottomNavigator);
          } else {
            debugPrint("Validation error");
          }
        },
        buttonName: myButtonText,
    );
  }
}
