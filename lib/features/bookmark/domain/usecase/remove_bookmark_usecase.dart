import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';

class RemoveBookmarkUsecase implements Usecase<void, RemoveBookMarkParams> {
  final BookmarkRepository repository;
  RemoveBookmarkUsecase(this.repository);

  @override
  Future<Either<Failures, void>> call(RemoveBookMarkParams params) async {
    return await repository.removeNews(params.news);
  }
}

class RemoveBookMarkParams {
  final NewsEntity news;
  RemoveBookMarkParams(this.news);
}
