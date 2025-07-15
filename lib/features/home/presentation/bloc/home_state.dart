part of 'home_bloc.dart';

@immutable
sealed class HomeState{}

final class HomeInitial extends HomeState {}

final class IndicatorState extends HomeState {
  final double indicatorIndex;

  IndicatorState({required this.indicatorIndex});
}