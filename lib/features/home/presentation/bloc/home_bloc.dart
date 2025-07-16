import 'package:flutter/material.dart';
import '../../../../core/constants/enums.dart';
import '../../domain/entity/dummy_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit){});

    on<BannerChangeEvent>(_changeIndicator);
    on<FilterChangedEvent>(_onFilterChanged);
  }

  void _changeIndicator(BannerChangeEvent event, Emitter<HomeState> emit) {
    emit (IndicatorState(indicatorIndex: event.bannerIndex.toDouble()));
  }

  Future<void> _onFilterChanged(FilterChangedEvent event, Emitter<HomeState> emit) async {
    final allCourses = _dummyCourses();
    List<Course> filtered = [];

    switch (event.selectedFilter) {
      case CourseFilterType.all:
        filtered = allCourses;
        break;
      case CourseFilterType.popular:
        filtered = allCourses.where((c) => c.isPopular).toList();
        break;
      case CourseFilterType.newest:
        filtered = allCourses.where((c) => c.isNew).toList();
        break;
    }

    emit(FilteredCourseState(event.selectedFilter, filtered));
  }

  List<Course> _dummyCourses() {
    return [
      Course(title: 'Flutter Development Master Course Flutter Development Master Course'),
      Course(title: 'Popular Flutter UI', isPopular: true),
      Course(title: 'Latest Dart Features', isNew: true),
      Course(title: 'Advanced BLoC', isPopular: true),
      Course(title: 'New Firebase Tricks', isNew: true),
      Course(title: 'Flutter Basics Flutter Development Master Course'),
      Course(title: 'Flutter Development Master Course'),
      Course(title: 'Popular Flutter UI', isPopular: true),
      Course(title: 'Latest Dart Features Flutter Development Master Course', isNew: true),
      Course(title: 'Advanced BLoC', isPopular: true),
      Course(title: 'New Firebase Tricks', isNew: true),
    ];
  }
}