import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/constants/constant_strings.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/login.dart';
import 'package:skill_nest/features/on_boarding/presentation/bloc/onboarding_bloc.dart';
import 'package:skill_nest/core/common/widgets/dot_indicator.dart';
import 'package:skill_nest/features/on_boarding/presentation/screens/widgets/onboard_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  double _currentIndex = 0;
  final PageController _onboardPageController = PageController();


  @override
  void dispose() {
    _onboardPageController.dispose();
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
              _onboardPageController.animateToPage(
                state.currentIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
              _currentIndex = state.currentIndex.toDouble();
            }else if (state is OnboardingCompleteState) {
              NavigationService.pushAndRemoveUntil(context, Login());
            }
          },
          builder: (blocContext, state) {
            return Stack(
              children: [
                /// Page View
                PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _onboardPageController,
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
                      dotIndicator(_currentIndex),

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

