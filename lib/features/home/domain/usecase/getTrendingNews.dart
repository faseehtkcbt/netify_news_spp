import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/domain/repository/news_repository.dart';

class GetTrendingNews implements Usecase<List<NewsEntity>, NoParam> {
  final NewsRepository newsRepository;

  GetTrendingNews(this.newsRepository);
  @override
  Future<Either<Failures, List<NewsEntity>>> call(NoParam params) async {
    // TODO: implement call
    return await newsRepository.getTrendingNews();
  }
}
