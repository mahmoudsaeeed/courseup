import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/ResetPassword/views/my_reset_password_view.dart';
import 'package:courseup/features/Auth/SignUp/presentation/views/my_signup_view.dart';
import 'package:courseup/features/Auth/auth_page/presentation/auth_page.dart';
import 'package:courseup/features/Auth/Login/presentation/views/my_login_view.dart';
import 'package:courseup/features/EditProfile/presentation/views/my_edit_profile_view.dart';
import 'package:courseup/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../features/BottomNavigator/presentation/widgets/my_bottom_navigator.dart';
import '../features/ViewProfile_2/presentation/views/my_view_profile.dart';

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
      case MyPages.myViewPage:
      {
          return MaterialPageRoute(builder: (context) => const MyViewProfile());

      }
      case MyPages.myUpdateProfilePage:
      {
          return MaterialPageRoute(builder: (context) => const MyEditProfileView());

      }
      case MyPages.myResetPassword:
      {
          return MaterialPageRoute(builder: (context) => const MyResetPasswordView());

      }
      case MyPages.myBottomNavigator:
      {
          return MaterialPageRoute(builder: (context) => const MyBottomNavigator());

      }
    }

    return MaterialPageRoute(
      builder: (context) => const AuthPage(),
    );
  }
}
