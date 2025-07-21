import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<CourseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
