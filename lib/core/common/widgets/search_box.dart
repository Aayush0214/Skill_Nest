import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget searchBox(TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      hintText: 'Search...',
      fillColor: AppColors.white,
      prefixIcon: Icon(Iconsax.search_normal_1, color: AppColors.grey),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.w),
      ),
    ),
  );
}