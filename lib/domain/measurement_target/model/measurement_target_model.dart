import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';
part 'measurement_target_model.freezed.dart';
part 'measurement_target_model.g.dart';

@freezed
abstract class MeasurementTargetModel with _$MeasurementTargetModel {
  const factory MeasurementTargetModel({
    required int id,
    required String name,
    required String code,
    required String type,
    required String category,
    @JsonKey(name: 'metric_code') required String metricCode,
    @JsonKey(name: 'display_order') required int displayOrder,
    required List<MetricUnitsModel> units,
  }) = _MeasurementTargetModel;

  // Private constructor for freezed
  const MeasurementTargetModel._();

  // From JSON
  factory MeasurementTargetModel.fromJson(Map<String, dynamic> json) =>
      _$MeasurementTargetModelFromJson(json);

  // factory MeasurementTargetModel.fromMap(Map<String, Object?> map) {
  //   return MeasurementTargetModel(
  //     id: map['id']! as int,
  //     name: map['name']! as String,
  //     code: map['code']! as String,
  //     type: map['type']! as String,
  //     category: map['category']! as String,
  //     displayOrder: map['displayOrder']! as int? ?? 0,
  //   );
  // }
}
