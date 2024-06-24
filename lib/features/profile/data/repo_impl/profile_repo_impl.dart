import 'package:dartz/dartz.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/features/auth/data/model/user_model.dart';
import 'package:news_app/features/auth/domain/entity/user_entity.dart';
import 'package:news_app/features/profile/data/datasource/profile_datasource.dart';
import 'package:news_app/features/profile/domain/entity/country_entity.dart';
import 'package:news_app/features/profile/domain/repository/profile_repository.dart';

import '../datasource/local_profile_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;
  final LocalProfileDatasource local;
  ProfileRepositoryImpl(this.datasource, this.local);

  @override
  Future<Either<Failures, List<CountryEntity>>> getCountryList() async {
    try {
      final response = await datasource.getCountries();
      return Right(response);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }

  @override
  String? getCountry() {
    return local.getCountry();
  }

  @override
  void storeCountry(String countryCode) {
    local.storeCountry(countryCode);
  }

  @override
  UserModel getUserData() {
    return local.getUserData();
  }
}
