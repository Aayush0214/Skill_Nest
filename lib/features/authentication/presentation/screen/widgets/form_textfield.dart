import 'package:flutter/material.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget formTextField({
  required TextEditingController textController,
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
    controller: textController,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.black),
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(prefixIcon, color: AppColors.black),
      suffixIcon:
          isSuffix
              ? IconButton(
                onPressed: () {},
                icon: Icon(suffixIcon, color: AppColors.black),
              )
              : null,
    ),
  );
}
