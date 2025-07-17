import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget socialContainer(String image, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    splashColor: AppColors.grey,
    child: Container(
      width: 45.w,
      height: 45.w,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
              color: Colors.grey.shade400,
            ),
          ]
      ),
      child: Image.asset(
        image,
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    ),
  );
}