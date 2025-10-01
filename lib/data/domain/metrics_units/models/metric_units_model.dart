import 'package:freezed_annotation/freezed_annotation.dart';
part 'metric_units_model.freezed.dart';
part 'metric_units_model.g.dart';

/**
 *  { unit: "cm", to_base_factor: 1.0, base_unit: "cm" }
 */

@freezed
abstract class MetricUnitsModel with _$MetricUnitsModel {
  const factory MetricUnitsModel({
    required String unit,
    required String code,
    // @JsonKey(name: 'to_base_factor') required double toBaseFactor,
    // @JsonKey(name: 'base_unit') required String baseUnit,
  }) = _MetricUnitsModel;

  // from JSON
  factory MetricUnitsModel.fromJson(Map<String, dynamic> json) =>
      _$MetricUnitsModelFromJson(json);
}
