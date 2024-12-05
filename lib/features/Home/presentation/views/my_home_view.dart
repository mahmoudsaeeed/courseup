import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  final String userId;
  const MyHomeView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    User? myUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("hello ${myUser!.getIdToken()}"),
        ));
  }
}
