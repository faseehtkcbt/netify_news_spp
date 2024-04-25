part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity userEntity;
  AuthSuccess(this.userEntity);
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
