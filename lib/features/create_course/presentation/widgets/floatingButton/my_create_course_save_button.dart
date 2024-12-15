import 'package:courseup/features/sharedWidgetsBetweenScreens/my_button.dart';
import 'package:courseup/test.dart';
import 'package:flutter/material.dart';

class MyCreateCourseSaveButton extends StatelessWidget {
  const MyCreateCourseSaveButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 200,
      child: MyButton(
        buttonName: "Save",
        onPressed: () {
          //TODO get the data of title , price and desc here from sharedpreferences
          Test.showNotWorkMsg(context);
        },
      ),
    );
  }
}
