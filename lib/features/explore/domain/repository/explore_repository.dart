import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/features/explore/domain/entity/source_detail_entity.dart';

abstract interface class ExploreRepository {
  Future<Either<Failures, List<NewsEntity>>> getQueryNews(
      {required String query});
  Future<Either<Failures, List<SourceDetailEntity>>> getSources();
  Future<Either<Failures, List<NewsEntity>>> getRecentNews(
      {required String source});
}
