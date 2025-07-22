import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/container.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/common/widgets/common_thumbnail.dart';
import 'package:skill_nest/features/home/domain/entity/dummy_entity.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/features/course_details/presentation/pages/course_details.dart';

Widget courses({required List<CourseModel> filteredCourses}) {
  return SliverPadding(
    padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 8.h),
    sliver: SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.78,
      ),
      delegate: SliverChildBuilderDelegate(
          childCount: filteredCourses.length,
          (context,index) {
            final course = filteredCourses[index];
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => NavigationService.push(context, CourseDetailPage(courseModel: course)),
                splashColor: Colors.blue.withAlpha(60),
                highlightColor: Colors.blue.withAlpha(40),
                borderRadius: BorderRadius.circular(10.w),
                child: commonContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonThumbnailImage(clipRadius: 10.w, thumbnailUrl: course.thumbnail, imageHeight: 90.h),
                      SizedBox(height: 5.h),
                      customText(
                        maxLines: 2,
                        fontSize: 14.sp,
                        textString: course.title,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: customText(
                              fontWeight: FontWeight.normal,
                              textString: course.instructor.name,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 2.w),
                          customText(
                            fontWeight: FontWeight.normal,
                            textString: course.rating.toStringAsFixed(1),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      customText(
                        maxLines: 1,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        textString: '₹ ${course.coursePrice.toStringAsFixed(1)}',
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    ),
  );
}


