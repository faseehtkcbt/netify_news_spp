import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase implements Usecase<UserEntity, LoginParams> {
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);
  @override
  Future<Either<Failures, UserEntity>> call(LoginParams params) async {
    return await authRepository.loginUser(
        email: params.email, password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.password,
    required this.email,
  });
}
