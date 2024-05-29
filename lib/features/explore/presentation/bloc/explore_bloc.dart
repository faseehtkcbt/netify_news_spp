import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/explore/domain/usecase/get_query_news.dart';

import '../../domain/usecase/get_sources.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetQueryNews _getQueryNews;
  final GetSourcesDetails _getSourcesDetails;
  ExploreBloc(
      {required GetQueryNews getQueryNews,
      required GetSourcesDetails getSourcesDetails})
      : _getQueryNews = getQueryNews,
        _getSourcesDetails = getSourcesDetails,
        super(ExploreInitial()) {
    on<ExploreEvent>((event, emit) {
      emit(ExploreLoading());
    });
    on<QueryNews>(_onQueryNews);
    on<GetSources>(_onGetSources);
  }

  void _onGetSources(GetSources event, Emitter<ExploreState> emit) async {
    final result = await _getSourcesDetails(NoParam());
    result.fold((l) => emit(ExploreFailure(l)), (r) => emit(ExploreLoaded(r)));
  }

  void _onQueryNews(QueryNews event, Emitter<ExploreState> emit) async {
    final result = await _getQueryNews(GetNewsQueryParams(event.query));
    result.fold((l) => emit(ExploreFailure(l)), (r) => emit(ExploreLoaded(r)));
  }
}
