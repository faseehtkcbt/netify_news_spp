import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/features/home/data/model/source_model.dart';

class NewsModel extends NewsEntity {
  NewsModel(
      {required super.source,
      required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        source: SourceModel.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);
  }
}
