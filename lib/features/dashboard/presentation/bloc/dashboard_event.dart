part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

final class DashboardChangeEvent extends DashboardEvent {
  final int dashboardIndex;

  DashboardChangeEvent(this.dashboardIndex);
}
