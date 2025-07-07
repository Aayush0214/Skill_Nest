import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/entity/user_entity.dart';
import 'package:skill_nest/features/authentication/domain/usecases/user_auth_state.dart';
import 'package:skill_nest/features/authentication/domain/usecases/login_with_email_password.dart';
import 'package:skill_nest/features/authentication/domain/usecases/signup_with_email_password.dart';
import 'package:skill_nest/features/authentication/domain/usecases/signin_with_google.dart';
import 'package:skill_nest/features/authentication/domain/usecases/send_email_verification.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserAuthState _authStateChanges;
  final LoginWithEmailPassword _loginUser;
  final SignInWithGoogle _signInWithGoogle;
  final SignUpWithEmailPassword _signUpUser;
  final SendEmailVerification _sendEmailVerification;
  StreamSubscription<User?>? authStateSubscription;

  AuthBloc({
    required UserAuthState authStateChanges,
    required LoginWithEmailPassword loginUser,
    required SignInWithGoogle signInWithGoogle,
    required SignUpWithEmailPassword signUpUser,
    required SendEmailVerification emailVerification,
  })
    : _loginUser = loginUser,
      _signUpUser = signUpUser,
      _authStateChanges = authStateChanges,
      _signInWithGoogle = signInWithGoogle,
      _sendEmailVerification = emailVerification,
      super(AuthInitial()) {

    // Listen to Firebase auth state changes right away
    authStateSubscription = _authStateChanges().listen((user) {
      add(AuthStateChangedEvent(user));
    });

    on<AuthEvent>((event, emit) {});

    on<AuthStateChangedEvent>(_authStateChanged);

    on<ShowPasswordEvent>(_showPasswordValue);

    on<LoginWithEmailPasswordEvent>(_loginEvent);

    on<SignUpWithEmailPasswordEvent>(_signUpEvent);

    on<SignInWithGoogleEvent>(_googleSignInEvent);

    on<SendEmailVerificationEvent>(_sendEmailVerificationRequest);
  }

  /// Show password value
  void _showPasswordValue(ShowPasswordEvent event, Emitter<AuthState> emit) {
    emit(ShowPasswordState(showPassword: !event.showPassword));
  }

  /// Auth state of the user
  void _authStateChanged(AuthStateChangedEvent event, Emitter<AuthState> emit) {
    final user = event.user;
    if (user == null) {
      emit(UnauthenticatedState());
    } else {
      if (user.providerData.any((info) => info.providerId == 'password') && !user.emailVerified) {
        // User signed up with email but not verified
        emit(EmailNotVerifiedState(user: user));
      } else {
        // User is logged in (either via Google or verified email)
        emit(AuthenticatedState(user: user));
      }
    }
  }

  /// Login with email and password
  void _loginEvent(LoginWithEmailPasswordEvent event, Emitter<AuthState> emit) async {
    if (event.email.isNotEmpty && event.password.isNotEmpty) {
      final res = await _loginUser(
        UserCredentials(email: event.email, password: event.password),
      );
      res.fold(
        (failure) => emit(AuthFailureState(message: failure.message)),
        (success) => emit(AuthSuccessState(user: success)),
      );
    } else {
      emit(AuthFailureState(message: 'Email & Password is required!!'));
    }
  }

  /// Signup with email and password
  void _signUpEvent(SignUpWithEmailPasswordEvent event, Emitter<AuthState> emit) async {
    final res = await _signUpUser(
      SignupCredentials(email: event.email, password: event.password),
    );
    res.fold(
      (failure) => emit(AuthFailureState(message: failure.message)),
      (success) => emit(AuthSuccessState(user: success)),
    );
  }

  /// Login with google
  void _googleSignInEvent(SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    final res = await _signInWithGoogle(NoParams());
    res.fold(
      (failure) => emit(AuthFailureState(message: failure.message)),
      (success) => emit(AuthSuccessState(user: success)),
    );
  }

  /// Send email verification request
  void _sendEmailVerificationRequest(SendEmailVerificationEvent event, Emitter<AuthState> emit) async {
    final res = await _sendEmailVerification(NoParams());
    res.fold(
      (failure) => emit(AuthFailureState(message: failure.message)),
      (success) => emit(EmailVerifiedState()),
    );
  }
}
