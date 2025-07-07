part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class ShowPasswordState extends AuthState {
  final bool showPassword;

  ShowPasswordState({required this.showPassword});
}

final class AuthenticatedState extends AuthState {
  final User user;
  AuthenticatedState({required this.user});
}

final class UnauthenticatedState extends AuthState {}

final class EmailVerifiedState extends AuthState {}

final class EmailNotVerifiedState extends AuthState {
  final User user;

  EmailNotVerifiedState({required this.user});
}

final class AuthSuccessState extends AuthState {
  final UserEntity user;
  AuthSuccessState({required this.user});
}

final class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState({required this.message});
}
