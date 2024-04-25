part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  RegisterEvent({
    required this.name,
    required this.password,
    required this.email,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({
    required this.password,
    required this.email,
  });
}
