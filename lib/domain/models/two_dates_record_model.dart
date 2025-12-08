import 'package:freezed_annotation/freezed_annotation.dart';

part 'two_dates_record_model.freezed.dart';
part 'two_dates_record_model.g.dart';

@freezed
abstract class TwoDatesRecord with _$TwoDatesRecord {
  const factory TwoDatesRecord({
    // Target name
    required String name,
    // First date value
    required double? data1,
    required String? metricCode1,
    // Second date value
    required double? data2,
    required String? metricCode2,
    // Metric Code
    // required String metricCode,
  }) = _TwoDatesRecord;

  factory TwoDatesRecord.fromJson(Map<String, dynamic> json) =>
      _$TwoDatesRecordFromJson(json);
}


/**
 * resultOne = 
 * QueryResultSet ([{value: 175.0, date: 2025-11-03T00:00:00.000, target_name: Height, metric_code: height}])
 */