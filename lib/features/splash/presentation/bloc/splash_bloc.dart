import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/features/splash/domain/usecase/check_auth_state.dart';
import 'package:skill_nest/features/splash/domain/usecase/is_onboarding_screen.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthStateUsecase _isUserExist;
  final IsOnboardingScreenUsecase _isFirsTimeEntry;
  StreamSubscription<User?>? authStateSubscription;

  SplashBloc({
    required CheckAuthStateUsecase checkAuthState,
    required IsOnboardingScreenUsecase isOnboarding,
  }) : _isFirsTimeEntry = isOnboarding,
       _isUserExist = checkAuthState,
       super(SplashInitialState()) {
    // Listen to Firebase auth state changes right away
    authStateSubscription = _isUserExist()
        .take(1)
        .listen((user) {
      debugPrint("stream method called adding data");
      add(CheckInitialScreenEvent(user: user));
    });

    on<SplashEvent>((event, emit) {});

    on<CheckInitialScreenEvent>(_checkInitialScreen);
  }

  void _checkInitialScreen(CheckInitialScreenEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    final result = await _isFirsTimeEntry.isOnboarding();
    if (!result) {
      emit (NavigateToOnboardingState());
    }
    if (event.user == null) {
      debugPrint('user found null');
      emit(NavigateToLoginState());
    } else if (!event.user!.emailVerified) {
      debugPrint('email not verified');
      emit(NavigateToLoginState());
    } else {
      debugPrint('dashboard');
      emit(NavigateToDashboardState());
    }
  }

  @override
  Future<void> close() {
    authStateSubscription?.cancel();
    return super.close();
  }
}
// final res = await _isUserExist();
// res.fold(
// (failure) => emit (NavigateToLoginState(failure.message)),
// (user){
// if (user != null) {
// if (user.emailVerified) {
// emit (NavigateToDashboardState());
// } else {
// emit (NavigateToLoginState());
// }
// } else {
// emit (NavigateToLoginState());
// }
// }
// );