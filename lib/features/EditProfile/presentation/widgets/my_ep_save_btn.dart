import 'package:courseup/test.dart';
import 'package:flutter/material.dart';

class MyEpSaveBtn extends StatelessWidget {
  const MyEpSaveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            Test.showNotWorkMsg(context);
          },
          child: Text("Save Data")),
    );
  }
}
