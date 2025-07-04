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
        maxLines: 2,
        softWrap: true,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        style: TextStyle(
          fontSize: 24.sp,
          color: AppColors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      SizedBox(height: 5),

      Text(
        subtitle,
        maxLines: 3,
        softWrap: true,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}