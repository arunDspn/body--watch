import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  factory DatabaseService() => _instance;
  DatabaseService._internal();
  static final DatabaseService _instance = DatabaseService._internal();

  /// Table name

  /// User Table
  static const String userTable = 'users';

  /// User Unit Preferences Table
  static const String userUnitPreferencesTable = 'user_unit_preferences';

  /// User settings Table
  static const String userSettingsTable = 'user_settings';

  /// All measurement data will be stored in this table
  static const String measurementsDataTable = 'measurementsData';

  /// Goals table
  /// Stores user goals separately from measurement history
  static const String measurementGoalsTable = 'measurement_goals';

  /// metrics table
  /// stores base metrics with their standard unit
  /// weight: kg, lbs
  /// height: cm, inch
  /// length: cm, inch
  /// body_fat_percentage: %
  /// bmi: kg/m2
  static const String metricsTable = 'metrics';

  /// metric units table
  /// stores unit conversions
  /// weight: kg, lbs
  /// height: cm, inch
  /// length: cm, inch
  static const String metricUnitsTable = 'metric_units';

  /// Measurement Targets Table
  /// This table stores all measurable items (muscles and body metrics)
  static const String measurementTargetsTable = 'measurement_targets';

  /// target metrics table
  /// This table stores the target metrics for each measurement target
  static const String targetMetricsTable = 'target_metrics';

  /// tags table
  /// This table stores all tags for measurements
  static const String tagsTable = 'tags';

  /// pictures table
  /// This table stores all pictures for measurements
  static const String picturesTable = 'pictures';

  /// picture targets table
  /// This table stores the targets associated with each picture
  static const String pictureTargetsTable = 'picture_targets';

  /// Database name
  static const String _databaseName = 'database.db';
  static const _databaseVersion = 1;

  /**
   * Database Schema
   * Metrics Table 
   * - code: weight, height, length, body_fat_percentage, bmi
   * - base_unit: kg, cm, cm, %, kg/m2
   * 
   * Metric Units Table
   * - unit: kg, lbs, cm, inch
   * - to_base_factor: 1.0, 0.45359237, 1.0, 2.54
   * - This table will help in converting between units
   * 
   * Muscle Groups Table
   * - id: unique identifier for each muscle group
   * - name: name of the muscle group
   * 
   * Muscle Group Metrics Table
   * - muscle_group_id: references the muscle group
   * - metric_id: references the metric
   */

  // static queries

  /// Supported Metrics
  /// weight: kg, lbs
  /// height: cm, inch
  /// length: cm, inch

  /// Create metrics table - stores base metrics with their standard unit
  static const String _createMetricsTable =
      '''
    CREATE TABLE $metricsTable (
      "id" INTEGER,
      "code" TEXT NOT NULL UNIQUE,
      "name" TEXT NOT NULL,
      "base_unit" TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
    )
  ''';

  /// Create metric units table - stores unit conversions
  static const String _createMetricUnitsTable =
      '''
    CREATE TABLE $metricUnitsTable (
      "metric_id" INTEGER NOT NULL,
      "unit" TEXT NOT NULL,
      "to_base_factor" REAL NOT NULL,
      PRIMARY KEY("metric_id", "unit"),
      FOREIGN KEY("metric_id") REFERENCES "metrics"("id") ON DELETE CASCADE
    )
  ''';

  /// Insert base metrics
  static const String _insertMetrics =
      '''
    INSERT INTO $metricsTable (code, name, base_unit)
    VALUES
      ('weight', 'Weight', 'kg'),
      ('height', 'Height', 'cm'),
      ('length', 'Length/Circumference', 'cm'),
      ('body_fat_percentage', 'Body Fat Percentage', '%'),
      ('bmi', 'Body Mass Index', 'kg/m2');
  ''';

  /// Insert unit conversions
  static const String _insertMetricUnits =
      '''
    INSERT INTO $metricUnitsTable (metric_id, unit, to_base_factor)
    SELECT id, base_unit, 1.0 FROM $metricsTable
    UNION ALL
    SELECT m.id, 'lbs', 0.45359237
    FROM $metricsTable m WHERE m.code = 'weight'
    UNION ALL
    SELECT m.id, 'inch', 2.54
    FROM $metricsTable m WHERE m.code IN ('height', 'length');
  ''';

  /// Create Measurement Targets Table
  /// This table stores all measurable items (muscles and body metrics)
  static const String _createMeasurementTargetsTable =
      '''
    CREATE TABLE $measurementTargetsTable (
      "id" INTEGER,
      "name" TEXT NOT NULL UNIQUE,
      "code" TEXT NOT NULL UNIQUE, -- e.g., 'weight', 'height', 'chest', 'waist' from metrics table
      "type" TEXT NOT NULL CHECK(type IN ('muscle', 'body')),
      "category" TEXT NOT NULL,
      "display_order" INTEGER NOT NULL DEFAULT 0,
      PRIMARY KEY("id" AUTOINCREMENT)
    )
  ''';

  /// Create Users Table
  /// This table stores user information
  static const String _createUsersTable =
      '''
    CREATE TABLE $userTable (
      "id" INTEGER,
      "name" TEXT NOT NULL,
      "dob" TEXT NOT NULL,
      "gender" TEXT NOT NULL CHECK(gender IN ('male', 'female', 'other')),
      PRIMARY KEY("id" AUTOINCREMENT)
    )
  ''';

  /// Create User Unit Preferences Table
  /// This table stores user preferred units for each metric
  static const String _createUserUnitPreferencesTable =
      '''
    CREATE TABLE $userUnitPreferencesTable (
      "user_id" INTEGER NOT NULL,
      "metric_code" TEXT NOT NULL,  -- 'weight', 'length', 'height'
      "preferred_unit" TEXT NOT NULL,
      PRIMARY KEY("user_id", "metric_code"),
      FOREIGN KEY("user_id") REFERENCES "$userTable"("id") ON DELETE CASCADE
    )
  ''';

  /// Create User Settings Table
  /// This table stores user settings like language, theme, notifications
  static const String _createUserSettingsTable =
      '''
    CREATE TABLE $userSettingsTable (
      "user_id" INTEGER NOT NULL,
      "setting_key" TEXT NOT NULL,  -- 'language', 'theme', 'notifications'
      "setting_value" TEXT NOT NULL,
      PRIMARY KEY("user_id", "setting_key"),
      FOREIGN KEY("user_id") REFERENCES "$userTable"("id") ON DELETE CASCADE
    )
  ''';

  /// Add data to Measurement Targets Table
  static const String _insertMeasurementTargets =
      '''
    -- Body measurements
    INSERT INTO $measurementTargetsTable (name, code, type, category, display_order)
    VALUES
      ('Body Weight', 'weight', 'body', 'vitals', 10),
      ('Height', 'height', 'body', 'vitals', 20),
      ('Body Fat Percentage', 'body_fat_percentage', 'body', 'composition', 30),
      ('BMI', 'bmi', 'body', 'composition', 40),
      
      -- Upper Body
      ('Chest', 'chest', 'muscle', 'upper_body', 100),
      ('Back', 'back', 'muscle', 'upper_body', 110),
      ('Shoulders', 'shoulders', 'muscle', 'upper_body', 120),
      ('Biceps - Left', 'biceps_left', 'muscle', 'arms', 200),
      ('Biceps - Right', 'biceps_right', 'muscle', 'arms', 210),
      ('Triceps - Left', 'triceps_left', 'muscle', 'arms', 220),
      ('Triceps - Right', 'triceps_right', 'muscle', 'arms', 230),
      ('Forearms - Left', 'forearms_left', 'muscle', 'arms', 240),
      ('Forearms - Right', 'forearms_right', 'muscle', 'arms', 250),
      
      -- Core
      ('Waist', 'waist', 'muscle', 'core', 300),
      ('Abs', 'abs', 'muscle', 'core', 310),
      
      -- Lower Body
      ('Hips', 'hips', 'muscle', 'lower_body', 400),
      ('Thighs - Left', 'thighs_left', 'muscle', 'legs', 500),
      ('Thighs - Right', 'thighs_right', 'muscle', 'legs', 510),
      ('Calves - Left', 'calves_left', 'muscle', 'legs', 520),
      ('Calves - Right', 'calves_right', 'muscle', 'legs', 530),
      ('Wrist - Left', 'wrist_left', 'muscle', 'arms', 260),
      ('Wrist - Right', 'wrist_right', 'muscle', 'arms', 270);
  ''';

  /// Create Target Metrics Table
  /// This table links measurement targets with their supported metrics
  static const String _createTargetMetricsTable =
      '''
    CREATE TABLE $targetMetricsTable (
      "target_id" INTEGER NOT NULL,
      "metric_id" INTEGER NOT NULL,
      PRIMARY KEY("target_id","metric_id"),
      FOREIGN KEY("target_id") REFERENCES "measurement_targets"("id") ON DELETE CASCADE,
      FOREIGN KEY("metric_id") REFERENCES "metrics"("id") ON DELETE CASCADE
    )
  ''';

  /// Link targets with their supported metrics
  static const String _insertTargetMetrics =
      '''
    -- Link body measurements with their specific metrics
    INSERT INTO $targetMetricsTable (target_id, metric_id)
    SELECT t.id, m.id
    FROM measurement_targets t
    CROSS JOIN metrics m
    WHERE 
      (t.code = 'weight' AND m.code = 'weight') OR
      (t.code = 'height' AND m.code = 'height') OR
      (t.code = 'body_fat_percentage' AND m.code = 'body_fat_percentage') OR
      (t.code = 'bmi' AND m.code = 'bmi') OR
      (t.type = 'muscle' AND m.code = 'length');
  ''';

  /// Create measurements table - stores user measurements
  static const String _createMeasurementTable =
      '''
    CREATE TABLE $measurementsDataTable (
      "id"	INTEGER,
      "user_id" INTEGER NOT NULL,
      "value"	REAL NOT NULL CHECK (value > 0),
      "date"	TEXT NOT NULL,
      "target_id" INTEGER NOT NULL,
      "notes" TEXT DEFAULT NULL,
      "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY("id" AUTOINCREMENT),
      FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
      FOREIGN KEY("target_id") REFERENCES "measurement_targets"("id")
    )
  ''';

  /// Create measurement goals table - stores target goals separately
  static const String _createMeasurementGoalsTable =
      '''
    CREATE TABLE $measurementGoalsTable (
      "id" INTEGER,
      "user_id" INTEGER NOT NULL,
      "target_id" INTEGER NOT NULL,
      "target_value" REAL NOT NULL CHECK (target_value > 0),
      "start_date" TEXT NOT NULL,
      "due_date" TEXT,
      "status" TEXT NOT NULL DEFAULT 'active' CHECK(status IN ('active', 'completed', 'cancelled')),
      "direction" TEXT NOT NULL DEFAULT 'increase' CHECK(direction IN ('increase', 'decrease')),
      "notes" TEXT DEFAULT NULL,
      "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY("id" AUTOINCREMENT),
      FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
      FOREIGN KEY("target_id") REFERENCES "measurement_targets"("id") ON DELETE CASCADE
    )
  ''';

  /// Enforce one active goal per user and measurement target
  static const String _createActiveGoalUniqueIndex =
      '''
    CREATE UNIQUE INDEX IF NOT EXISTS idx_measurement_goals_active_unique
    ON $measurementGoalsTable ("user_id", "target_id")
    WHERE status = 'active'
  ''';

  static const String _createTagTable =
      '''
    CREATE TABLE IF NOT EXISTS $tagsTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tag TEXT NOT NULL UNIQUE
    );
  ''';

  // insert pre defined tags to table above
  // chest, back, legs, arms, shoulders, abs, neck, waist, hips, calves, thighs,
  // butt, feet, face,
  static const String _insertTagsQuery =
      '''
    INSERT OR IGNORE INTO $tagsTable (tag)
    VALUES
      ('double chin'),
      ('love handles'),
      ('muffin top'),
      ('six pack'),
      ('bingo wings'),
      ('saddle bags'),
      ('turkey neck');
  ''';

  // Pictures Table
  static const _createPictureTable =
      '''
    CREATE TABLE IF NOT EXISTS $picturesTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER NOT NULL,
      file TEXT NOT NULL,
      thumbnail_file TEXT NOT NULL,
      date TEXT NOT NULL,
      tag_id INTEGER NOT NULL,
      note TEXT,
      FOREIGN KEY(user_id) REFERENCES $userTable(id) ON DELETE CASCADE,
      FOREIGN KEY(tag_id) REFERENCES $tagsTable(id)
    );
  ''';

  // Picture Targets Junction Table (many-to-many relationship)
  static const String _createPictureTargetsTable =
      '''
    CREATE TABLE IF NOT EXISTS $pictureTargetsTable (
      picture_id INTEGER NOT NULL,
      target_id INTEGER NOT NULL,
      PRIMARY KEY(picture_id, target_id),
      FOREIGN KEY(picture_id) REFERENCES $picturesTable(id) ON DELETE CASCADE,
      FOREIGN KEY(target_id) REFERENCES $measurementTargetsTable(id) ON DELETE CASCADE
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
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
      onCreate: _onCreateDB,
      onUpgrade: (db, oldVersion, newVersion) {
        // log('NEW VERSION: $newVersion');
        // // new data named pictures
        // if (oldVersion < 4) {
        //   db.execute(createPictureTable);
        // }
        // // new data named tags
        // if (oldVersion < 5) {
        //   db
        //     ..execute(createTagTable)
        //     ..execute(insertTagsQuery);
        // }
      },
    );
    return database;
  }

  Future _onCreateDB(Database db, int version) async {
    // Create tables in proper order (referenced tables first)
    await db.execute(_createMetricsTable);
    await db.execute(_createMetricUnitsTable);
    await db.execute(_createMeasurementTargetsTable);
    await db.execute(_createTargetMetricsTable);
    await db.execute(_createUsersTable);
    await db.execute(_createUserUnitPreferencesTable);
    await db.execute(_createUserSettingsTable);
    await db.execute(_createMeasurementGoalsTable);
    await db.execute(_createActiveGoalUniqueIndex);
    await db.execute(_createMeasurementTable);
    await db.execute(_createTagTable);
    await db.execute(_createPictureTable);
    await db.execute(_createPictureTargetsTable);

    // Seed reference data
    await db.execute(_insertMetrics);
    await db.execute(_insertMetricUnits);
    await db.execute(_insertMeasurementTargets);
    await db.execute(_insertTargetMetrics);
    await db.execute(_insertTagsQuery);
  }

  //   Future<void> insert({
  //     required Map<String, dynamic> map,
  //   }) async {
  //     try {
  //       final _db = await database;
  //       await _db.insert(tableName, map);
  //     } catch (e) {
  //       return Future.error(e);
  //     }
  //   }

  //   Future<void> update({
  //     required Map<String, dynamic> map,
  //   }) async {
  //     try {
  //       final _db = await database;
  //       await _db.update(
  //         tableName,
  //         map,
  //         where: 'id = ?',
  //         whereArgs: [map['id']],
  //       );
  //     } catch (e) {
  //       return Future.error(e);
  //     }
  //   }

  //   Future<void> delete({
  //     String? id,
  //   }) async {
  //     try {
  //       final _db = await database;
  //       if (id != null) {
  //         await _db.delete(
  //           tableName,
  //           where: 'id = ?',
  //           whereArgs: [id],
  //         );
  //       } else {
  //         await _db.delete(tableName);
  //       }
  //     } catch (e) {
  //       return Future.error(e);
  //     }
  //   }

  //   Future<List<Map<String, dynamic>>> getData({
  //     DateTime? startDate,
  //     DateTime? endDate,
  //     String? type,
  //   }) async {
  //     try {
  //       final _db = await database;
  //       late List<Map<String, Object?>> _data;
  //       if (startDate != null && endDate != null && type != null) {
  //         _data = await _db.query(
  //           tableName,
  //           where: 'date BETWEEN ? AND ? AND type = ?',
  //           whereArgs: [
  //             startDate.toIso8601String(),
  //             endDate.toIso8601String(),
  //             type,
  //           ],
  //           orderBy: 'date DESC',
  //         );
  //         print("object");
  //       } else if (startDate != null && endDate != null && type == null) {
  //         // _data = await _db.query(
  //         //   tableName,
  //         //   where: 'date BETWEEN ? AND ?',
  //         //   whereArgs: [
  //         //     startDate.toIso8601String(),
  //         //     endDate.toIso8601String(),
  //         //   ],
  //         //   orderBy: 'date DESC',
  //         // );
  //         _data = await _db.query(
  //           tableName,
  //           where: '"date" BETWEEN ? AND ?',
  //           whereArgs: [
  //             endDate.toIso8601String(),
  //             startDate.toIso8601String(),
  //           ],
  //           orderBy: 'date DESC',
  //         );
  //         print("object");
  //       } else if (type != null) {
  //         _data = await _db.query(
  //           tableName,
  //           where: 'type = ?',
  //           whereArgs: [type],
  //           // orderBy: 'date DESC',
  //           orderBy: 'date DESC',
  //         );
  //       } else {
  //         _data = await _db.query(
  //           tableName,
  //           orderBy: 'date DESC',
  //         );
  //       }

  //       return _data;
  //     } catch (e) {
  //       return Future.error(e);
  //     }
  //   }

  //   Future<void> createTable({
  //     required String query,
  //   }) async {
  //     try {
  //       final _db = await database;
  //       await _db.execute(query);
  //     } catch (e) {
  //       return Future.error(e);
  //     }
  //   }

  //   Future<void> restoreData({required dynamic datas}) async {
  //     try {
  //       final _db = await database;
  //       final _batch = _db.batch();
  //       for (final data in datas) {
  //         _batch.insert(tableName, data as Map<String, Object?>);
  //       }
  //       await _batch.commit();
  //     } catch (e) {
  //       return Future.error(e);
  //     }
  //   }
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
