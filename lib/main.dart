import 'package:flutter/services.dart';

import 'injection.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/theme/app_theme/app_theme.dart';
import 'package:skill_nest/features/home/presentation/bloc/home_bloc.dart';
import 'package:skill_nest/features/splash/presentation/screen/splash.dart';
import 'package:skill_nest/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:skill_nest/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:skill_nest/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:skill_nest/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'features/course_details/presentation/bloc/video_player/course_playback_bloc.dart';
import 'package:skill_nest/features/on_boarding/presentation/bloc/onboarding_bloc.dart';
import 'package:skill_nest/core/services/notification_service/notification_service.dart';
import 'package:skill_nest/features/course_details/presentation/bloc/course_details_bloc/course_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  await NotificationService.instance.initialize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SplashBloc>()),
        BlocProvider(create: (_) => sl<OnboardingBloc>()),
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<DashboardBloc>()),
        BlocProvider(create: (_) => sl<HomeBloc>()),
        BlocProvider(create: (_) => sl<ProfileBloc>()),
        // search bloc remaining
        // course bloc remaining
        BlocProvider(create: (_) => CourseDetailsBloc()),
        BlocProvider(create: (_) => CoursePlaybackBloc()),
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
          home: SplashScreen(),
        );
      },
    );
  }
}
