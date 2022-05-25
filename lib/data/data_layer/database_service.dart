import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  factory DatabaseService() => _instance;
  DatabaseService._internal();
  static final DatabaseService _instance = DatabaseService._internal();

  static const String _databaseName = 'flutter_database.db';
  static const String chestTableName = 'chest';
  static const String waistTableName = 'waist';
  static const String hipTableName = 'hip';
  static const String addedWidgetsTableName = 'added_widgets';
  static const String allWidgetsTableName = 'all_widgets';
  static const _databaseVersion = 1;

  Map<String, String> tableCreationQuery = {
    chestTableName: _createChestTable,
    waistTableName: _createWaistTable,
    hipTableName: _createHipTable,
  };

  // static queries
  static const String _createChestTable = '''
  CREATE TABLE "$chestTableName" (
    "chest_id"	INTEGER NOT NULL UNIQUE,
    "measurement"	REAL NOT NULL,
    "date"	TEXT NOT NULL,
    PRIMARY KEY("chest_id" AUTOINCREMENT)
  );
  ''';
  static const String _createWaistTable = '''
  CREATE TABLE "$waistTableName" (
    "waist_id"	INTEGER NOT NULL UNIQUE,
    "measurement"	REAL NOT NULL,
    "date"	TEXT NOT NULL,
    PRIMARY KEY("waist_id" AUTOINCREMENT)
  );
  ''';

  static const String _createHipTable = '''
  CREATE TABLE "$hipTableName" (
    "hip_id"	INTEGER NOT NULL UNIQUE,
    "measurement"	REAL NOT NULL,
    "date"	TEXT NOT NULL,
    PRIMARY KEY("hip_id" AUTOINCREMENT)
  );
  ''';
  static const String _createAddedWidgetsTable = '''
  CREATE TABLE "$addedWidgetsTableName" (
    "name"	TEXT NOT NULL UNIQUE,
    "table_name"	TEXT NOT NULL UNIQUE
  );
  ''';
  static const String _createAllWidgetsTable = '''
  CREATE TABLE "$allWidgetsTableName" (
    "name"	TEXT NOT NULL UNIQUE,
    "table_name"	TEXT NOT NULL UNIQUE
  );
  ''';

  static const String _insertDataToAllWidgetsTable = '''
  INSERT INTO $allWidgetsTableName (name,table_name) 
  VALUES 
  ('Chest','$chestTableName'),
  ('Waist','$waistTableName'),
  ('Hip','$hipTableName');
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
    // await db.execute(_createChestTable);
    // await db.execute(_createWaistTable);
    await db.execute(_createAddedWidgetsTable);
    await db.execute(_createAllWidgetsTable);
    await db.execute(_insertDataToAllWidgetsTable);
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
    int? limit,
    String? orderBy,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final _db = await database;
      late List<Map<String, Object?>> _data;
      if (startDate != null && endDate != null) {
        _data = await _db.query(
          tableName,
          where: 'date BETWEEN ? AND ?',
          // where: 'measurement BETWEEN ? AND ?',
          whereArgs: [startDate.toIso8601String(), endDate.toIso8601String()],
          // whereArgs: [50, 60],
          limit: limit,
          orderBy: orderBy,
        );
      } else {
        _data = await _db.query(
          tableName,
          limit: limit,
          orderBy: orderBy,
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
