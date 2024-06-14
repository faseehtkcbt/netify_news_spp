import 'package:news_app/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalAuthDatasource {
  void storeLocalData(UserModel user);
  UserModel getLocalData();
}

class LocalAuthDatasourceImpl implements LocalAuthDatasource {
  final SharedPreferences pref;

  LocalAuthDatasourceImpl(this.pref);
  @override
  UserModel getLocalData() {
    return UserModel(
        photoUrl: pref.getString('photoUrl') ?? "",
        email: pref.getString('email') ?? "",
        id: pref.getString('uid') ?? "",
        name: pref.getString('username') ?? "");
  }

  @override
  void storeLocalData(UserModel user) {
    pref.setString('email', user.email);
    pref.setString('username', user.name);
    pref.setString('uid', user.id);
    pref.setString('photoUrl', user.photoUrl);
  }
}
