import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/usecases/logout.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final LogoutUseCase _logoutUseCase;

  ProfileBloc({required LogoutUseCase logoutUserUseCase})
    : _logoutUseCase = logoutUserUseCase,
      super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<LogoutEvent>(_logoutUser);
  }

  void _logoutUser(LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());

    final res = await _logoutUseCase(NoParams());
    res.fold(
      (failure) => emit(ProfileFailureState(message: failure.message)),
      (success) => emit(LogoutSuccessState()),
    );
  }
}
