import 'package:courseup/constants/images.dart';
import 'package:courseup/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: const [
              OnboardingPage(image: onboardingImage1, title: 'Welcome to courseUp', subtitle: 'Your gateway to learning new skills and sharing knowledge. Explore a variety of courses tailored to your interests.'),
              OnboardingPage(image: onboardingImage2, title: 'Learn Anytime, Anywhere!', subtitle: 'Access high-quality video courses and materials anytime, on any device.'),
              OnboardingPage(image: onboardingImage3, title: 'Are You an Instructor?', subtitle: 'Share your expertise by creating and publishing courses. Earn money while helping others grow.'),

            ],
          )
        ],
      ),
    );
  }
}