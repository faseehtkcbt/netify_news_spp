import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/profile/domain/entity/country_entity.dart';

import '../../domain/usecase/get_country_list_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCountryListUsecase _getCountry;
  ProfileBloc({required GetCountryListUsecase getCountry})
      : _getCountry = getCountry,
        super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      emit(ProfileLoading());
    });
    on<Getcountries>(_onGetCountries);
  }
  void _onGetCountries(Getcountries event, Emitter<ProfileState> emit) async {
    final response = await _getCountry(NoParam());
    response.fold((l) => emit(ProfileError(l)),
        (r) => emit(ProfileLoaded<List<CountryEntity>>(r)));
  }
}
