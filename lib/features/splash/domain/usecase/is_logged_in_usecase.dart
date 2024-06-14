import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/splash/domain/repository/splash_repository.dart';

class IsLoggedInUsecase {
  final SplashRepository local;
  IsLoggedInUsecase(this.local);
  bool call(NoParam params) {
    return local.checkLoggedIn();
  }
}
