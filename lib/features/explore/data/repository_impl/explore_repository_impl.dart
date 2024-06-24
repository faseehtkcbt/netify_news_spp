import 'package:dartz/dartz.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/features/explore/data/datasource/explore_datasource.dart';
import 'package:news_app/features/explore/data/model/source_detail_model.dart';
import 'package:news_app/features/explore/domain/repository/explore_repository.dart';
import 'package:news_app/features/home/data/model/news_model.dart';

import '../datasource/local_explore_datasource.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreDatasource datasource;
  final LocalExploreDatasource local;
  ExploreRepositoryImpl(this.datasource, this.local);

  @override
  Future<Either<Failures, List<NewsEntity>>> getQueryNews(
      {required String query}) async {
    return _getMethod(() async => await datasource.getQueryNews(query: query));
  }

  @override
  Future<Either<Failures, List<SourceDetailModel>>> getSources() async {
    try {
      String? country = local.getCountry();
      final response = await datasource.getSource(
          country: country ?? Constants.defaultCountry);
      return Right(response);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }

  @override
  Future<Either<Failures, List<NewsEntity>>> getRecentNews(
      {required String source}) {
    return _getMethod(
        () async => await datasource.getRecentNews(source: source));
  }

  Future<Either<Failures, List<NewsModel>>> _getMethod(
      Future<List<NewsModel>> Function() fn) async {
    try {
      final result = await fn();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(Failures(message: e.exception));
    }
  }
}
