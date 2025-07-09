import 'package:flutter/material.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

class AppTheme {
  AppTheme._();

  static _border([Color color = AppColors.black]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: color, width: 0.5),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SofiaSans',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.appBgGrey,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.appBgGrey),
    inputDecorationTheme: InputDecorationTheme(
      border: _border(),
      focusedBorder: _border(),
      errorBorder: _border(AppColors.red),
      hintStyle: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w400),
    ),
  );
}
