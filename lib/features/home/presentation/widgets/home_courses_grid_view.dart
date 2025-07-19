import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/container.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/features/home/domain/entity/dummy_entity.dart';

Widget courses({required List<Course> filteredCourses}) {
  return SliverPadding(
    padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 8.h),
    sliver: SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.07,
      ),
      delegate: SliverChildBuilderDelegate(childCount: filteredCourses.length, (
        context,
        index,
      ) {
        final course =
            filteredCourses[index]; // Assuming you have this in your state
        return GestureDetector(
          onTap: () {},
          child: commonContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(10.w),
                  child: Image.asset(
                    height: 90.h,
                    fit: BoxFit.fill,
                    ConstantImages.course,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: Text(
                    maxLines: 2,
                    course.title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withAlpha(180),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
