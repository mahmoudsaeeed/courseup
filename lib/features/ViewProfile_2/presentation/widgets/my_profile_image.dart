import 'package:flutter/material.dart';

import '../../../../constants/images.dart';

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (MediaQuery.of(context).size.width / 2) - 100,
      top: 130,
      child: const CircleAvatar(
        radius: 100,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        foregroundImage: AssetImage(hunterBoy ,),

        // child: Image.asset(
        //   appLogo,
        // ),
      ),
    );
  }
}
