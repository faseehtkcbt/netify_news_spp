import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/domain/repository/news_repository.dart';

class GetLatestNews implements Usecase<List<NewsEntity>, GetLatestParams> {
  final NewsRepository repository;
  GetLatestNews(this.repository);
  @override
  Future<Either<Failures, List<NewsEntity>>> call(
      GetLatestParams params) async {
    // TODO: implement call
    return await repository.getLatestNews(category: params.category);
  }
}

class GetLatestParams {
  final String category;
  GetLatestParams(this.category);
}
