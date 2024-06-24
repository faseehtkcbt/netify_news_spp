import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalExploreDatasource {
  String? getCountry();
}

class LocalExploreDatasourceImpl implements LocalExploreDatasource {
  final SharedPreferences pref;
  LocalExploreDatasourceImpl(this.pref);

  @override
  String? getCountry() {
    return pref.getString('countryCode');
  }
}
