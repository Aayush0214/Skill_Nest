import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentCarouselPosition = 0;
  final TextEditingController _searchController = TextEditingController();
  final List<String> bannerImages = [
    ConstantImages.banner_1,
    ConstantImages.banner_2,
    ConstantImages.banner_3,
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            toolbarHeight: 50.h,
            collapsedHeight: 60.h,
            expandedHeight: 120.h,
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(25.w, 15.w),
                bottomRight: Radius.elliptical(25.w, 15.w),
              )
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _greetingText('Hi, Aayush 🖐️', 28.sp, FontWeight.w800),
                    _greetingText("Let's start learning today!", 16.sp, FontWeight.normal),
                  ],
                ),
                CircleAvatar(
                  radius: 25.w,
                  backgroundColor: AppColors.white,
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg',),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                    child: _searchBox(_searchController),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 140.h,
                    initialPage: 0,
                    padEnds: true,
                    autoPlay: true,
                    pageSnapping: true,
                    aspectRatio: 9 / 16,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                  ),
                  items: bannerImages.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 3.h),
                          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.h),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                              )
                            ]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.h),
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  ConstantImages.onBoarding1,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              },
                            )
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                DotsIndicator(
                  position: _currentCarouselPosition,
                  dotsCount: bannerImages.length,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    color: AppColors.grey,
                    size: Size.square(10),
                    activeColor: AppColors.primary,
                    activeSize: Size(20.w, 5.h),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.h),
                    )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _greetingText(String text, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    maxLines: 1,
    softWrap: true,
    textAlign: TextAlign.start,
    style: TextStyle(color: AppColors.white, fontSize: fontSize, fontWeight: fontWeight),
  );
}

Widget _searchBox(TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      hintText: 'Search...',
      fillColor: AppColors.white,
      prefixIcon: Icon(Iconsax.search_normal_1, color: AppColors.grey),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.w)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.w)
      ),
    ),
  );
}
