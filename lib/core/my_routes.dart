import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/SignUp/presentation/views/my_signup_view.dart';
import 'package:courseup/features/Auth/auth_page/presentation/auth_page.dart';
import 'package:courseup/features/EditProfile/presentation/views/my_edit_profile_view.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Route<dynamic> myRoutes(RouteSettings settings) {
    switch (settings.name) {
      case MyPages.mySignupPage:
        {
          return MaterialPageRoute(
            builder: (context) => const MySignupView(),
          );
        }
      case MyPages.myEditProfilePage:
        {
          return MaterialPageRoute(
            builder: (context) => const MyEditProfileView(),
          );
        }
    }

    return MaterialPageRoute(
      builder: (context) => const AuthPage(),
    );
  }
}
