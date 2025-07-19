import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget optionListTile({
  required String optionText,
  Color? textColor = AppColors.black,
  Color? bgColor = AppColors.primary,
  required IconData optionIcon,
  VoidCallback? onOptionTap,
}) {
  return ListTile(
    onTap: onOptionTap,
    tileColor: AppColors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
    leading: Container(
      width: 32.h,
      height: 32.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Icon(optionIcon, color: AppColors.white),
    ),
    title: customText(
      textString: optionText,
      fontWeight: FontWeight.w600,
      textColor: textColor,
      fontSize: 14.sp,
    ),
    trailing: Icon(Iconsax.arrow_right_3, color: textColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
  );
}