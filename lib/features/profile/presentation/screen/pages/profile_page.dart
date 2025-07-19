import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_nest/core/common/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/snackbar.dart';
import 'package:skill_nest/core/common/widgets/dialog_box.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/core/common/widgets/loading_dialog.dart';
import 'package:skill_nest/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/login.dart';
import 'package:skill_nest/features/profile/presentation/screen/widgets/option_tile.dart';
import 'package:skill_nest/features/profile/presentation/screen/widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoadingState) {
          LoadingDialog.iOSLoadingDialog(context, message: 'Please wait...');
        } else if (state is ProfileFailureState) {
          LoadingDialog.hide(context);
          showSnackBar(context: context, content: state.message);
        } else if (state is LogoutSuccessState) {
          LoadingDialog.hide(context);
          NavigationService.pushAndRemoveUntil(context, Login());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: commonAppBar('My Profile'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                children: [

                  /// Profile Header
                  profileHeader(
                    myCourse: (){},
                    buyCourse: (){},
                    performance: (){},
                  ),
                  SizedBox(height: 10.h),

                  /// Profile options
                  optionListTile(
                    optionText: 'Update Profile',
                    optionIcon: Iconsax.edit,
                    onOptionTap: () {},
                  ),
                  SizedBox(height: 10.h),

                  optionListTile(
                    optionText: 'Settings',
                    optionIcon: Iconsax.setting_2,
                    onOptionTap: () {},
                  ),
                  SizedBox(height: 10.h),

                  optionListTile(
                    optionText: 'Payment Details',
                    optionIcon: Iconsax.dollar_square,
                    onOptionTap: () {},
                  ),
                  SizedBox(height: 10.h),

                  optionListTile(
                    optionText: 'Privacy Policy',
                    optionIcon: Iconsax.book_1,
                    onOptionTap: () {},
                  ),
                  SizedBox(height: 10.h),

                  optionListTile(
                    optionText: 'Help and support',
                    optionIcon: Iconsax.support,
                    onOptionTap: () {},
                  ),
                  SizedBox(height: 10.h),

                  optionListTile(
                    optionText: 'Logout',
                    bgColor: AppColors.red,
                    textColor: AppColors.red,
                    optionIcon: Iconsax.logout,
                    onOptionTap: () {
                      showLogoutConfirmationDialog(
                          context: context,
                          title: "Confirm Logout",
                          subTitle: "Are you sure you want to logout?",
                          onConfirm: () {
                            Navigator.pop(context);
                            context.read<ProfileBloc>().add(LogoutEvent());
                          }
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
