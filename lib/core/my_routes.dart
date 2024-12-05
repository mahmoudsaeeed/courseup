import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/SignUp/presentation/views/my_signup_view.dart';
import 'package:courseup/features/Auth/auth_page/presentation/auth_page.dart';
import 'package:courseup/features/EditProfile/presentation/views/my_edit_profile_view.dart';
import 'package:courseup/features/ViewProfile/presentation/views/my_view_profile.dart';
import 'package:courseup/features/Auth/Login/presentation/views/my_login_view.dart';
import 'package:courseup/features/onboarding/onboarding_screen.dart';
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
      case MyPages.myLoginPage:
        {
          return MaterialPageRoute(builder: (context) => const MyLoginView());
        }
      case MyPages.myOnboardingScreen:
        {
          return MaterialPageRoute(builder: (context) => OnboardingScreen());
        }
      case MyPages.myEditProfilePage:
        {
          return MaterialPageRoute(
              builder: (context) => const MyEditProfileView());
        }
      case MyPages.myViewProfilePage:
        {
          return MaterialPageRoute(builder: (context) => const MyViewProfile());
        }
    }

    return MaterialPageRoute(
      builder: (context) => const AuthPage(),
    );
  }
}
