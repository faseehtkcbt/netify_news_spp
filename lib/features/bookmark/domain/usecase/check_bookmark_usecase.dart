import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../../../../core/entity/news_entity.dart';
import '../repository/bookmark_repository.dart';

class CheckBookmarkUsecase implements Usecase<bool, CheckBookmarkParam> {
  final BookmarkRepository repository;
  CheckBookmarkUsecase(this.repository);
  @override
  Future<Either<Failures, bool>> call(CheckBookmarkParam params) async {
    // TODO: implement call
    return await repository.checkNews(params.news);
  }
}

class CheckBookmarkParam {
  final NewsEntity news;
  CheckBookmarkParam(this.news);
}
