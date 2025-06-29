import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget onboardingDotIndicator(double currentIndex) {
  return  DotsIndicator(
    dotsCount: 3,
    animate: true,
    axis: Axis.horizontal,
    position: currentIndex,
    mainAxisAlignment: MainAxisAlignment.center,
    decorator: DotsDecorator(
      size: const Size.square(10),
      activeSize: const Size(25, 10),
      activeColor: AppColors.appBgOrange,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}