import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

PreferredSizeWidget commonAppBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.primary,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    ),
  );
}