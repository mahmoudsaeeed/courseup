import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSmoothPageIndicator extends StatelessWidget {
  const OnboardingSmoothPageIndicator({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.07,
            left: MediaQuery.sizeOf(context).width * 0.07,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(dotHeight: 6, activeDotColor: Colors.indigo),
            ),
          );
  }
}