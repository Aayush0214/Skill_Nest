import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget textFieldHeading(String headingText, [TextAlign align = TextAlign.center]) {
  return Text(
    headingText,
    textAlign: align,
    style: TextStyle(
      fontSize: 14.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
  );
}