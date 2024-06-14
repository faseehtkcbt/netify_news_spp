import 'package:news_app/core/exception/exceptions.dart';
import 'package:news_app/features/home/data/model/news_model.dart';
import 'package:news_app/features/home/data/model/source_model.dart';
import 'package:sqflite/sqflite.dart';

abstract interface class LocalBookmarkDataSource {
  Future<void> insertNews(NewsModel news);
  Future<List<NewsModel>> getNews();
  Future<bool> checkNews(NewsModel news);
  Future<void> removeNews(NewsModel news);
}

class LocalBookmarkDataSourceImpl implements LocalBookmarkDataSource {
  final Database db;

  LocalBookmarkDataSourceImpl(this.db);

  @override
  Future<void> insertNews(NewsModel news) async {
    try {
      await db.insert(
        'news',
        {
          'sourceId': news.source.id ?? "",
          'sourceName': news.source.name ?? "",
          'author': news.author ?? "",
          'title': news.title ?? "",
          'description': news.description ?? "",
          'url': news.url ?? "",
          'urlToImage': news.urlToImage ?? "",
          'publishedAt': news.publishedAt ?? "",
          'content': news.content ?? "",
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<List<NewsModel>> getNews() async {
    try {
      final List<Map<String, dynamic>> maps = await db.query('news');
      List<NewsModel> newsList = [];
      maps.map((map) async {
        final source =
            SourceModel(name: map['sourceName'], id: map['sourceId']);
        newsList.add(NewsModel(
            source: source,
            author: map['author'],
            title: map['title'],
            description: map['description'],
            url: map['url'],
            urlToImage: map['urlToImage'],
            publishedAt: map['publishedAt'],
            content: map['content']));
      }).toList();
      return newsList;
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<void> removeNews(NewsModel news) async {
    try {
      await db.delete(
        'news',
        where: 'title = ?',
        whereArgs: [news.title],
      );
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<bool> checkNews(NewsModel news) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'news',
      where: 'title = ?',
      whereArgs: [news.title],
      limit: 1,
    );
    return maps.isNotEmpty;
  }
}
