import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../sharedWidgetsBetweenScreens/my_button.dart';
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
    return MyButton(
      buttonName: "SignUp",
      onPressed: () {
        if (formState.currentState!.validate()) {
          debugPrint("validation success");

          MyUser myUser = const MyUser();
          myUser = myUser.copyWith(
            name: myNameController.text,
            email: myEmailController.text,
          );

          MyUserEntity userEntity = myUser.toEntity();

          BlocProvider.of<AuthCubit>(context).signup(
            userEntity,
            myPasswordController.text,
          );
          Navigator.of(context).pushReplacementNamed(MyPages.myAuthPage);
          debugPrint("email here = ${myUser.email}");
          // context.read<AuthCubit>().signup(myUser, myPasswordController.text);
        } else {
          debugPrint("Validation error");
        }
      },
    );
  }
}
