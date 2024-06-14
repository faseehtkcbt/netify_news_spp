import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';

class InsertBookmarkUsecase implements Usecase<void, InsertBookmarkParams> {
  final BookmarkRepository repository;
  InsertBookmarkUsecase(this.repository);
  @override
  Future<Either<Failures, void>> call(InsertBookmarkParams params) async {
    return await repository.insertNews(params.news);
  }
}

class InsertBookmarkParams {
  final NewsEntity news;
  InsertBookmarkParams(this.news);
}
