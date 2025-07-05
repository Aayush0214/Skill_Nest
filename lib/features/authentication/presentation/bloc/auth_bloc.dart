import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthLoginEvent>((event, emit) {
      debugPrint('AuthLoginEvent called');
      debugPrint('email: ${event.email}');
      debugPrint('password: ${event.password}');
      if (event.email.isNotEmpty && event.password.isNotEmpty) {

      } else {
        emit(AuthFailureState(message: 'Email & Password is required!!'));
      }
    });
  }
}
