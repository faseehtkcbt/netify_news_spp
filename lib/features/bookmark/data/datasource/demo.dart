// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'news_entity.dart'; // Adjust this import according to your project structure
// import 'source_model.dart'; // Adjust this import according to your project structure
//
// class DatabaseHelper {
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'news_database.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE sources (
//         id TEXT PRIMARY KEY,
//         name TEXT
//       )
//     ''');
//
//     await db.execute('''
//       CREATE TABLE news (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         sourceId TEXT,
//         author TEXT,
//         title TEXT,
//         description TEXT,
//         url TEXT,
//         urlToImage TEXT,
//         publishedAt TEXT,
//         content TEXT,
//         FOREIGN KEY (sourceId) REFERENCES sources (id)
//       )
//     ''');
//   }
//
//   Future<int> insertSource(SourceEntity source) async {
//     final db = await database;
//     return await db.insert('sources', source.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   Future<int> insertNews(NewsEntity news) async {
//     final db = await database;
//     await insertSource(news.source);
//     return await db.insert('news', news.toMap());
//   }
//
//   Future<List<NewsEntity>> getNews() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('news');
//
//     List<NewsEntity> newsList = [];
//     for (var map in maps) {
//       final sourceMap = await db.query(
//         'sources',
//         where: 'id = ?',
//         whereArgs: [map['sourceId']],
//       );
//
//       if (sourceMap.isNotEmpty) {
//         final source = SourceEntity.fromMap(sourceMap.first);
//         map['source'] = source.toMap();
//         newsList.add(NewsEntity.fromMap(map));
//       }
//     }
//     return newsList;
//   }
//
//   // Future<int> updateNews(NewsEntity news) async {
//   //   final db = await database;
//   //   await updateSource(news.source);
//   //   return await db.update(
//   //     'news',
//   //     news.toMap(),
//   //     where: 'id = ?',
//   //     whereArgs: [news.id],
//   //   );
//   // }
//   //
//   // Future<int> updateSource(SourceEntity source) async {
//   //   final db = await database;
//   //   return await db.update(
//   //     'sources',
//   //     source.toMap(),
//   //     where: 'id = ?',
//   //     whereArgs: [source.id],
//   //   );
//   // }
//
//   Future<int> deleteNews(int id) async {
//     final db = await database;
//     return await db.delete(
//       'news',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
//
//   Future<bool> newsExists(String title) async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(
//       'news',
//       where: 'title = ?',
//       whereArgs: [title],
//       limit: 1,
//     );
//     return maps.isNotEmpty;
//   }
// }
//
// void main() async {
//   final dbHelper = DatabaseHelper();
//
//   // Example NewsModel
//   SourceModel source = SourceModel(id: '1', name: 'Example Source');
//   NewsModel news = NewsModel(
//     source: source,
//     author: 'Author Name',
//     title: 'News Title',
//     description: 'News Description',
//     url: 'https://example.com',
//     urlToImage: 'https://example.com/image.jpg',
//     publishedAt: '2023-06-04T12:00:00Z',
//     content: 'News Content',
//   );
//
//   // Insert news into the database
//   await dbHelper.insertNews(news);
//
//   // Check if the news exists
//   bool exists = await dbHelper.newsExists(news.title);
//   if (exists) {
//     print('News exists in the database.');
//   } else {
//     print('News does not exist in the database.');
//   }
// }
