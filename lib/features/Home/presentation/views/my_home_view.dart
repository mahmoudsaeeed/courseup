import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  final String username;
  const MyHomeView({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Hello, $username"),),
    );
  }
}