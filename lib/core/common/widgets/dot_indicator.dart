import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget dotIndicator(double currentIndex, {int count = 3}) {
  return  DotsIndicator(
    animate: true,
    dotsCount: count,
    axis: Axis.horizontal,
    position: currentIndex,
    mainAxisAlignment: MainAxisAlignment.center,
    decorator: DotsDecorator(
      size: const Size.square(7),
      activeSize: const Size(28, 7),
      activeColor: AppColors.primary,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}