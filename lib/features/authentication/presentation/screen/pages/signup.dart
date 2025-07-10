import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/snackbar.dart';
import 'package:skill_nest/core/constants/constant_strings.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/core/common/widgets/common_button.dart';
import 'package:skill_nest/core/common/widgets/loading_dialog.dart';
import 'package:skill_nest/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/login.dart';
import 'package:skill_nest/features/authentication/presentation/screen/pages/verify_email.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/form_textfield.dart';
import 'package:skill_nest/features/authentication/presentation/screen/widgets/textfield_heading.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _dontShowPassword = true;
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            showSnackBar(context: context, content: state.message, icon: Icons.report_gmailerrorred, color: AppColors.red);
          } else if (state is EmailNotVerifiedState) {
            LoadingDialog.hide(context);
            NavigationService.pushAndRemoveUntil(context, VerifyEmail());
          } else if (state is EmailVerifiedState) {
            LoadingDialog.hide(context);
            NavigationService.pushAndRemoveUntil(context, Login());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Text(
                        ConstantStrings.signupScreenHeading,
                        style: TextStyle(
                          fontSize: 27.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      textFieldHeading(ConstantStrings.signupScreenSubHeading),
                      SizedBox(height: 30.h),

                      textFieldHeading('Username'),
                      SizedBox(height: 5.h),
                      formTextField(
                        isSuffix: false,
                        obscureText: false,
                        prefixIcon: Iconsax.sms,
                        hintText: 'Enter your username',
                        textController: _usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Username is required');
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      textFieldHeading('Email'),
                      SizedBox(height: 5.h),
                      formTextField(
                        isSuffix: false,
                        obscureText: false,
                        prefixIcon: Iconsax.sms,
                        hintText: 'Enter your email',
                        textController: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Email is required');
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      textFieldHeading('Password'),
                      SizedBox(height: 5.h),
                      formTextField(
                        isSuffix: true,
                        prefixIcon: Iconsax.lock_1,
                        obscureText: _dontShowPassword,
                        hintText: 'Enter your password',
                        textController: _passwordController,
                        suffixIcon: _dontShowPassword ? Iconsax.eye_slash : Iconsax.eye,
                        showPassword: () => context.read<AuthBloc>().add(ShowPasswordEvent(showPassword: _dontShowPassword)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Password is required');
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),

                      textFieldHeading('Confirm Password'),
                      SizedBox(height: 5.h),
                      formTextField(
                        isSuffix: true,
                        prefixIcon: Iconsax.lock4,
                        obscureText: _dontShowPassword,
                        hintText: 'Confirm your password',
                        textController: _confirmPasswordController,
                        suffixIcon: _dontShowPassword ? Iconsax.eye_slash : Iconsax.eye,
                        showPassword: () => context.read<AuthBloc>().add(ShowPasswordEvent(showPassword: _dontShowPassword)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Confirm Password is required');
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.h),

                      commonButton(
                        () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_signUpFormKey.currentState!.validate()) {
                            if (_passwordController.text.compareTo(_confirmPasswordController.text) == 0){
                              context.read<AuthBloc>().add(
                                SignUpWithEmailPasswordEvent(
                                  username: _usernameController.text,
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                ),
                              );
                            } else {
                              showSnackBar(context: context, content: 'Confirm password not matched.', icon: Icons.report_gmailerrorred, color: AppColors.red);
                            }
                          }
                        },
                        ConstantStrings.registerButtonText,
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          textFieldHeading(ConstantStrings.alreadyHaveAccount),
                          TextButton(
                            onPressed:
                                () => NavigationService.pushReplacement(
                                  context,
                                  Login(),
                                ),
                            child: Text(
                              ConstantStrings.signinText,
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
            ),
          );
        },
      ),
    );
  }
}
