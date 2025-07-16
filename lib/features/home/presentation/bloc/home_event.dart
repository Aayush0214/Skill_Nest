part of 'home_bloc.dart';

@immutable
sealed class HomeEvent{}

final class BannerChangeEvent extends HomeEvent {
  final int bannerIndex;

  BannerChangeEvent({required this.bannerIndex});
}

final class FilterChangedEvent extends HomeEvent {
  final CourseFilterType selectedFilter;

  FilterChangedEvent(this.selectedFilter);
}
