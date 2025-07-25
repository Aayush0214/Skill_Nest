import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/core/common/widgets/search_and_filter.dart';

Widget homeHeader({required String userName, required String userProfileImage, required TextEditingController searchController}) {
  return SliverAppBar(
    pinned: true,
    floating: false,
    toolbarHeight: 50.h,
    collapsedHeight: 60.h,
    expandedHeight: 130.h,
    backgroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(25.w, 15.w),
          bottomRight: Radius.elliptical(25.w, 15.w),
        )
    ),
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              fontSize: 28.sp,
              textColor: AppColors.white,
              fontWeight: FontWeight.w800,
              textString: 'Hi, $userName 🖐️',
            ),
            customText(
              fontSize: 16.sp,
              textColor: AppColors.white,
              fontWeight: FontWeight.normal,
              textString: "Let's start learning today!",
            ),
          ],
        ),
        CircleAvatar(
          radius: 25.w,
          backgroundColor: AppColors.white,
          backgroundImage: NetworkImage(userProfileImage),
        ),
      ],
    ),
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
            child: searchAndFilter(controller: searchController, onFilterTap: (){})
          ),
        ],
      ),
    ),
  );
}