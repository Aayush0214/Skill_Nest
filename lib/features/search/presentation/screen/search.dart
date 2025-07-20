import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/appbar.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/common/widgets/course_tile.dart';
import 'package:skill_nest/core/common/widgets/search_and_filter.dart';

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
      appBar: commonAppBar('Search'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              searchAndFilter(controller: searchController, onFilterTap: (){}),
              SizedBox(height: 10.h),
              ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                itemBuilder: (context, index) => courseList(
                  courseTitle: 'Flutter Firebase combined course',
                  subTitle: 'Flutter Firebase combined course Flutter Firebase combined course',
                  courseImage: ConstantImages.course,
                  coursePrice: '549₹',
                  tutorImage: ConstantImages.profileImage,
                  tutorName: 'Aayush Kushwaha',
                  subTitleMaxLine: 1,
                  rating: '4.1',
                  onListTap: (){},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}