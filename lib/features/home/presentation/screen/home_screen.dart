import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/features/home/presentation/bloc/home_bloc.dart';
import 'package:skill_nest/features/home/presentation/widgets/home_header.dart';
import 'package:skill_nest/features/home/presentation/widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentCarouselPosition = 0;
  final TextEditingController _searchController = TextEditingController();
  final List<String> _bannerImages = [
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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is IndicatorState) {
          _currentCarouselPosition = state.indicatorIndex;
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: CustomScrollView(
            slivers: [
              /// Top header
              homeHeader(
                userName: 'Aayush',
                searchController: _searchController,
                userProfileImage: 'https://randomuser.me/api/portraits/men/1.jpg',
              ),

              /// Slider & DotIndicator
              homeSlider(
                bannerImages: _bannerImages,
                currentCarouselPosition: _currentCarouselPosition,
                onPageChanged: (index, reason) {
                  context.read<HomeBloc>().add(BannerChangeEvent(bannerIndex: index));
                },
              ),



              Row(
                children: [
                  Chip(
                    label: Text('All'),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}






