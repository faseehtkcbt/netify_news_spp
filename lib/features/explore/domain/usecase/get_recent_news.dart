import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/explore/domain/repository/explore_repository.dart';

class GetRecentNewses implements Usecase<List<NewsEntity>, RecentNewsParams> {
  final ExploreRepository repository;
  GetRecentNewses(this.repository);
  @override
  Future<Either<Failures, List<NewsEntity>>> call(
      RecentNewsParams params) async {
    return await repository.getRecentNews(source: params.source);
  }
}

class RecentNewsParams {
  final String source;
  RecentNewsParams(this.source);
}
