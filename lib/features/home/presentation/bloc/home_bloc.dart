import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit){});

    on<BannerChangeEvent>(_changeIndicator);
  }

  void _changeIndicator(BannerChangeEvent event, Emitter<HomeState> emit) {
    emit (IndicatorState(indicatorIndex: event.bannerIndex.toDouble()));
  }
}