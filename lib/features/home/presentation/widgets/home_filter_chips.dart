import 'package:flutter/material.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/common/widgets/text_button.dart';
import '../../../../core/theme/app_colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget rowHeading({void Function()? seeAll}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Select your course',
        maxLines: 1,
        softWrap: true,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      commonTextButton(
        onPressed: seeAll,
        buttonText: 'See All',
        buttonTextColor: AppColors.grey,
      ),

    ],
  );
}


Widget choiceChip({required var selectedFilter, required void Function(CourseFilterType) onFilterSelected}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: CourseFilterType.values.map((filter) {
        final isSelected = selectedFilter == filter;
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ChoiceChip(
            selected: isSelected,
            selectedColor: AppColors.primary,
            checkmarkColor: isSelected ? AppColors.white : null,
            onSelected: (_) => onFilterSelected(filter),
            label: Text(
              filter.name,
              style: TextStyle(color: isSelected ? AppColors.white : AppColors.black),
            ),
          ),
        );
      }).toList(),
    ),
  );
}