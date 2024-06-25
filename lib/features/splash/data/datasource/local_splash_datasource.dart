import 'package:news_app/core/exception/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract interface class LocalSplashDatasource {
  bool checkLoggedIn();
  Future<void> deleteAllData();
}

class LocalSplashDatasourceImpl implements LocalSplashDatasource {
  final SharedPreferences pref;
  final Database db;
  LocalSplashDatasourceImpl(this.pref, this.db);

  @override
  bool checkLoggedIn() {
    final data = pref.getString('uid');
    if (data == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> deleteAllData() async {
    try {
      final List<Map<String, dynamic>> tables = await db
          .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
      for (final table in tables) {
        final tableName = table['name'];
        await db.delete(tableName);
      }
      await pref.clear();
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
