import 'dart:convert';

import 'package:news_app/core/credentials/credentials.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/internet/connection_checker.dart';
import 'package:news_app/features/explore/data/model/source_detail_model.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/data/model/news_model.dart';

abstract interface class ExploreDatasource {
  Future<List<NewsModel>> getQueryNews({required String query});
  Future<List<SourceDetailModel>> getSource({required String country});
  Future<List<NewsModel>> getRecentNews({required String source});
}

class ExploreDataSourceImpl implements ExploreDatasource {
  final ConnectionChecker connectionChecker;
  ExploreDataSourceImpl(this.connectionChecker);

  @override
  Future<List<NewsModel>> getQueryNews({required String query}) async {
    try {
      if (!(await connectionChecker.isInternetConnected)) {
        throw ServerExceptions(
            'Internet Disconnected!! Please connect the internet.');
      }
      final response = await http.get(Uri.parse(
          '${Constants.everything}?q=$query&apiKey=${Credentials.apiKey}'));
      print(response.reasonPhrase);
      if (response.statusCode == 200) {
        List<NewsModel> news = [];
        List data = jsonDecode(response.body)['articles'];
        data.map((e) => news.add(NewsModel.fromJson(e))).toList();
        return news;
      } else {
        throw ServerExceptions(jsonDecode(response.body)['message']);
      }
    } on ServerExceptions catch (e) {
      throw ServerExceptions(e.exception);
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<List<SourceDetailModel>> getSource({required String country}) async {
    try {
      if (!(await connectionChecker.isInternetConnected)) {
        throw ServerExceptions(
            'Internet Disconnected!! Please connect the internet.');
      }
      final response = await http.get(Uri.parse(
          '${Constants.sources}?country=$country&apiKey=${Credentials.apiKey}'));
      if (response.statusCode == 200) {
        final List<SourceDetailModel> sources = [];
        List result = jsonDecode(response.body)['sources'];
        result.map((e) => sources.add(SourceDetailModel.fromJson(e))).toList();
        return sources;
      } else {
        throw ServerExceptions(jsonDecode(response.body)['message']);
      }
    } on ServerExceptions catch (e) {
      throw ServerExceptions(e.exception);
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<List<NewsModel>> getRecentNews({required String source}) async {
    try {
      if (!(await connectionChecker.isInternetConnected)) {
        throw ServerExceptions(
            'Internet Disconnected!! Please connect the internet.');
      }
      final response = await http.get(Uri.parse(
          '${Constants.topHeadLines}?sources=$source&apiKey=${Credentials.apiKey}'));
      if (response.statusCode == 200) {
        List<NewsModel> news = [];
        List result = jsonDecode(response.body)['articles'];
        result.map((e) => news.add(NewsModel.fromJson(e))).toList();
        return news;
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
