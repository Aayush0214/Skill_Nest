import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_theme/app_theme.dart';
import 'package:skill_nest/features/on_boarding/presentation/bloc/onboarding_bloc.dart';
import 'package:skill_nest/features/on_boarding/presentation/screens/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnboardingBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          home: const OnBoarding(),
        );
      },
    );
  }
}
