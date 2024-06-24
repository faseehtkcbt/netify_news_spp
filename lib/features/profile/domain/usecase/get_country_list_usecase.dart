import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/profile/domain/entity/country_entity.dart';
import 'package:news_app/features/profile/domain/repository/profile_repository.dart';

class GetCountryListUsecase implements Usecase<List<CountryEntity>,NoParam>{
  final ProfileRepository repository;

  GetCountryListUsecase(this.repository);
  @override
  Future<Either<Failures, List<CountryEntity>>> call(NoParam params) async {
    return await repository.getCountryList();
  }
}