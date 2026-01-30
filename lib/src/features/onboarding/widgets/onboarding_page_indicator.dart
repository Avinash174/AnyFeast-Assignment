import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constants/app_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const OnboardingPageIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: const ExpandingDotsEffect(
        activeDotColor: AppColors.primary,
        dotColor: Color(0xFFE0E0E0),
        dotHeight: 8,
        dotWidth: 8,
        expansionFactor: 3,
        spacing: 8,
      ),
    );
  }
}
