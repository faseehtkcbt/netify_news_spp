part of 'bookmark_bloc.dart';

abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<NewsEntity> news;
  BookmarkLoaded(this.news);
}

class BookmarkError extends BookmarkState {
  final Failures failures;
  BookmarkError(this.failures);
}
