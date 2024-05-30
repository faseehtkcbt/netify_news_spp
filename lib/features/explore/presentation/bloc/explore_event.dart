part of 'explore_bloc.dart';

abstract class ExploreEvent {}

class QueryNews extends ExploreEvent {
  final String query;
  QueryNews(this.query);
}

class RecentNews extends ExploreEvent {
  final String source;
  RecentNews(this.source);
}
