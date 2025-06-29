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
                Text('Log in', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32.sp, color: AppColors.appBgBlack)),
                SizedBox(height: 5),

                Text('Please enter your details to login.', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.5).round()))),
                SizedBox(height: 20),
                
                Text('Email', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.7).round()))),
                SizedBox(height: 8),
                _formTextField(hintText: 'Enter your email', prefixIcon: Icons.email_outlined, isSuffix: false),
                SizedBox(height: 30),

                Text('Password', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.appBgBlack.withAlpha((255 * 0.7).round()))),
                SizedBox(height: 8),
                _formTextField(hintText: 'Enter your password', prefixIcon: Icons.lock_outline, isSuffix: true, suffixIcon: Icons.remove_red_eye),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _formTextField({TextEditingController? textController, required String hintText, required IconData prefixIcon, required bool isSuffix, IconData? suffixIcon}) {
  return TextFormField(
    cursorColor: Colors.black,
    autocorrect: false,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.appBgBlack),
    decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon: isSuffix ? IconButton(
          onPressed: (){},
          icon: Icon(suffixIcon, color: Colors.grey),
        ) : null,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        )
    ),
  );
}
