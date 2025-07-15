import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_nest/core/common/widgets/search_box.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

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
            greetingText('Hi, $userName 🖐️', 28.sp, FontWeight.w800),
            greetingText("Let's start learning today!", 16.sp, FontWeight.normal),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: searchBox(searchController),
                ),
                SizedBox(width: 5.w),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: IconButton(
                    iconSize: 20.h,
                    splashRadius: 5,
                    color: AppColors.primary,
                    splashColor: AppColors.white,
                    style: IconButton.styleFrom(
                      fixedSize: Size.fromHeight(45.h),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w)
                      ),
                    ),
                    onPressed: (){},
                    icon: Icon(Iconsax.setting_5),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    ),
  );
}

Widget greetingText(String text, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    maxLines: 1,
    softWrap: true,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: AppColors.white,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}