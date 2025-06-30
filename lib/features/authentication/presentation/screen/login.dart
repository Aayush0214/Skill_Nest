import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

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
                Text('Please enter your details to login.', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.5).round()))),
                SizedBox(height: 60),
                
                Text('Email', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.7).round()))),
                SizedBox(height: 8),
                _formTextField(hintText: 'Enter your email', prefixIcon: Icons.email_outlined, isSuffix: false, obscureText: false),
                SizedBox(height: 30),

                Text('Password', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.7).round()))),
                SizedBox(height: 8),
                _formTextField(hintText: 'Enter your password', prefixIcon: Icons.lock_outline, isSuffix: true, suffixIcon: Icons.remove_red_eye, obscureText: true),
                SizedBox(height: 20),
                
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.appBgBlack,
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.appBgBlack.withAlpha((255 * 0.5).round()),
                    ),
                    shape: LinearBorder.bottom(
                      side: BorderSide(color: Colors.grey),
                    )
                  ),
                  child: Text('Forgot Password?'),
                ),
                SizedBox(height: 40),


                ElevatedButton(
                  onPressed: (){},
                  child: Text('Login'),
                )
              
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _formTextField({
  TextEditingController? textController,
  required String hintText,
  required IconData prefixIcon,
  required bool isSuffix,
  IconData? suffixIcon,
  required bool obscureText,
}) {
  return TextFormField(
    autocorrect: false,
    obscureText: obscureText,
    cursorColor: Colors.black,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.appBgBlack),
    decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: AppColors.appBgBlack),
        suffixIcon: isSuffix ? IconButton(
          onPressed: (){},
          icon: Icon(suffixIcon, color: Colors.grey),
        ) : null,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),
        )
    ),
  );
}
