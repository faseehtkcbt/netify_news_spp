import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/splash/domain/repository/splash_repository.dart';

class DeleteDataUsecase implements Usecase<void, NoParam> {
  final SplashRepository repo;

  DeleteDataUsecase(this.repo);
  @override
  Future<Either<Failures, void>> call(NoParam params) async {
    return await repo.deleteAllData();
  }
}
