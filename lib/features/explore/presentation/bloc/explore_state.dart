part of 'explore_bloc.dart';

abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<NewsEntity> data;
  ExploreLoaded(this.data);
}

class ExploreFailure extends ExploreState {
  final Failures failures;
  ExploreFailure(this.failures);
}
