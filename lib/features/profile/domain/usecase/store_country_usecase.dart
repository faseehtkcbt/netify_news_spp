import 'package:news_app/features/profile/domain/repository/profile_repository.dart';

class StoreCountryUsecase {
  final ProfileRepository repository;

  StoreCountryUsecase(this.repository);
  void call(StoreCountryParam param) {
    return repository.storeCountry(param.countryCode);
  }
}

class StoreCountryParam {
  final String countryCode;

  StoreCountryParam(this.countryCode);
}
