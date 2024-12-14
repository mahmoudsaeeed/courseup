import 'package:flutter/material.dart';

import '../../../../constants/images.dart';
import '../../../../core/utils/my_colors.dart';

class MyPageWithLogo extends StatelessWidget {
  const MyPageWithLogo(
      {super.key, required this.myPageName, required this.myCustomWidget});
  final String myPageName;

  final Widget myCustomWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 200,
          child: Image(
            image: AssetImage(appLogo),
          ),
        ),
        Text(
          myPageName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: MyColors.myPrimaryColor),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          child: myCustomWidget,
        ),
      ],
    );
  }
}
