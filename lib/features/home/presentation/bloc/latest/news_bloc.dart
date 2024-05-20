import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/failure/Failures.dart';
import '../../../../../core/entity/news_entity.dart';
import '../../../domain/usecase/grtLatest.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetLatestNews _getLatestNews;
  NewsBloc(GetLatestNews getLatestNews)
      : _getLatestNews = getLatestNews,
        super(NewsInitial()) {
    on<NewsEvent>((event, emit) => emit(NewsLoading()));
    on<GetLatest>(_onGetLatest);
  }

  void _onGetLatest(GetLatest event, Emitter<NewsState> emit) async {
    final result = await _getLatestNews(GetLatestParams(event.catogory));
    result.fold((l) => emit(NewsFailure(l)), (r) => emit(NewsLoaded(r)));
  }
}
