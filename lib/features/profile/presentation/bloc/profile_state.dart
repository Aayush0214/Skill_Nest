part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class LogoutSuccessState extends ProfileState {}

final class ProfileFailureState extends ProfileState {
  final String message;

  ProfileFailureState({required this.message});
}
