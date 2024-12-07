import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/Login/presentation/views/my_login_view.dart';
import 'package:courseup/features/Auth/SignUp/presentation/views/my_signup_view.dart';
import 'package:courseup/features/Auth/auth_page/presentation/auth_page.dart';
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
      case MyPages.myAuthPage:
        {
          return MaterialPageRoute(builder: (context) => const AuthPage());
        }
    }

    return MaterialPageRoute(
      builder: (context) => const AuthPage(),
    );
  }
}
