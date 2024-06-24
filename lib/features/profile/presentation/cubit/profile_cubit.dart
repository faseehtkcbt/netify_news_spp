import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../../domain/usecase/get_country_usecase.dart';
import '../../domain/usecase/store_country_usecase.dart';

part 'profile_state.dart';

class ProfileLocalCubit extends Cubit<ProfileLocalState> {
  final StoreCountryUsecase _store;
  final GetCountryUsecase _getCountry;
  ProfileLocalCubit(
      {required StoreCountryUsecase store,
      required GetCountryUsecase getCountry})
      : _store = store,
        _getCountry = getCountry,
        super(ProfileInitial());

  void storeCountry(String countryCode) {
    _store(StoreCountryParam(countryCode));
  }

  String? getCountry() {
    return _getCountry(NoParam());
  }
}
