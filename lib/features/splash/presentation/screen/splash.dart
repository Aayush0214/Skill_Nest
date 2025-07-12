import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/snackbar.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/constants/constant_strings.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:skill_nest/features/dashboard/presentation/pages/dashboard.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/login.dart';
import 'package:skill_nest/features/on_boarding/presentation/screens/pages/on_boarding.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/verify_email.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigateToOnboardingState) {
          NavigationService.pushReplacement(context, OnBoarding());
        } else if (state is NavigateToDashboardState) {
          NavigationService.pushReplacement(context, Dashboard());
        } else if (state is NavigateToVerifyEmailState) {
          NavigationService.pushReplacement(context, VerifyEmail());
        } else if (state is NavigateToLoginState) {
          if (state.message!.isNotEmpty) {
            showSnackBar(context: context, color: AppColors.red, content: state.message!, icon: Icons.report_gmailerrorred);
          }
          NavigationService.pushReplacement(context, Login());
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ConstantImages.splashBg), fit: BoxFit.cover)
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0.w,
                top: 100.h,
                right: 0.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180.w,
                      height: 180.h,
                      child: Image(image: AssetImage(ConstantImages.appLogo)),
                    ),
                    Text(
                      ConstantStrings.appName,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 55.sp,
                        color: Color(0xff15616d),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0.w,
                right: 0.w,
                bottom: 100.h,
                child: Text(
                  ConstantStrings.appSlogan,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: Color(0xff15616d),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
