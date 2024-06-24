part of 'search_country_cubit.dart';

@immutable
abstract class SearchCountryState {}

class SearchCountryInitial extends SearchCountryState {}

class SearchCountryLoading extends SearchCountryState {}

class SearchCountryLoaded extends SearchCountryState {
  final List<CountryEntity> data;
  SearchCountryLoaded({required this.data});
}
