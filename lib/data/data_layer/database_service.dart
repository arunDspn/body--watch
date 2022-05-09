import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  factory DatabaseService() => _instance;
  DatabaseService._internal();
  static final DatabaseService _instance = DatabaseService._internal();

  static const String _databaseName = 'flutter_database.db';
  static const _databaseVersion = 1;

  // static queries
  static const String _createChestTable = '''
  CREATE TABLE "chest" (
    "chest_id"	INTEGER NOT NULL UNIQUE,
    "measurement"	INTEGER NOT NULL,
    "date"	TEXT NOT NULL,
    PRIMARY KEY("chest_id" AUTOINCREMENT)
  );
  ''';
  static const String _createWaistTable = '''
  CREATE TABLE "waist" (
    "waist_id"	INTEGER NOT NULL UNIQUE,
    "measurement"	INTEGER NOT NULL,
    "date"	TEXT NOT NULL,
    PRIMARY KEY("waist_id" AUTOINCREMENT)
  );
  ''';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      return _initDatabase();
    }
  }

  Future<Database> _initDatabase() async {
    final database = await openDatabase(
      join(
        await getDatabasesPath(),
        _databaseName,
      ),
      version: _databaseVersion,
      onCreate: _onCreateDB,
    );
    return database;
  }

  Future _onCreateDB(Database db, int version) async {
    //create tables
    await db.execute(_createChestTable);
    await db.execute(_createWaistTable);
  }

  Future<void> insert({
    required String tableName,
    required Map<String, dynamic> map,
  }) async {
    try {
      final _db = await database;
      await _db.insert(tableName, map);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> update({
    required String tableName,
    required Map<String, dynamic> map,
    required String id,
  }) async {
    try {
      final _db = await database;
      await _db.update(
        tableName,
        map,
        where: '$id = ?',
        whereArgs: [map['id']],
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  void delete({required String tableName, required int id}) {}
  Future<List<Map<String, dynamic>>> getData({
    required String tableName,
    int limit = 0,
  }) async {
    try {
      final _db = await database;
      final _data = await _db.query(
        tableName,
        limit: limit,
        orderBy: 'date DESC',
      );
      return _data;
    } catch (e) {
      return Future.error(e);
    }
  }
}

/**
 * 
CREATE TABLE "chest" (
	"chest_id"	INTEGER NOT NULL UNIQUE,
	"measurement"	INTEGER NOT NULL,
	"date"	TEXT NOT NULL,
	PRIMARY KEY("chest_id" AUTOINCREMENT)
);

CREATE TABLE "waist" (
	"waist_id"	INTEGER NOT NULL UNIQUE,
	"measurement"	INTEGER NOT NULL,
	"date"	TEXT NOT NULL,
	PRIMARY KEY("waist_id" AUTOINCREMENT)
);
);
 */
