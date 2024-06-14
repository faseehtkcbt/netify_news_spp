import 'package:dartz/dartz.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/failures.dart';

import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_datasource.dart';
import '../datasource/local_auth_datasource.dart';
import '../model/user_model.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthDataSource authDataSource;
  final LocalAuthDatasource localData;
  AuthRepositoryImplementation(this.authDataSource, this.localData);
  @override
  Future<Either<Failures, UserModel>> loginUser(
      {required String email, required String password}) async {
    try {
      final userId = await authDataSource.loginUser(
        email: email,
        password: password,
      );
      localData.storeLocalData(userId);
      return right(userId);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final result = await authDataSource.registerUser(
          email: email, password: password, username: name);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }
}
