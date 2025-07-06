import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<ShowPasswordEvent> ((event, emit) {
      emit(ShowPasswordState(showPassword: !event.showPassword));
    });
    on<AuthLoginEvent>(_loginEvent);
  }


  void _loginEvent(AuthLoginEvent event, Emitter<AuthState> emit) {
    if (event.email.isNotEmpty && event.password.isNotEmpty) {

    } else {
      emit(AuthFailureState(message: 'Email & Password is required!!'));
    }
  }
}
