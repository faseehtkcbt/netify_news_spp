import 'dart:convert';

import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/credentials/credentials.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/internet/connection_checker.dart';
import '../model/news_model.dart';

abstract interface class HomeDataSource {
  Future<List<NewsModel>> getTrendings();
  Future<List<NewsModel>> getLatest({required String category});
}

class HomeDataSourceImpl implements HomeDataSource {
  final ConnectionChecker connectionChecker;

  HomeDataSourceImpl(this.connectionChecker);
  @override
  Future<List<NewsModel>> getLatest({required String category}) async {
    try {
      if (!await (connectionChecker.isInternetConnected)) {
        throw ServerExceptions(
            'Internet Disconnected!! Please connect the internet.');
      }
      final response = await http.get(Uri.parse(
          "${Constants.topHeadLines}?country=in&category=$category&apiKey=${Credentials.apiKey}"));
      if (response.statusCode == 200) {
        List<NewsModel> data = [];
        List result = jsonDecode(response.body)['articles'];
        result.map((item) => data.add(NewsModel.fromJson(item))).toList();
        return data;
      } else {
        throw ServerExceptions(response.reasonPhrase ?? "");
      }
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<List<NewsModel>> getTrendings() async {
    try {
      if (!await (connectionChecker.isInternetConnected)) {
        throw ServerExceptions(
            'Internet Disconnected!! Please connect the internet.');
      }
      final response = await http.get(
        Uri.parse(
            "${Constants.everything}?q=a&sortBy=popularity&apiKey=${Credentials.apiKey}"),
      );
      if (response.statusCode == 200) {
        List<NewsModel> data = [];
        List result = jsonDecode(response.body)["articles"];
        result.map((item) => data.add(NewsModel.fromJson(item))).toList();
        return data;
      } else {
        throw ServerExceptions(response.reasonPhrase ?? "");
      }
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
