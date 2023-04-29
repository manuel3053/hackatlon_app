// ignore_for_file: prefer_const_declarations

import 'package:hackatlon_app/db/wikiData.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ArticlesDatabase {
  static final ArticlesDatabase instance = ArticlesDatabase._init();

  static Database? _database;

  ArticlesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableWiki ( 
  ${ArticlesFields.id} $idType, 
  ${ArticlesFields.title} $textType,
  ${ArticlesFields.body} $textType
  )
''');
  }

  Future<Article> createArticle(Article article) async {
    final db = await instance.database;

    final id = await db.insert(tableWiki, article.toJson());
    return article.copy(id: id);
  }

  Future<Article> readArticle(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableWiki,
      columns: ArticlesFields.values,
      where: '${ArticlesFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Article.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Article>> readAllArticles() async {
    final db = await instance.database;

    final result = await db.query(tableWiki);

    return result.map((json) => Article.fromJson(json)).toList();
  }

  Future<int> updateArticles(Article article) async {
    final db = await instance.database;

    return db.update(
      tableWiki,
      article.toJson(),
      where: '${ArticlesFields.id} = ?',
      whereArgs: [article.id],
    );
  }

  Future<int> deleteArticle(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableWiki,
      where: '${ArticlesFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Future drop() async {
    final db = await instance.database;

    db.delete('Articles');
  }
}
