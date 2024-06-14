import 'package:news_app/features/splash/data/datasource/local_splash_datasource.dart';
import 'package:news_app/features/splash/domain/repository/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final LocalSplashDatasource local;

  SplashRepositoryImpl(this.local);
  @override
  bool checkLoggedIn() {
    return local.checkLoggedIn();
  }
}
