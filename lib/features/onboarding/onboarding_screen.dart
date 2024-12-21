import 'package:courseup/constants/images.dart';
import 'package:courseup/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:courseup/features/onboarding/onboarding_page.dart';
import 'package:courseup/features/onboarding/widgets/onboarding_next_button.dart';
import 'package:courseup/features/onboarding/widgets/onboarding_skip_button.dart';
import 'package:courseup/features/onboarding/widgets/onboarding_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<OnboardingCubit>().updatePage(index);
                },
                children: const [
                  OnboardingPage(
                    image: MyImages.onboardingImage1,
                    title: 'Welcome to courseUp',
                    subtitle:
                        'Your gateway to learning new skills and sharing knowledge. Explore a variety of courses tailored to your interests.',
                  ),
                  OnboardingPage(
                    image: MyImages.onboardingImage2,
                    title: 'Learn Anytime, Anywhere!',
                    subtitle:
                        'Access high-quality video courses and materials anytime, on any device.',
                  ),
                  OnboardingPage(
                    image: MyImages.onboardingImage3,
                    title: 'Are You an Instructor?',
                    subtitle:
                        'Share your expertise by creating and publishing courses. Earn money while helping others grow.',
                  ),
                ],
              ),
              OnboardingSkipButton(
                controller: _pageController,
              ),
              OnboardingSmoothPageIndicator(controller: _pageController),
              BlocBuilder<OnboardingCubit, int>(
                builder: (context, state) {
                  return OnboardingNextButton(
                    controller: _pageController,
                    isLast: state == 2,
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
