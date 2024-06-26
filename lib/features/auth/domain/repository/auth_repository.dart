import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';

import '../entity/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, String>> registerUser({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failures, UserEntity>> loginUser({
    required String email,
    required String password,
  });
}
