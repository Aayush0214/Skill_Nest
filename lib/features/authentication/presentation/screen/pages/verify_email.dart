import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/snackbar.dart';
import 'package:skill_nest/core/common/widgets/dialog_box.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/constants/constant_strings.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/core/common/widgets/common_button.dart';
import 'package:skill_nest/core/common/widgets/loading_dialog.dart';
import 'package:skill_nest/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/login.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/textfield_heading.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          LoadingDialog.iOSLoadingDialog(context);
        } else if (state is EmailVerifiedState) {
          LoadingDialog.hide(context);
          showIOSDialog(
            context,
            ConstantStrings.checkYourMail,
            ConstantStrings.checkYourMailMessage,
            () {
              Navigator.pop(context);
              NavigationService.pushAndRemoveUntil(context, Login());
            },
          );
        } else if (state is AuthFailureState) {
          LoadingDialog.hide(context);
          showSnackBar(context: context, color: AppColors.red, content: state.message, icon: Icons.report_gmailerrorred);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 300.w,
                    child: Image.asset(ConstantImages.emailVerificationImage1),
                  ),
                  SizedBox(height: 10.h),

                  textFieldHeading(
                    ConstantStrings.verifyEmailPageContent,
                    TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: commonButton(
              () => context.read<AuthBloc>().add(SendEmailVerificationEvent()),
              ConstantStrings.verifyEmailButtonText,
            ),
          ),
        );
      },
    );
  }
}
