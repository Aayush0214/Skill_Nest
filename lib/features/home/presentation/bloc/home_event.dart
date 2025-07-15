part of 'home_bloc.dart';

@immutable
sealed class HomeEvent{}

final class BannerChangeEvent extends HomeEvent {
  final int bannerIndex;

  BannerChangeEvent({required this.bannerIndex});
}