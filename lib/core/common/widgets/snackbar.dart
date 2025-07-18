import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

void showSnackBar({required BuildContext context, required String content, IconData? icon = Icons.report_gmailerrorred, Color? color = AppColors.red}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        elevation: 0,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        content: Container(
          height: 50.w,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color!.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withAlpha(100), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: AppColors.white),
                ),
              ),
              SizedBox(width: 10.w),
              Flexible(
                flex: 8,
                child: Text(
                  content,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.black, fontWeight: FontWeight.normal, fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}