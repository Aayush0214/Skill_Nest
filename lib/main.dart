import 'injection.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_theme/app_theme.dart';
import 'features/on_boarding/presentation/screens/pages/on_boarding.dart';
import 'package:skill_nest/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:skill_nest/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:skill_nest/features/on_boarding/presentation/bloc/onboarding_bloc.dart';


import 'package:skill_nest/features/dashboard/presentation/pages/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<OnboardingBloc>()),
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<DashboardBloc>()),
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
          home: Dashboard(),
        );
      },
    );
  }
}
