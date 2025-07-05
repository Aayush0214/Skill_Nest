part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState({required this.message});
}