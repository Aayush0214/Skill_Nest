part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

final class CheckInitialScreenEvent extends SplashEvent {
  final User? user;
  final String? message;

  CheckInitialScreenEvent({this.user, this.message});
}