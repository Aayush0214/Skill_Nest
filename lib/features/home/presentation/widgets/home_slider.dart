import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/constants/constant_images.dart';

Widget slider({
  required List<String> bannerImages,
  dynamic Function(int, CarouselPageChangedReason)? onPageChanged,
}) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 140.h,
      initialPage: 0,
      padEnds: true,
      autoPlay: true,
      pageSnapping: true,
      aspectRatio: 9 / 16,
      viewportFraction: 0.97,
      enlargeCenterPage: true,
      onPageChanged: onPageChanged,
      scrollDirection: Axis.horizontal,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
    ),
    items:
        bannerImages.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.h),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      ConstantImages.placeHolder,
                    );
                  },
                ),
              );
            },
          );
        }).toList(),
  );
}
