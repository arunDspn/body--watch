import 'package:freezed_annotation/freezed_annotation.dart';
part 'measurement_model.freezed.dart';
part 'measurement_model.g.dart';

@freezed

/// Used to represent a measurement taken by the user.
abstract class MeasurementModel with _$MeasurementModel {
  const factory MeasurementModel({
    required int id,
    required double value,
    required DateTime date,

    /// Measurement target name, e.g., "Weight", "Height"
    @JsonKey(name: 'target_name') required String targetName,
    @JsonKey(name: 'metric_code') required String metricCode,

    /// Measurement type, e.g., "body", "fitness"
    required String type,
    required String notes,

    /// Foreign key to the measurement target
    @JsonKey(name: 'target_id') required int targetId,

    /// Timestamps
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _MeasurementModel;

  factory MeasurementModel.fromJson(Map<String, dynamic> json) =>
      _$MeasurementModelFromJson(json);
}


/**
 * 
 * QueryRow ({id: 1, value: 25.0, 
 * date: 2025-10-01T12:21:37.638771, 
 * notes: , target_id: 2, 
 * created_at: 2025-10-01T12:48:50.624542, 
 * updated_at: 2025-10-01T12:48:50.624544, 
 * target_name: Height, type: body})
 */