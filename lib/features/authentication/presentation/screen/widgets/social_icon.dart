import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget socialContainer(String image) {
  return GestureDetector(
    onTap: (){},
    child: Container(
      width: 45.w,
      height: 45.w,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.appBgWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2.5,
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