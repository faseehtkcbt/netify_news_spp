import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entity/news_entity.dart';
import '../../../../../core/failure/Failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecase/getTrendingNews.dart';

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
