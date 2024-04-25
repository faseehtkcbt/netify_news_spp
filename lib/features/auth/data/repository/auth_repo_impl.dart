import 'package:dartz/dartz.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_datasource.dart';
import '../model/user_model.dart';

class AuthRepositoryImplementation implements AuthRepository {
  AuthDataSource authDataSource;
  AuthRepositoryImplementation(this.authDataSource);
  @override
  Future<Either<Failures, UserModel>> loginUser(
      {required String email, required String password}) async {
    return _getUser(() async => await authDataSource.loginUser(
          email: email,
          password: password,
        ));
  }

  @override
  Future<Either<Failures, UserModel>> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    return _getUser(() async => await authDataSource.registerUser(
        email: email, password: password, username: name));
  }
}

Future<Either<Failures, UserModel>> _getUser(
    Future<UserModel> Function() fn) async {
  try {
    final userId = await fn();
    return right(userId);
  } on sb.AuthException catch (e) {
    return Left(Failures(message: e.message.toString()));
  } on ServerExceptions catch (e) {
    return Left(Failures(message: e.exception.toString()));
  }
}
