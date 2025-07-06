part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class ShowPasswordEvent extends AuthEvent {
  final bool showPassword;

  ShowPasswordEvent({required this.showPassword});
}

final class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});
}