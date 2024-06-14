import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/entity/news_entity.dart';

import '../../domain/useCase/check_bookmark_useCase.dart';
import '../../domain/usecase/insert_bookmark_usecase.dart';
import '../../domain/usecase/remove_bookmark_usecase.dart';

part 'bookmark_check_state.dart';

class BookmarkCheckCubit extends Cubit<BookmarkCheckState> {
  final CheckBookmarkUsecase _checkUseCase;
  final InsertBookmarkUsecase _insertUsecase;
  final RemoveBookmarkUsecase _removeUsecase;
  BookmarkCheckCubit(CheckBookmarkUsecase checkUseCase,
      InsertBookmarkUsecase insertUsecase, RemoveBookmarkUsecase removeUsecase)
      : _checkUseCase = checkUseCase,
        _insertUsecase = insertUsecase,
        _removeUsecase = removeUsecase,
        super(BookmarkCheckInitial());

  void checkBookmark(NewsEntity news) async {
    emit(BookmarkCheckLoading());
    final res = await _checkUseCase(CheckBookmarkParam(news));
    res.fold((l) => emit(BookmarkCheckFailure()),
        (r) => emit(BookmarkCheckLoaded(r)));
  }

  void insertBookmark(NewsEntity news) async {
    emit(BookmarkCheckLoading());
    await _insertUsecase(InsertBookmarkParams(news));
    checkBookmark(news);
  }

  void removeBookmark(NewsEntity news) async {
    emit(BookmarkCheckLoading());
    await _removeUsecase(RemoveBookMarkParams(news));
    checkBookmark(news);
  }
}
