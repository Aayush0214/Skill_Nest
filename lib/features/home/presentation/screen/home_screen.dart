import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

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
                Text('Normal ui')
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
