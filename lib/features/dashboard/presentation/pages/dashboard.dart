import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/features/home/presentation/screen/home_screen.dart';
import 'package:skill_nest/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:skill_nest/features/profile/presentation/screen/pages/profile_page.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<Widget> _screens = [
    HomeScreen(),
    Container(
      color: AppColors.white,
      child: Center(
        child: Text('Search'),
      ),
    ),
    Container(
      color: AppColors.white,
      child: Center(
        child: Text('Course'),
      ),
    ),
    Container(
      color: AppColors.white,
      child: Center(
        child: Text('Chat'),
      ),
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardChangedState) {
          index = state.dashboardIndex;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: _screens[index],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.appBgGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: AppColors.grey,
                )
              ]
            ),
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: index,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: AppColors.grey,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: AppColors.primary,
              onTap: (newIndex) => context.read<DashboardBloc>().add(DashboardChangeEvent(newIndex)),
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Iconsax.home_1),
                ),
                BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(Iconsax.search_normal_14),
                ),
                BottomNavigationBarItem(
                  label: 'Play',
                  icon: Icon(Iconsax.play),
                ),
                BottomNavigationBarItem(
                  label: 'Messages',
                  icon: Icon(Iconsax.message),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Iconsax.user),
                ),
              ],
            ),
          )
        );
      },
    );
  }
}
