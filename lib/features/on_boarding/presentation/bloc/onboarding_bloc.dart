import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/on_boarding/domain/usecase/set_onboarding_shown.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int _totalPages = 3;
  final SetOnboardingShown _onboardingShown;
  OnboardingBloc({
    required SetOnboardingShown setOnboardingShown
  }) : _onboardingShown = setOnboardingShown,
        super(OnboardingCurrentState(currentIndex: 0)) {
    on<OnboardingEvent>((event, emit) {});

    on<OnboardingPageSwiped>((event, emit) => emit(OnboardingCurrentState(currentIndex: event.index)));

    on<NextPageEvent>(_changeToNextPage);
  }

  void _changeToNextPage(NextPageEvent event, Emitter<OnboardingState> emit) async {
    final current = state;
    if (current is OnboardingCurrentState){
      if (current.currentIndex < _totalPages-1) {
        emit(OnboardingCurrentState(currentIndex: current.currentIndex+1));
      } else {
        await _onboardingShown(NoParams());
        emit(OnboardingCompleteState());
      }
    }
  }
}
