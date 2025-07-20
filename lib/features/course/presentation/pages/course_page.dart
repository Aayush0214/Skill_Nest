import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/appbar.dart';
import 'package:skill_nest/core/common/widgets/course_tile.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/features/course/presentation/pages/course_details.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Enrolled Courses'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemBuilder:
                (context, index) => courseList(
                  courseTitle: 'Flutter Firebase combined course',
                  subTitle:
                      'Flutter Firebase combined course Flutter Firebase combined course',
                  courseImage: ConstantImages.course,
                  coursePrice: '549₹',
                  tutorImage: ConstantImages.profileImage,
                  tutorName: 'Aayush Kushwaha',
                  subTitleMaxLine: 1,
                  rating: '4.1',
                  onListTap: () => NavigationService.push(context, CourseDetails()),
                ),
          ),
        ),
      ),
    );
  }
}
