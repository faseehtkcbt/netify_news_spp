import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../repository/bookmark_repository.dart';

class GetBookmarkUsecase implements Usecase<List<NewsEntity>, NoParam> {
  final BookmarkRepository repository;
  GetBookmarkUsecase(this.repository);
  @override
  Future<Either<Failures, List<NewsEntity>>> call(NoParam params) async {
    return await repository.getNews();
  }
}
