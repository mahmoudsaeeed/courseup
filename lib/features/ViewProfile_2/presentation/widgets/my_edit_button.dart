import 'package:flutter/material.dart';

import '../../../sharedWidgetsBetweenScreens/my_button.dart';

class MyEditButton extends StatelessWidget {
  const MyEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 60,
      child: SizedBox(
          width: 260,
          child: MyButton(
            buttonName: "Edit Profile",
            onPressed: () {},
          )),
    );
  }
}
