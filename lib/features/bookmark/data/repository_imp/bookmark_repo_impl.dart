import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/features/bookmark/data/datasource/local_bookmark_data_source.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/home/data/model/news_model.dart';

class BookmarkRepoImpl implements BookmarkRepository {
  final LocalBookmarkDataSource localDataSource;

  BookmarkRepoImpl(this.localDataSource);
  @override
  Future<Either<Failures, bool>> checkNews(NewsEntity news) async {
    try {
      final result = await localDataSource.checkNews(news as NewsModel);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }

  @override
  Future<Either<Failures, List<NewsEntity>>> getNews() async {
    try {
      final result = await localDataSource.getNews();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }

  @override
  Future<Either<Failures, void>> insertNews(NewsEntity news) async {
    try {
      final result = await localDataSource.insertNews(news as NewsModel);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }

  @override
  Future<Either<Failures, void>> removeNews(NewsEntity news) async {
    try {
      final result = await localDataSource.removeNews(news as NewsModel);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }
}
