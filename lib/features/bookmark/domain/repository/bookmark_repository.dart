import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/failures.dart';

abstract interface class BookmarkRepository {
  Future<Either<Failures, void>> insertNews(NewsEntity news);
  Future<Either<Failures, List<NewsEntity>>> getNews();
  Future<Either<Failures, bool>> checkNews(NewsEntity news);
  Future<Either<Failures, void>> removeNews(NewsEntity news);
}
