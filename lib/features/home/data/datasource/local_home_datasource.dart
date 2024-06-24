import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalHomeDatasource {
  String? getCountry();
}

class LocalHomeDatasourceImpl implements LocalHomeDatasource {
  final SharedPreferences pref;
  LocalHomeDatasourceImpl(this.pref);

  @override
  String? getCountry() {
    return pref.getString('countryCode');
  }
}
