import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {});
    on<DashboardChangeEvent>(_dashboardChange);
  }

  void _dashboardChange(DashboardChangeEvent event, Emitter<DashboardState> emit) {
    emit(DashboardChangedState(event.dashboardIndex));
  }
}
