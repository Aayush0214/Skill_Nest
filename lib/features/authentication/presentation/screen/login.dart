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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Log in', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp, color: AppColors.appBgBlack)),
                Text('Please enter your details to login.', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.5).round()))),
                SizedBox(height: 60),
                
                Text('Email', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.7).round()))),
                SizedBox(height: 8),
                formTextField(hintText: 'Enter your email', prefixIcon: Icons.email_outlined, isSuffix: false, obscureText: false),
                SizedBox(height: 30),

                Text('Password', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.7).round()))),
                SizedBox(height: 8),
                formTextField(hintText: 'Enter your password', prefixIcon: Icons.lock_outline, isSuffix: true, suffixIcon: Icons.remove_red_eye, obscureText: true),
                SizedBox(height: 10),
                
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.appBgBlack,
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.appBgBlack.withAlpha((255 * 0.5).round()),
                    ),
                  ),
                  child: Text('Forgot Password?'),
                ),
                SizedBox(height: 40),

                commonButton('Login', (){}),
                SizedBox(height: 40),

                authDivider(),

                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialContainer(ConstantImages.apple),
                    socialContainer(ConstantImages.google),
                    socialContainer(ConstantImages.facebook),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
