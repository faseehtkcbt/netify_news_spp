import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/profile/domain/repository/profile_repository.dart';

class GetCountryUsecase {
  final ProfileRepository repository;

  GetCountryUsecase(this.repository);
  String? call(NoParam param) {
    return repository.getCountry();
  }
}
