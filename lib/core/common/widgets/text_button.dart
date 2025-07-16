import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget commonTextButton({required String buttonText, void Function()? onPressed, required Color buttonTextColor}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: TextStyle(
        fontSize: 15.sp,
        color: buttonTextColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}