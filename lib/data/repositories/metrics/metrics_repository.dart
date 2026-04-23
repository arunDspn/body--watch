import 'package:collection/collection.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/metrics_units/i_metrics_reposiotry.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';

class MetricsRepository implements IMetricsRepository {
  MetricsRepository() : _databaseService = DatabaseService();

  final DatabaseService _databaseService;
  static const Set<String> _genericUnitMetricExclusions = <String>{'bmi'};

  @override
  Future<Map<String, List<MetricUnitsModel>>>
  getAllMetricUnitsAvailable() async {
    final db = await _databaseService.database;
    /**
     * Select * FROM metrics m JOIN metric_units mu ON m.id = mu.metric_id
     */

    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      Select * FROM ${DatabaseService.metricsTable} m JOIN ${DatabaseService.metricUnitsTable} mu 
      ON m.id = mu.metric_id ORDER by m.code
    ''');

    final groupedData = maps.groupListsBy((element) {
      return element['name'] as String;
    });

    print(groupedData);

    final entries = groupedData.entries.where((entry) {
      final firstRow = entry.value.firstOrNull;
      final metricCode = firstRow?['code'] as String?;
      return metricCode != null &&
          !_genericUnitMetricExclusions.contains(metricCode);
    });

    return Map<String, List<MetricUnitsModel>>.fromEntries(
      entries.map((entry) {
        final key = entry.key;
        final value = entry.value;
        final units = value
            .map(
              (e) => MetricUnitsModel(
                unit: e['unit'] as String,
                code: e['code'] as String,
                toBaseFactor: e['to_base_factor'] as double,
              ),
            )
            .toList();

        final metricCode = units.firstOrNull?.code;
        if (metricCode == 'body_fat_percentage' ||
            metricCode == 'skeletal_muscle_mass_percentage') {
          units.addAll([
            MetricUnitsModel(unit: 'kg', code: metricCode!, toBaseFactor: 1),
            MetricUnitsModel(unit: 'lbs', code: metricCode, toBaseFactor: 1),
          ]);
        }

        return MapEntry(key, units);
      }),
    );
  }
}
