import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/auth/domain/entity/user_entity.dart';
import 'package:news_app/features/profile/domain/repository/profile_repository.dart';

class GetProfileDataUsecase {
  final ProfileRepository repository;

  GetProfileDataUsecase(this.repository);
  UserEntity call(NoParam param) {
    return repository.getUserData();
  }
}
