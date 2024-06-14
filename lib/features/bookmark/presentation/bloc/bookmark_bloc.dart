import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../../../../core/entity/news_entity.dart';
import '../../domain/usecase/get_bookmark_usecase.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetBookmarkUsecase _useCase;

  BookmarkBloc(GetBookmarkUsecase useCase)
      : _useCase = useCase,
        super(BookmarkInitial()) {
    on<BookmarkEvent>((event, emit) {
      emit(BookmarkLoading());
    });
    on<GetBookmarkNews>((event, emit) async {
      final result = await _useCase(NoParam());
      result.fold(
          (l) => emit(BookmarkError(l)), (r) => emit(BookmarkLoaded(r)));
    });
  }
}
