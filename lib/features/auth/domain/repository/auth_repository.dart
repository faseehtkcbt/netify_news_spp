import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/Failures.dart';

import '../entity/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, UserEntity>> registerUser({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failures, UserEntity>> loginUser({
    required String email,
    required String password,
  });
}
