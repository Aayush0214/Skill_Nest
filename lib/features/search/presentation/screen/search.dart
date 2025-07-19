import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/appbar.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
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
      appBar: commonAppBar('My Profile'),
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
                  totalRating: 3.5,
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

Widget courseList({
  required String courseTitle,
  required String subTitle,
  required String courseImage,
  required double totalRating,
  VoidCallback? onListTap,
}) {
  return ListTile(
    onTap: onListTap,
    tileColor: AppColors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
    leading: Container(
      width: 50.h,
      height: 120.h,
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
          maxLines: 1,
          softWrap: true,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        RatingBarIndicator(
          rating: totalRating,               // double हो सकता है: 3.5, 4.2, etc.
          itemCount: 5,
          itemSize: 10.h,
          direction: Axis.horizontal,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
        )
      ],
    ),
    trailing: Icon(Iconsax.arrow_right_3, color: AppColors.black),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
  );
}