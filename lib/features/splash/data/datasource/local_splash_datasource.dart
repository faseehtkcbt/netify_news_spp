import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalSplashDatasource {
  bool checkLoggedIn();
}

class LocalSplashDatasourceImpl implements LocalSplashDatasource {
  final SharedPreferences pref;

  LocalSplashDatasourceImpl(this.pref);
  @override
  bool checkLoggedIn() {
    final data = pref.getString('uid');
    if (data == null) {
      return false;
    } else {
      return true;
    }
  }
}
