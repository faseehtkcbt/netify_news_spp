import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase implements Usecase<String, RegisterParams> {
  AuthRepository authRepository;
  RegisterUseCase(this.authRepository);
  @override
  Future<Either<Failures, String>> call(RegisterParams params) async {
    return await authRepository.registerUser(
        name: params.name, email: params.email, password: params.password);
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  RegisterParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
