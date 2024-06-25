import 'dart:convert';

import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/internet/connection_checker.dart';
import 'package:http/http.dart' as http;
import '../model/country_model.dart';

abstract interface class ProfileDatasource {
  Future<List<CountryModel>> getCountries();
}

class ProfileDatasourceImpl implements ProfileDatasource {
  final ConnectionChecker internet;

  ProfileDatasourceImpl(this.internet);
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
        List<CountryModel> countryList = [];
        List result = jsonDecode(response.body);
        result
            .map((e) => countryList.add(CountryModel(
                countryCode: e["cca2"],
                flagUrl: e["flags"]["png"],
                countryName: e["name"]["common"])))
            .toList();
        return countryList;
      } else {
        throw ServerExceptions(jsonDecode(response.body)['message']);
      }
    } on ServerExceptions catch (e) {
      throw ServerExceptions(e.exception);
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
