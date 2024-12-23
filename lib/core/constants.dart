import 'package:flutter/material.dart';

class MyPages {
  static const String mySplashScreen = "/";
  static const String myLoginPage = "login";
  static const String mySignupPage = "signup";
  static const String myOnboardingScreen = "onboarding_screen";
  static const String myHomePage = 'home_page';
  static const String myAuthPage = 'auth_page';
  static const String myViewPage = "view_profile";
  static const String myUpdateProfilePage = "update_profile";
  static const String myResetPassword = "resetPassword";
  static const String myBottomNavigator = "myBottomNavigator";
  // static const String myHomePage = "/";
}

class MyCustomFonts {
  static const TextStyle largerText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800);

  static const TextStyle smallText =
      TextStyle(fontSize: 15, color: Colors.black54);

  static const TextStyle mediumBoldText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}

/// [MyKeys] is a calss which has all keys stored in sharedPreferences
class MyKeys {
  static const String currentPage = 'currPage';
  /// [myCourseImg] is a key that reflect on imgUrl caching in shared preferences
  static const String myCourseImg = 'courseImg';
}

class MyApiUrlEndpoints {
  static const String baseUrl = "http://localhost:3000/";
  static const String courseUploadEndPoint = "";
}
