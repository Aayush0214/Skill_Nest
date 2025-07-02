import 'package:flutter/material.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

Widget formTextField({
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
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        )
    ),
  );
}
