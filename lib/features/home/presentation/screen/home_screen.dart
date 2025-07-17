import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_nest/core/constants/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/common/widgets/dot_indicator.dart';
import 'package:skill_nest/features/home/presentation/bloc/home_bloc.dart';
import 'package:skill_nest/features/home/presentation/widgets/home_header.dart';
import 'package:skill_nest/features/home/presentation/widgets/home_slider.dart';
import 'package:skill_nest/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:skill_nest/features/home/presentation/widgets/home_filter_chips.dart';
import 'package:skill_nest/features/home/presentation/widgets/home_courses_grid_view.dart';

import '../../domain/entity/dummy_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentCarouselPosition = 0;
  var _selectedFilter = CourseFilterType.all;
  List<Course> _filteredCourses = [];
  final TextEditingController _searchController = TextEditingController();
  final List<String> _bannerImages = [
    ConstantImages.banner_1,
    ConstantImages.banner_2,
    ConstantImages.banner_3,
  ];

  @override
  void initState() {
    context.read<HomeBloc>().add(FilterChangedEvent(CourseFilterType.all));
    super.initState();
  }

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
          /// Top header
          BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccessState) {}
              },
              child: homeHeader(
                userName: 'Aayush',
                searchController: _searchController,
                userProfileImage: ConstantImages.profileImage,
              ),
          ),

          /// Slider & DotIndicator
          SliverList(
            delegate: SliverChildListDelegate( [
              SizedBox(height: 10.h),

              /// Slider
              slider(
                bannerImages: _bannerImages,
                onPageChanged: (index, reason) {
                  context.read<HomeBloc>().add(BannerChangeEvent(bannerIndex: index));
                },
              ),

              /// dot indicator
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if ( state is IndicatorState){
                    _currentCarouselPosition = state.indicatorIndex;
                  }
                  return dotIndicator( _currentCarouselPosition, count: _bannerImages.length);
                },
              ),
            ]),
          ),

          /// Title & Filters
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                rowHeading(),
                // Filter Chips
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is FilteredCourseState ) {
                      _selectedFilter = state.selectedFilter;
                    }
                    return choiceChip(
                      selectedFilter: _selectedFilter,
                      onFilterSelected: (filter) => context.read<HomeBloc>().add(FilterChangedEvent(filter))
                    );
                  },
                ),
              ]),
            ),
          ),

          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is FilteredCourseState) {
                _filteredCourses = state.filteredCourses;
              }
              return courses(filteredCourses: _filteredCourses);
            },
          ),
        ],
      ),
    );
  }
}






