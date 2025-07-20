import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

import 'custom_text.dart';

Widget courseList({
  required String courseTitle,
  required String subTitle,
  required String courseImage,
  required String tutorImage,
  required String tutorName,
  required String coursePrice,
  required String rating,
  int? subTitleMaxLine = 2,
  VoidCallback? onListTap,
}) {
  return ListTile(
    onTap: onListTap,
    tileColor: AppColors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
    leading: Container(
      width: 60.h,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(10.w),
        child: Image.asset(
          courseImage,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    ),
    title: customText(
      fontSize: 14.sp,
      textString: courseTitle,
      textColor: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    subtitle: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subTitle,
          maxLines: subTitleMaxLine,
          softWrap: true,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.grey,
              backgroundImage: NetworkImage(tutorImage),
            ),
            SizedBox(width: 5.w),
            customText(textString: tutorName, fontSize: 12.sp, fontWeight: FontWeight.w500, textColor: AppColors.black, maxLines: 1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customText(textString: coursePrice, textColor: AppColors.black, maxLines: 1, fontWeight: FontWeight.w700, fontSize: 14.sp),
            SizedBox(width: 8.w),
            Icon(Icons.star, color: Colors.yellow),
            SizedBox(width: 2.w),
            customText(textString: rating, fontWeight: FontWeight.normal)
          ],
        )
      ],
    ),
    trailing: Icon(Iconsax.arrow_right_3, color: AppColors.black),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
  );
}