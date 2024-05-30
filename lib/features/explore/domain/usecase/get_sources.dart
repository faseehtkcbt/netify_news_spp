import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/explore/domain/entity/source_detail_entity.dart';
import 'package:news_app/features/explore/domain/repository/explore_repository.dart';

class GetSourcesDetails implements Usecase<List<SourceDetailEntity>, NoParam> {
  final ExploreRepository repository;
  GetSourcesDetails(this.repository);
  @override
  Future<Either<Failures, List<SourceDetailEntity>>> call(
      NoParam params) async {
    return await repository.getSources();
  }
}
