import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/auth/domain/entity/user_entity.dart';
import 'package:news_app/features/profile/domain/entity/country_entity.dart';

import '../../domain/usecase/get_country_list_usecase.dart';
import '../../domain/usecase/get_profile_data.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCountryListUsecase _getCountryList;
  final GetProfileDataUsecase _getData;
  ProfileBloc(
      {required GetCountryListUsecase getCountryList,
      required GetProfileDataUsecase getData})
      : _getCountryList = getCountryList,
        _getData = getData,
        super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      emit(ProfileLoading());
    });
    on<Getcountries>(_onGetCountries);
    on<GetProfileData>(_onGetProfileData);
  }
  void _onGetCountries(Getcountries event, Emitter<ProfileState> emit) async {
    final response = await _getCountryList(NoParam());
    response.fold((l) => emit(ProfileError(l)),
        (r) => emit(ProfileLoaded<List<CountryEntity>>(r)));
  }

  void _onGetProfileData(GetProfileData event, Emitter<ProfileState> emit) {
    final response = _getData(NoParam());
    emit(ProfileLoaded<UserEntity>(response));
  }
}
