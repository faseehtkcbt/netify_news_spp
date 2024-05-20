part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetLatest extends NewsEvent {
  final String catogory;

  GetLatest(this.catogory);
}
