import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget searchAndFilter({required TextEditingController controller, void Function()? onFilterTap}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        flex: 10,
        fit: FlexFit.tight,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            hintText: 'Search...',
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.all(10.h),
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
        ),
      ),
      SizedBox(width: 5.w),
      Flexible(
        flex: 2,
        fit: FlexFit.tight,
        child: IconButton(
          splashRadius: 5,
          color: AppColors.primary,
          splashColor: AppColors.white,
          style: IconButton.styleFrom(
            iconSize: 20.h,
            padding: EdgeInsets.all(10.h),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.w)
            ),
          ),
          onPressed: onFilterTap,
          icon: Icon(Iconsax.setting_5),
        ),
      )
    ],
  );
}