import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/Failures.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failures, SuccessType>> call(Params params);
}

class NoParam {}
