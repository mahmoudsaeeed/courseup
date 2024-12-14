import 'package:flutter/material.dart';

class MyMainAppBar extends StatelessWidget {
  const MyMainAppBar({super.key, required this.myBody});
  final Widget myBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: myBody,
    );
  }
}
