import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375.w,
        color: AppColors.appBgWhite,
        child: Stack(
          children: [
            PageView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 345.w,
                      height: 345.w,
                      child: Text('Image one'),
                    ),

                    Text(
                      'First see learning',
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: AppColors.appBgBlack,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
