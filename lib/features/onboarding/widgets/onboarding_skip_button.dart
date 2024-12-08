import 'package:courseup/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Positioned(
            top: MediaQuery.sizeOf(context).height * 0.05,
            right: MediaQuery.sizeOf(context).width * 0.05,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(2);
              },
              child: const Text('Skip'),
              style: TextButton.styleFrom(foregroundColor: MyColors.myPrimaryColor),
            ),
          );
  }
}