part of 'bookmark_check_cubit.dart';

abstract class BookmarkCheckState {}

class BookmarkCheckInitial extends BookmarkCheckState {}

class BookmarkCheckLoading extends BookmarkCheckState {}

class BookmarkCheckLoaded extends BookmarkCheckState {
  final bool check;
  BookmarkCheckLoaded(this.check);
}

class BookmarkCheckFailure extends BookmarkCheckState {}
