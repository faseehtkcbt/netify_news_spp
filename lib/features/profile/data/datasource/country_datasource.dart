import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/internet/connection_checker.dart';
import 'package:http/http.dart' as http;
import '../model/country_model.dart';

abstract interface class CountryDatasource {
  Future<List<CountryModel>> getCountries();
}

class CountryDatasourceImpl implements CountryDatasource {
  final ConnectionChecker internet;

  CountryDatasourceImpl(this.internet);
  @override
  Future<List<CountryModel>> getCountries() async {
    try {
      if (!(await internet.isInternetConnected)) {
        throw ServerExceptions(
            'Internet Disconnected!! Please connect the internet.');
      }
      final response = await http.get(Uri.parse(
          '${Constants.countryUrl}?codes=${Constants.countryCodeList.join(",")}'));
      if (response.statusCode == 200) {
      } else {
        throw ServerExceptions(response.reasonPhrase ?? '');
      }
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
