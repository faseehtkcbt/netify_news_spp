import 'package:dartz/dartz.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/features/splash/data/datasource/local_splash_datasource.dart';
import 'package:news_app/features/splash/domain/repository/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final LocalSplashDatasource local;

  SplashRepositoryImpl(this.local);
  @override
  bool checkLoggedIn() {
    return local.checkLoggedIn();
  }

  @override
  Future<Either<Failures, void>> deleteAllData() async {
    try {
      final response = await local.deleteAllData();
      return Right(response);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }
}
