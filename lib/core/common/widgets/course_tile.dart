import 'custom_text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/core/common/widgets/common_thumbnail.dart';

Widget courseList({
  required bool showPrice,
  required String courseTitle,
  required String subTitle,
  required String courseImage,
  required String tutorImage,
  required String tutorName,
  required String coursePrice,
  required double rating,
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.w)),
      child: commonThumbnailImage(clipRadius: 10.w, thumbnailUrl: courseImage),
    ),
    title: customText(
      maxLines: 1,
      fontSize: 14.sp,
      textString: courseTitle,
      textColor: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    subtitle: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          maxLines: 2,
          fontSize: 12.sp,
          textString: subTitle,
          textColor: AppColors.grey,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 10.w,
              backgroundColor: AppColors.grey,
              child: commonNetworkProfile(profileUrl: tutorImage, clipRadius: 10.w),
            ),
            SizedBox(width: 5.w),
            customText(
              textString: tutorName,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              textColor: AppColors.black,
              maxLines: 1,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showPrice ? customText(
              textString: coursePrice,
              textColor: AppColors.black,
              maxLines: 1,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ) : SizedBox.shrink(),
            Icon(Icons.star, color: Colors.orange),
            SizedBox(width: 2.w),
            customText(
              textString: rating.toStringAsFixed(1),
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ],
    ),
    trailing: Icon(Iconsax.arrow_right_3, color: AppColors.black),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
  );
}
