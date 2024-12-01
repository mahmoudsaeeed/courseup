import 'package:courseup/features/Auth/SignUp/presentation/views/my_signup_view.dart';
import 'package:courseup/features/Auth/auth_page/presentation/auth_page.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Route<dynamic> myRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "signup":
        {
          return MaterialPageRoute(
            builder: (context) => const MySignupView(),
          );
        }
    }

    return MaterialPageRoute(
      builder: (context) => const AuthPage(),
    );
  }
}
