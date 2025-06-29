part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingCurrentState extends OnboardingState {
  final int currentIndex;

  OnboardingCurrentState({required this.currentIndex});
}

final class OnboardingCompleteState extends OnboardingState {}
