import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget onBoardPage(String title, String subtitle, String onBoardingImage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 300.w,
        height: 300.w,
        child: Image.asset(onBoardingImage),
      ),

      Text(
        title,
        style: TextStyle(
          fontSize: 24.sp,
          color: AppColors.appBgBlack,
          fontWeight: FontWeight.normal,
        ),
      ),
      SizedBox(height: 5),

      Text(
        subtitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.appBgBlack,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}