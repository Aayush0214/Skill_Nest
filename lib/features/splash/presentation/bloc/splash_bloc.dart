import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/features/splash/domain/usecase/check_auth_state.dart';
import 'package:skill_nest/features/splash/domain/usecase/is_onboarding_screen.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthStateUsecase _isUserExist;
  final IsOnboardingScreenUsecase _isFirsTimeEntry;
  StreamSubscription<Either<Failure, User?>>? authStateSubscription;

  SplashBloc({
    required CheckAuthStateUsecase checkAuthState,
    required IsOnboardingScreenUsecase isOnboarding,
  }) : _isFirsTimeEntry = isOnboarding,
       _isUserExist = checkAuthState,
       super(SplashInitialState()) {
    // Listen to Firebase auth state changes right away
    authStateSubscription = _isUserExist().listen((either) {
      either.fold(
        (failure) {
          debugPrint(failure.message);
          add(CheckInitialScreenEvent(user: null, message: failure.message)); // treat as not logged in
        },
        (user) {
          add(CheckInitialScreenEvent(user: user));
        },
      );
    });

    on<SplashEvent>((event, emit) {});

    on<CheckInitialScreenEvent>(_checkInitialScreen);
  }

  void _checkInitialScreen(
    CheckInitialScreenEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    final result = await _isFirsTimeEntry.isOnboarding();
    if (!result) {
      emit(NavigateToOnboardingState());
    } else {
      if (event.user == null) {
        if (event.message != null) {
          if (event.message!.contains('Network error occurred.')) {
            emit(NavigateToLoginState(event.message));
          }
        } else {
          emit(NavigateToLoginState());
        }
      } else if (!event.user!.emailVerified) {
        debugPrint('email not verified');
        emit(NavigateToVerifyEmailState());
      } else {
        emit(NavigateToDashboardState());
      }
    }
  }

  @override
  Future<void> close() {
    authStateSubscription?.cancel();
    return super.close();
  }
}
