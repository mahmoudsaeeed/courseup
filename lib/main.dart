import 'package:courseup/core/my_routes.dart';
import 'package:courseup/features/Auth/Login/presentation/views/my_login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // onGenerateRoute: (settings) {
      //   if (settings.name == "login") {
      //     return MaterialPageRoute(
      //       builder: (context) => MyLoginView(),
      //     );
      //   }
      // },
      onGenerateRoute: (settings) => MyRoutes.myRoutes(settings),
      home: const MyLoginView(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Tester"),
      ),
    );
  }
}
