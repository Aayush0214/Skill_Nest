import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget authDivider() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 1,
        child: Divider(
          height: 1,
          thickness: 1,
          indent: 10,
          color: AppColors.grey,
        ),
      ),
      SizedBox(width: 10),
      Text(
        'Or login with',
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 1,
        child: Divider(
          height: 1,
          thickness: 1,
          endIndent: 10,
          color: AppColors.grey,
        ),
      ),
    ],
  );
}