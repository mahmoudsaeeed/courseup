import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/test.dart';
import 'package:flutter/material.dart';

import '../../../sharedWidgetsBetweenScreens/my_button.dart';

class MyEditButton extends StatelessWidget {
  const MyEditButton({super.key, required this.myUser});
  final MyUserEntity myUser;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 60,
      child: SizedBox(
          width: 260,
          child: MyButton(
            buttonName: "Edit Profile",
            onPressed: () {
              debugPrint("myUser = ${myUser.name}");
              // Navigator.pushNamed(
              //   context,
              //   MyPages.myUpdateProfilePage,
              //   arguments: {
              //     "user": myUser,
              //   },
              // );
              Test.showNotWorkMsg(context);
            },
          )),
    );
  }
}
