import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entity/news_entity.dart';
import '../../../../../core/failure/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecase/get_trending_news.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrendingNews _getTrendingNews;
  TrendingBloc(GetTrendingNews getTrendingNews)
      : _getTrendingNews = getTrendingNews,
        super(TrendingInitial()) {
    on<TrendingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetTrendings>(_onGetTrendings);
  }
  void _onGetTrendings(GetTrendings event, Emitter<TrendingState> emit) async {
    final result = await _getTrendingNews(NoParam());
    result.fold(
        (l) => emit(TrendingFailure(l)), (r) => emit(TrendingLoaded(r)));
  }
}
