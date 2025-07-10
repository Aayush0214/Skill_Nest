import 'package:get_it/get_it.dart';
import 'core/network/connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_nest/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:skill_nest/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:skill_nest/features/on_boarding/presentation/bloc/onboarding_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:skill_nest/features/authentication/domain/usecases/user_auth_state.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';
import 'package:skill_nest/features/authentication/domain/usecases/signin_with_google.dart';
import 'package:skill_nest/features/authentication/domain/usecases/send_email_verification.dart';
import 'package:skill_nest/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:skill_nest/features/authentication/domain/usecases/login_with_email_password.dart';
import 'package:skill_nest/features/authentication/data/repository_impl/auth_repository_impl.dart';
import 'package:skill_nest/features/authentication/domain/usecases/signup_with_email_password.dart';
import 'package:skill_nest/core/services/local_storage_service/domain/repository/local_storage.dart';
import 'package:skill_nest/core/services/local_storage_service/data/repository_impl/local_storage_impl.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerFactory(() => InternetConnection());
  sl.registerFactory<ConnectionChecker>(() => ConnectionCheckerImpl(internetConnection: sl()));

  _onBoardingRegistration();
  _authRegistration();
  _dashboardRegistration();
}


void _onBoardingRegistration() {
  sl.registerLazySingleton(() => OnboardingBloc());
}

void _authRegistration() {
  sl..registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(firebaseAuth: sl(), googleSignIn: sl()))
    ..registerFactory<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl(), connectionChecker: sl()))
    ..registerFactory(() => UserAuthState(repository: sl()))
    ..registerFactory(() => LoginWithEmailPassword(authRepository: sl()))
    ..registerFactory(() => SignUpWithEmailPassword(authRepository: sl()))
    ..registerFactory(() => SignInWithGoogle(authRepository: sl()))
    ..registerFactory(() => SendEmailVerification(authRepository: sl()))
    ..registerLazySingleton(() => AuthBloc(authStateChanges: sl(), loginUser: sl(), signInWithGoogle: sl(), signUpUser: sl(), emailVerification: sl()));
}

void _dashboardRegistration() {
  sl.registerLazySingleton(() => DashboardBloc());
}