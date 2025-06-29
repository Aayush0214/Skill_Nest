part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

final class OnboardingPageSwiped extends OnboardingEvent {
  final int index;

  OnboardingPageSwiped({required this.index});
}

final class NextPageEvent extends OnboardingEvent {}