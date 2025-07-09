import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/snackbar.dart';
import 'package:skill_nest/core/constants/constant_images.dart';
import 'package:skill_nest/core/common/widgets/dialog_box.dart';
import 'package:skill_nest/core/constants/constant_strings.dart';
import 'package:skill_nest/core/services/navigation_service.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/core/common/widgets/common_button.dart';
import 'package:skill_nest/core/common/widgets/loading_dialog.dart';
import 'package:skill_nest/features/dashboard/presentation/pages/dashboard.dart';
import 'package:skill_nest/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/signup.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/verify_email.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/social_icon.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/auth_divider.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/form_textfield.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/textfield_heading.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _dontShowPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ShowPasswordState) {
            _dontShowPassword = state.showPassword;
          } else if (state is AuthLoadingState) {
            LoadingDialog.iOSLoadingDialog(context);
          } else if (state is AuthFailureState) {
            LoadingDialog.hide(context);
            showSnackBar(context: context, color: AppColors.red, content: state.message, icon: Icons.report_gmailerrorred);
          } else if (state is EmailNotVerifiedState) {
            LoadingDialog.hide(context);
            showIOSDialog(
              context,
              ConstantStrings.emailNotVerifiedHeading,
              ConstantStrings.emailNotVerifiedInfo,
              (){
                Navigator.pop(context);
                NavigationService.pushAndRemoveUntil(context, VerifyEmail());
              },
            );
          } else if (state is AuthSuccessState) {
            LoadingDialog.hide(context);
            NavigationService.pushAndRemoveUntil(context, Dashboard());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.h),
                    Text(
                      ConstantStrings.loginScreenHeading,
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    textFieldHeading(ConstantStrings.loginScreenSubHeading),
                    SizedBox(height: 30.h),

                    textFieldHeading('Email'),
                    SizedBox(height: 5.h),
                    formTextField(
                      isSuffix: false,
                      obscureText: false,
                      prefixIcon: Iconsax.sms,
                      hintText: 'Enter your email',
                      textController: _emailController,
                    ),
                    SizedBox(height: 20.h),

                    textFieldHeading('Password'),
                    SizedBox(height: 5.h),
                    formTextField(
                      isSuffix: true,
                      prefixIcon: Iconsax.lock_1,
                      obscureText: _dontShowPassword,
                      hintText: 'Enter your password',
                      textController: _passwordController,
                      suffixIcon:_dontShowPassword ? Iconsax.eye_slash : Iconsax.eye,
                      showPassword: () => context.read<AuthBloc>().add(ShowPasswordEvent(showPassword: _dontShowPassword)),
                    ),
                    SizedBox(height: 1.h),

                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        textStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: Text(ConstantStrings.forgotPasswordText),
                    ),
                    SizedBox(height: 20.h),

                    commonButton(
                      () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<AuthBloc>().add(
                          LoginWithEmailPasswordEvent(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          ),
                        );
                      },
                      ConstantStrings.loginText,
                    ),
                    SizedBox(height: 25.h),

                    authDivider(),
                    SizedBox(height: 25.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        socialContainer(ConstantImages.google, () {}),
                        socialContainer(ConstantImages.apple, () {}),
                        socialContainer(ConstantImages.facebook, () {}),
                      ],
                    ),
                    SizedBox(height: 25.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textFieldHeading(ConstantStrings.notRegisteredText),
                        TextButton(
                          onPressed: () => NavigationService.pushReplacement(context, SignUp()),
                          child: Text(
                            ConstantStrings.registerButtonText,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
