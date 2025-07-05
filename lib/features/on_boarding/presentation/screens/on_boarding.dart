import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/constants/constant_strings.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/features/authentication/presentation/screen/login.dart';
import 'package:skill_nest/features/on_boarding/presentation/bloc/onboarding_bloc.dart';
import 'package:skill_nest/features/on_boarding/presentation/screens/widgets/dot_indicator.dart';
import 'package:skill_nest/features/on_boarding/presentation/screens/widgets/onboard_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  double currentIndex = 0;
  final PageController onboardPageController = PageController();


  @override
  void dispose() {
    onboardPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (blocContext, state) {
            if (state is OnboardingCurrentState){
              onboardPageController.animateToPage(
                state.currentIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }else if (state is OnboardingCompleteState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,
              );
            }
          },
          builder: (blocContext, state) {
            if (state is OnboardingCurrentState) {
              currentIndex = state.currentIndex.toDouble();
            }
            return Stack(
              children: [
                /// Page View
                PageView(
                  scrollDirection: Axis.horizontal,
                  controller: onboardPageController,
                  physics: ClampingScrollPhysics(),
                  onPageChanged: (value) {
                    context.read<OnboardingBloc>().add(OnboardingPageSwiped(index: value));
                  },
                  children: [
                    onBoardPage(
                      ConstantStrings.onBoardTitle1,
                      ConstantStrings.onBoardSubTitle1,
                      ConstantImages.onBoarding1,
                    ),
                    onBoardPage(
                      ConstantStrings.onBoardTitle2,
                      ConstantStrings.onBoardSubTitle2,
                      ConstantImages.onBoarding2,
                    ),
                    onBoardPage(
                      ConstantStrings.onBoardTitle3,
                      ConstantStrings.onBoardSubTitle3,
                      ConstantImages.onBoarding3,
                    ),
                  ],
                ),

                /// Dot Indicator & Next Button
                Positioned(
                  left: 20.w,
                  right: 20.w,
                  bottom: 50.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Dot Indicator
                      onboardingDotIndicator(currentIndex),

                      /// Next Button
                      IconButton(
                        onPressed: () {
                          context.read<OnboardingBloc>().add(NextPageEvent());
                        },
                        style: IconButton.styleFrom(
                          elevation: 0,
                          iconSize: 25.sp,
                          fixedSize: Size(60.w, 60.w),
                          alignment: Alignment.center,
                          foregroundColor: AppColors.white,
                          backgroundColor: AppColors.primary,
                        ),
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

