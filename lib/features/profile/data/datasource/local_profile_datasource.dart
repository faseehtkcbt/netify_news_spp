import 'package:news_app/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalProfileDatasource {
  void storeCountry(String countryCode);
  String? getCountry();
  UserModel getUserData();
}

class LocalProfileDataSourceImpl implements LocalProfileDatasource {
  final SharedPreferences pref;
  LocalProfileDataSourceImpl({required this.pref});

  @override
  void storeCountry(String countryCode) {
    pref.setString('countryCode', countryCode);
  }

  @override
  String? getCountry() {
    // TODO: implement getCountry
    return pref.getString('countryCode');
  }

  @override
  UserModel getUserData() {
    return UserModel(
        photoUrl: pref.getString('photoUrl') ?? "",
        email: pref.getString('email') ?? "",
        id: pref.getString('uid') ?? "",
        name: pref.getString('username') ?? "");
  }
}
