import 'package:dartz/dartz.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:news_app/features/home/data/model/news_model.dart';
import 'package:news_app/features/home/domain/repository/news_repository.dart';

import '../datasource/datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final HomeDataSource homeDataSource;

  NewsRepositoryImpl(this.homeDataSource);

  @override
  Future<Either<Failures, List<NewsModel>>> getLatestNews(
      {required String category}) async {
    return _getNews(
        () async => await homeDataSource.getLatest(category: category));
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
