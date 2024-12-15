import 'package:courseup/constants/images.dart';
import 'package:courseup/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFirstTime = true;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    _checkFirstTime();
  }
  // @override
  // void initState() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.pushReplacementNamed(context, MyPages.myOnboardingScreen);
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool? hasSeenWelcome = prefs.getBool('hasSeenWelcome') ?? false;

    if (hasSeenWelcome) {
      setState(() {
        _isFirstTime = false;
      });
    } else {
      await prefs.setBool('hasSeenWelcome', true);
    }

    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    if (_isFirstTime) {
      Navigator.pushReplacementNamed(
        context,
        MyPages.myOnboardingScreen,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        MyPages.myBottomNavigator,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image(image: AssetImage(MyImages.appLogo)),
      ),
    );
  }
}
