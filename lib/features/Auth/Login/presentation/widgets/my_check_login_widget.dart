import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCheckLoginWidget extends StatelessWidget {
  const MyCheckLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AuthAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MyPages.myOnboardingScreen,
            (route) => false,
          ).then(
            (value) async {
              final myPage = await SharedPreferences.getInstance();
              myPage.setInt(MyKeys.currentPage, 0);
            },
          );
        } else if (state is AuthError) {
          debugPrint("myCheckLogin   ||   Error happene =============");
          Navigator.pop(context);
        }
          return Center(
            child: Text("Error happend please close app and open it again"),
          );
        }
      
    );
  }
}
