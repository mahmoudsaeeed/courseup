import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyEpTopPart extends StatelessWidget {
  const MyEpTopPart({super.key, required this.myUser});
  final MyUserEntity myUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          child: Image(image: NetworkImage(myUser.profileImage!)),
        ),
        const Gap(15),
        Text(
          myUser.name,
          style: MyCustomFonts.largerText,
        ),
        const Gap(10),
        // Text(
        //   myUser.email,
        //   style: MyCustomFonts.smallText,
        // ),
      ],
    );
  }
}
