import 'package:courseup/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class MyBackgroundRadius extends StatelessWidget {
  const MyBackgroundRadius({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      width: MediaQuery.of(context).size.width + 50,
      height: 250,
      decoration: BoxDecoration(
        color: MyColors.myPrimaryColor,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            MyColors.myPrimaryColor,
            MyColors.mySecondaryColor,
          ],
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.elliptical(200, 100),
          // bottom: Radius.circular(350),
        ),
      ),
      child: const SizedBox(),
    ));
  }
}
