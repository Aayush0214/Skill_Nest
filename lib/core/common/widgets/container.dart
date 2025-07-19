import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget commonContainer({required Widget child}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10.w),
      boxShadow: [BoxShadow(blurRadius: 1, color: AppColors.grey)],
    ),
    child: child,
  );
}
