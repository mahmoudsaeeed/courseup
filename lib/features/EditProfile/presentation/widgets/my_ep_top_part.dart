import 'package:courseup/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyEpTopPart extends StatelessWidget {
  const MyEpTopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          child: Text("MA"),
          
        ),
        Gap(15),
        Text(
          "PersonName",
          style: MyCustomFonts.largerText,
        ),
        Gap(10),
        Text(
          "jop",
          style: MyCustomFonts.smallText,
        ),
      ],
    );
  }
}
