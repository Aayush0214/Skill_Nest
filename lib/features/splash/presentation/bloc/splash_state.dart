part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitialState extends SplashState {}

final class NavigateToOnboardingState extends SplashState {}

final class NavigateToDashboardState extends SplashState {}

final class NavigateToLoginState extends SplashState {
  final String? message;

  NavigateToLoginState([this.message = '']);
}