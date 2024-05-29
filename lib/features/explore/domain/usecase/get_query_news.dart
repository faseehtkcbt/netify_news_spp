import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/explore/domain/repository/explore_repository.dart';

class GetQueryNews implements Usecase<List<NewsEntity>, GetNewsQueryParams> {
  final ExploreRepository repository;
  GetQueryNews(this.repository);
  @override
  Future<Either<Failures, List<NewsEntity>>> call(
      GetNewsQueryParams params) async {
    return await repository.getQueryNews(query: params.query);
  }
}

class GetNewsQueryParams {
  final String query;
  GetNewsQueryParams(this.query);
}
