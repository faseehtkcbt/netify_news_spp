import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/failure/Failures.dart';
import 'package:news_app/features/explore/domain/usecase/get_query_news.dart';

import '../../domain/usecase/get_recent_news.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetQueryNews _getQueryNews;
  final GetRecentNewses _getRecentNewses;
  ExploreBloc(
      {required GetQueryNews getQueryNews,
      required GetRecentNewses getRecentNewses})
      : _getQueryNews = getQueryNews,
        _getRecentNewses = getRecentNewses,
        super(ExploreInitial()) {
    on<ExploreEvent>((event, emit) {
      emit(ExploreLoading());
    });
    on<QueryNews>(_onQueryNews);
    on<RecentNews>(_onRecentNews);
  }
  void _onQueryNews(QueryNews event, Emitter<ExploreState> emit) async {
    final result = await _getQueryNews(GetNewsQueryParams(event.query));
    result.fold((l) => emit(ExploreFailure(l)), (r) => emit(ExploreLoaded(r)));
  }

  void _onRecentNews(RecentNews event, Emitter<ExploreState> emit) async {
    final result = await _getRecentNewses(RecentNewsParams(event.source));
    result.fold((l) => emit(ExploreFailure(l)), (r) => emit(ExploreLoaded(r)));
  }
}
