part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded<SuccessType> extends ProfileState {
  final SuccessType data;
  ProfileLoaded(this.data);
}

final class ProfileError extends ProfileState {
  final Failures failure;
  ProfileError(this.failure);
}
