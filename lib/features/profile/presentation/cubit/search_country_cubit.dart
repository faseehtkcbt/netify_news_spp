import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/country_entity.dart';

part 'search_country_state.dart';

class SearchCountryCubit extends Cubit<SearchCountryState> {
  SearchCountryCubit() : super(SearchCountryInitial());

  void searchCountries(List<CountryEntity> list, String value) {
    emit(SearchCountryLoading());
    List<CountryEntity> result = [];
    for (var i in list) {
      if (i.countryName!.toLowerCase().contains(value.toLowerCase())) {
        result.add(i);
      }
    }
    emit(SearchCountryLoaded(data: result));
  }
}
