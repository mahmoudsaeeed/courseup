import 'package:flutter/material.dart';

class Test {
  static Future<T?> showNotWorkMsg<T>(context) {
    return showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("لسه مشتغلتش"),
      ),
    );
  }
}
