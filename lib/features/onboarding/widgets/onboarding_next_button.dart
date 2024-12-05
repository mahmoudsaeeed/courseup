import 'package:courseup/core/constants.dart';
import 'package:courseup/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key, required this.controller, required this.isLast});
  final PageController controller;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.05,
            right: MediaQuery.sizeOf(context).width * 0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                foregroundColor: Colors.white,
                backgroundColor: MyColors.myPrimaryColor,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {
                if(isLast) {
                  Navigator.pushReplacementNamed(context, MyPages.myLoginPage);
                } else {
                  controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }
              },
              child: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
              ),
            ),
          );
  }
}