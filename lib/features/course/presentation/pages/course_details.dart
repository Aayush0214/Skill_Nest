import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          alignment: Alignment.center,
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AppColors.grey)
            ),
          ),
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),

        centerTitle: false,
        title: customText(textString: 'Flutter Firebase combined course', maxLines: 1, fontWeight: FontWeight.w600, fontSize: 16.sp, textColor: AppColors.black),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Iconsax.heart, color: AppColors.black, weight: 10.5,))
        ],
      ),
    );
  }
}
