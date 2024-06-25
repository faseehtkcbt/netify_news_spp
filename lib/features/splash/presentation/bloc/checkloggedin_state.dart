part of 'checkloggedin_bloc.dart';

@immutable
abstract class CheckloggedinState {}

class CheckloggedinInitial extends CheckloggedinState {}

class CheckloggedinLoading extends CheckloggedinState {}

class CheckloggedinLoaded extends CheckloggedinState {
  final bool isLogged;
  CheckloggedinLoaded(this.isLogged);
}

class CheckloggedinError extends CheckloggedinState {
  final Failures failure;

  CheckloggedinError(this.failure);
}
