import 'package:dartz/dartz.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:news_app/features/explore/data/datasource/explore_datasource.dart';
import 'package:news_app/features/explore/data/model/source_detail_model.dart';
import 'package:news_app/features/explore/domain/repository/explore_repository.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreDatasource datasource;

  ExploreRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, List<NewsEntity>>> getQueryNews(
      {required String query}) async {
    try {
      final result = await datasource.getQueryNews(query: query);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }

  @override
  Future<Either<Failures, List<SourceDetailModel>>> getSources() async {
    try {
      final response = await datasource.getSource();
      return Right(response);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }
}
