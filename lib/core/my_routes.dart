import 'package:courseup/features/Auth/SignUp/presentation/views/my_signup_view.dart';
import 'package:courseup/features/Home/presentation/views/my_home_view.dart';
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
      builder: (context) => const MyHomeView(),
    );
  }
}
