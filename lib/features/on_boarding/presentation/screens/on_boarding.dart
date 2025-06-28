import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/constants/constant_strings.dart';
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
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              children: [
                _onBoardPage(ConstantStrings.onBoardTitle1, ConstantStrings.onBoardSubTitle1, ConstantImages.onBoarding1, 'Next', (){}),
                _onBoardPage(ConstantStrings.onBoardTitle2, ConstantStrings.onBoardSubTitle2, ConstantImages.onBoarding2, 'Next', (){}),
                _onBoardPage(ConstantStrings.onBoardTitle3, ConstantStrings.onBoardSubTitle3, ConstantImages.onBoarding3, 'Next', (){}),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 80,
              child: DotsIndicator(
                position: 0,
                dotsCount: 3,
                animate: true,
                decorator: DotsDecorator(
                  size: const Size.square(10),
                  activeSize: const Size(25, 10),
                  activeColor: AppColors.appBgOrange,
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                axis: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _onBoardPage(String title, String subtitle, String onBoardingImage, String buttonText, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(onBoardingImage),
        ),

        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            color: AppColors.appBgBlack,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 8),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.appBgBlack,
            fontWeight: FontWeight.normal,
          ),
        ),

        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            width: 325.w,
            height: 50.h,
            duration: Duration(milliseconds: 1200),
            margin: EdgeInsets.only(top: 100.h),
            decoration: BoxDecoration(
                color: AppColors.appBgOrange,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha((255 * 0.5).round()),
                    blurRadius: 2,
                    spreadRadius: 1,
                  )
                ]
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.appBgWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}