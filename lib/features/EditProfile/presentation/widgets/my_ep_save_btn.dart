import 'package:courseup/features/sharedWidgetsBetweenScreens/my_button.dart';
import 'package:courseup/test.dart';
import 'package:flutter/material.dart';

class MyEpSaveBtn extends StatelessWidget {
  const MyEpSaveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      buttonName: "Save Data",
      onPressed: () {
        Test.showNotWorkMsg(context);
      },
    );
  }
}
