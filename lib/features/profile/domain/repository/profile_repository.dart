import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/features/auth/domain/entity/user_entity.dart';
import 'package:news_app/features/profile/domain/entity/country_entity.dart';

abstract interface class ProfileRepository {
  Future<Either<Failures, List<CountryEntity>>> getCountryList();
  UserEntity getUserData();
  void storeCountry(String countryCode);
  String? getCountry();
}
