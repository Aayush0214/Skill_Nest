import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/appbar.dart';
import 'package:skill_nest/core/common/widgets/course_tile.dart';
import 'package:skill_nest/core/common/widgets/dummy_course.dart';
import 'package:skill_nest/core/common/widgets/search_and_filter.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/features/course_details/presentation/pages/course_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Explore'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              searchAndFilter(controller: searchController, onFilterTap: (){}),
              SizedBox(height: 10.h),
              ListView.separated(
                itemCount: dummyCourses.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  final course = dummyCourses[index];
                  return courseList(
                    showPrice: true,
                    subTitleMaxLine: 2,
                    rating: course.rating,
                    courseTitle: course.title,
                    subTitle: course.description,
                    courseImage: course.thumbnail,
                    tutorName: course.instructor.name,
                    tutorImage: course.instructor.profileImage,
                    coursePrice: '₹ ${course.coursePrice.toStringAsFixed(1)}',
                    onListTap: () => NavigationService.push(context, CourseDetailPage(courseModel: course)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}