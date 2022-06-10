import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  factory DatabaseService() => _instance;
  DatabaseService._internal();
  static final DatabaseService _instance = DatabaseService._internal();

  static const String tableName = 'measurements';
  static const String _databaseName = 'flutter_database.db';
  static const _databaseVersion = 1;

  // static queries
  static const String _createMeasurementTable = '''
    CREATE TABLE "measurements" (
      "id"	INTEGER,
      "value"	REAL NOT NULL,
      "date"	TEXT NOT NULL,
      "type"	TEXT NOT NULL,
      "unit"	TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
    )
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
    await db.execute(_createMeasurementTable);
  }

  Future<void> insert({
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
    required Map<String, dynamic> map,
  }) async {
    try {
      final _db = await database;
      await _db.update(
        tableName,
        map,
        where: 'id = ?',
        whereArgs: [map['id']],
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  void delete({
    required int id,
  }) {}

  Future<List<Map<String, dynamic>>> getData({
    DateTime? startDate,
    DateTime? endDate,
    String? type,
  }) async {
    try {
      final _db = await database;
      late List<Map<String, Object?>> _data;
      if (startDate != null && endDate != null && type != null) {
        _data = await _db.query(
          tableName,
          where: 'date BETWEEN ? AND ? AND type = ?',
          whereArgs: [
            startDate.toIso8601String(),
            endDate.toIso8601String(),
            type
          ],
          orderBy: 'date DESC',
        );
      } else if (type != null) {
        _data = await _db.query(
          tableName,
          where: 'type = ?',
          whereArgs: [type],
          orderBy: 'date DESC',
        );
      } else {
        _data = await _db.query(
          tableName,
          orderBy: 'date DESC',
        );
      }

      return _data;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> createTable({
    required String query,
  }) async {
    try {
      final _db = await database;
      await _db.execute(query);
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
