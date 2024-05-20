import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/Failures.dart';

abstract interface class NewsRepository {
  Future<Either<Failures, List<NewsEntity>>> getTrendingNews();
  Future<Either<Failures, List<NewsEntity>>> getLatestNews(
      {required String category});
}
