part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardChangedState extends DashboardState {
  final int dashboardIndex;

  DashboardChangedState(this.dashboardIndex);
}
