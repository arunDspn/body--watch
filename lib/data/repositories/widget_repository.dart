import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/i_widget_repository.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';

class WidgetRepository extends IWidgetRepository {
  WidgetRepository(this.databaseService);

  final DatabaseService databaseService;

  @override
  Future<Either<String, Unit>> addWidget({
    required MeasurementWidget measurementWidget,
  }) async {
    try {
      await databaseService.createTable(
        query: databaseService.tableCreationQuery[measurementWidget.tableName]!,
      );
      await databaseService.insert(
        tableName: DatabaseService.addedWidgetsTableName,
        map: measurementWidget.toMap(),
      );
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<MeasurementWidget>>> getAddedWidgets() async {
    try {
      final _result = await databaseService.getData(
        tableName: DatabaseService.addedWidgetsTableName,
      );
      final _dResult = _result.map(MeasurementWidget.fromMap).toList();
      return right(_dResult);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<MeasurementWidget>>> getAllWidgets() async {
    const _contextQuery = '''
        SELECT ${DatabaseService.allWidgetsTableName}.name,
        ${DatabaseService.allWidgetsTableName}.table_name FROM
        ${DatabaseService.allWidgetsTableName}
        LEFT JOIN ${DatabaseService.addedWidgetsTableName}
        ON ${DatabaseService.allWidgetsTableName}.name = ${DatabaseService.addedWidgetsTableName}.name
        WHERE ${DatabaseService.addedWidgetsTableName}.name IS NULL;
        ''';
    // const _contextQuery = '''
    //     SELECT * FROM ${DatabaseService.allWidgetsTableName}
    //     ''';
    // const _contextQuery = '''
    //     SELECT * FROM all_widgets''';
    // const _contextQuery = '''
    //     SELECT * FROM added_widgets''';
    try {
      final _db = await databaseService.database;

      final _result = await _db.rawQuery(_contextQuery);

      final _dResult = _result.map(MeasurementWidget.fromMap).toList();
      return right(_dResult);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> removeWidget() {
    // TODO: implement removeWidget
    throw UnimplementedError();
  }
}
