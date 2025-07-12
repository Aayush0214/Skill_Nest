import 'package:flutter/material.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget formTextField({
  required TextEditingController textController,
  required String hintText,
  required IconData prefixIcon,
  required bool isSuffix,
  IconData? suffixIcon,
  required bool obscureText,
  VoidCallback? showPassword,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    autocorrect: false,
    validator: validator,
    obscureText: obscureText,
    cursorColor: Colors.black,
    controller: textController,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.black),
    decoration: InputDecoration(
      filled: true,
      hintText: hintText,
      fillColor: AppColors.white,
      prefixIcon: Icon(prefixIcon, color: AppColors.black),
      suffixIcon:
          isSuffix
              ? IconButton(
                onPressed: showPassword,
                icon: Icon(suffixIcon, color: AppColors.black),
              )
              : null,
    ),
  );
}
