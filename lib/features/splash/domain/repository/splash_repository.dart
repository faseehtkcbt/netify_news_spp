import 'package:dartz/dartz.dart';

import '../../../../core/failure/failures.dart';

abstract interface class SplashRepository {
  bool checkLoggedIn();
  Future<Either<Failures, void>> deleteAllData();
}
