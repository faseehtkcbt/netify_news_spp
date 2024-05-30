part of 'news_bloc.dart';

abstract class NewsEvent {}

class GetLatest extends NewsEvent {
  final String catogory;

  GetLatest(this.catogory);
}
