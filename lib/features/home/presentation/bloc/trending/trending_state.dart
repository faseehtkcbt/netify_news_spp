part of 'trending_bloc.dart';

@immutable
abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<NewsEntity> news;
  TrendingLoaded(this.news);
}

class TrendingFailure extends TrendingState {
  final Failures failure;
  TrendingFailure(this.failure);
}
