part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class ShowPasswordEvent extends AuthEvent {
  final bool showPassword;

  ShowPasswordEvent({required this.showPassword});
}

final class AuthStateChangedEvent extends AuthEvent {
  final User? user;

  AuthStateChangedEvent(this.user);
}

final class LoginWithEmailPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  LoginWithEmailPasswordEvent({required this.email, required this.password});
}

final class SignUpWithEmailPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpWithEmailPasswordEvent({required this.email, required this.password});
}

final class SignInWithGoogleEvent extends AuthEvent {}

final class SendEmailVerificationEvent extends AuthEvent {}
