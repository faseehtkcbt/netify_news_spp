import 'package:dartz/dartz.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/features/home/data/model/news_model.dart';
import 'package:news_app/features/home/domain/repository/news_repository.dart';

import '../datasource/datasource.dart';
import '../datasource/local_home_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final HomeDataSource homeDataSource;
  final LocalHomeDatasource local;
  NewsRepositoryImpl(this.homeDataSource, this.local);

  @override
  Future<Either<Failures, List<NewsModel>>> getLatestNews(
      {required String category}) async {
    try {
      String? country = local.getCountry();
      final userId = await homeDataSource.getLatest(
          category: category, country: country ?? Constants.defaultCountry);
      return right(userId);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception.toString()));
    }
  }

  @override
  Future<Either<Failures, List<NewsModel>>> getTrendingNews() async {
    return _getNews(() async => await homeDataSource.getTrendings());
  }
}

Future<Either<Failures, List<NewsModel>>> _getNews(
    Future<List<NewsModel>> Function() fn) async {
  try {
    final userId = await fn();
    return right(userId);
  } on ServerExceptions catch (e) {
    return Left(Failures(message: e.exception.toString()));
  }
}
