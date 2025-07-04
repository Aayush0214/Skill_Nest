import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/core/common/widgets/common_button.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/auth_divider.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/social_icon.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/form_textfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text('Log in', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.sp, color: AppColors.black)),
                Text('Please enter your details to login.', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.sp, color: AppColors.black)),
                SizedBox(height: 30.h),
                
                Text('Email', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: AppColors.black)),
                SizedBox(height: 5.h),
                formTextField(hintText: 'Enter your email', prefixIcon: Iconsax.sms, isSuffix: false, obscureText: false),
                SizedBox(height: 20.h),

                Text('Password', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: AppColors.black)),
                SizedBox(height: 5.h),
                formTextField(hintText: 'Enter your password', prefixIcon: Iconsax.lock_1, isSuffix: true, suffixIcon: Iconsax.eye_slash, obscureText: true),
                SizedBox(height: 3.h),
                
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.black,
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  child: Text('Forgot Password ?'),
                ),
                SizedBox(height: 20.h),

                commonButton('Login', (){}),
                SizedBox(height: 25.h),

                authDivider(),
                SizedBox(height: 25.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialContainer(ConstantImages.google, (){}),
                    socialContainer(ConstantImages.apple, (){}),
                    socialContainer(ConstantImages.facebook, (){}),
                  ],
                ),
                SizedBox(height: 25.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(fontWeight: FontWeight.normal, color: AppColors.black, fontSize: 14.sp)),
                    TextButton(
                      onPressed: (){},
                      child: Text('SignUp', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary, fontSize: 15.sp)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
