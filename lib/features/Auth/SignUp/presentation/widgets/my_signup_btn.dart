import 'dart:developer';

import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/my_colors.dart';
import '../../../data/models/my_user.dart';

class MySignupBtn extends StatelessWidget {
  const MySignupBtn({
    super.key,
    required this.formState,
    required this.myButtonText,
    required this.myNameController,
    required this.myEmailController,
    required this.myPasswordController,
    required this.mySecondPasswordController,
  });
  final GlobalKey<FormState> formState;
  final String myButtonText;

  final TextEditingController myNameController;
  final TextEditingController myEmailController;
  final TextEditingController myPasswordController;
  final TextEditingController mySecondPasswordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.secondaryColor,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: () {
          if (formState.currentState!.validate()) {
            debugPrint("validation success");

            MyUser myUser = const MyUser();
            myUser = myUser.copyWith(
              name: myNameController.text,
              email: myEmailController.text,
            );

            
            log(myNameController.text);
            log(myEmailController.text);
            log(myPasswordController.text);

            BlocProvider.of<AuthCubit>(context).signup(
              myUser,
              myPasswordController.text,
            );
            Navigator.of(context).pushReplacementNamed(MyPages.myAuthPage);
            debugPrint("email here = ${myUser.email}");
            // context.read<AuthCubit>().signup(myUser, myPasswordController.text);
          } else {
            debugPrint("Validation error");
          }
        },
        child: Text(
          myButtonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
