import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget commonButton(VoidCallback onButtonTap, String buttonText) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onButtonTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        fixedSize: Size(double.infinity, 45.h),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(buttonText),
    ),
  );
}
