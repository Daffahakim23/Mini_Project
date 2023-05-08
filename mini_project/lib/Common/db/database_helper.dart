import 'package:mini_project/Common/model/productList_response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database;
  }

  final String _tableName = 'tbl_watch';

  Future<Database> _initializeDB() async {
    var db = openDatabase(
        join(
          await getDatabasesPath(),
          'watch_db.db',
        ), onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, productName TEXT, image TEXT)''',
      );
    }, version: 1);

    return db;
  }

  Future<List<WatchlistTable>> getListWatchlist() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results
        .map(
          (e) => WatchlistTable.fromMap(e),
        )
        .toList();
  }

  Future<void> insertWatchlist(WatchlistTable watchlistTable) async {
    final db = await database;

    await db.insert(
      _tableName,
      watchlistTable.toMap(),
    );
  }

  Future<int> removeWatchlist(int id) async {
    final db = await database;

    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<WatchlistTable> getStatusWatchlist(int id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return results
        .map(
          (e) => WatchlistTable.fromMap(e),
        )
        .first;
  }
}
