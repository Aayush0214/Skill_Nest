import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget profileHeader({
  VoidCallback? myCourse,
  VoidCallback? buyCourse,
  VoidCallback? performance,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10.h),
      boxShadow: [BoxShadow(color: AppColors.grey, blurRadius: 1)],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35.h,
          backgroundColor: AppColors.grey,
          backgroundImage: NetworkImage(ConstantImages.profileImage),
        ),
        customText(
          textString: 'Aayush Kushwaha',
          fontSize: 16.sp,
          maxLines: 1,
          fontWeight: FontWeight.w700,
          textColor: AppColors.black,
        ),
        customText(
          textString: 'aayush02kushwaha@gmail.com',
          maxLines: 1,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          textColor: AppColors.grey,
        ),
        SizedBox(height: 15.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            profileHeaderOptions(
              icon: Icons.videocam_rounded,
              optionText: 'My Courses',
              onTap: myCourse,
            ),
            profileHeaderOptions(
              icon: Icons.shopping_cart,
              optionText: 'Buy Courses',
              onTap: buyCourse,
            ),
            profileHeaderOptions(
              icon: Iconsax.star,
              optionText: 'rating: 4.7',
              onTap: performance,
            ),
          ],
        )
      ],
    ),
  );
}

Widget profileHeaderOptions({required IconData icon, required String optionText, VoidCallback? onTap}) {
  return InkResponse(
    onTap: onTap,
    radius: 30,
    splashColor: AppColors.grey,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10.h)
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.white, size: 23.h),
          customText(textString: optionText, textColor: AppColors.white, fontWeight: FontWeight.w800, fontSize: 14.sp)
        ],
      ),
    ),
  );
}