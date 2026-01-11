import 'package:freezed_annotation/freezed_annotation.dart';
part 'measurement_entity.freezed.dart';
part 'measurement_entity.g.dart';

@freezed
abstract class MeasurementEntity with _$MeasurementEntity {
  const factory MeasurementEntity({
    required double value,
    @JsonKey(name: 'goal_value') double? goalValue,
    required DateTime date,
    @JsonKey(name: 'target_id') required int targetId,
    required String notes,
    @JsonKey(name: 'created_at') @Default(null) DateTime? createdAt,
    @JsonKey(name: 'updated_at') @Default(null) DateTime? updatedAt,
    // user_id
    @JsonKey(name: 'user_id') required int userId,
    int? id,
  }) = _MeasurementEntity;

  factory MeasurementEntity.createNew({
    required double value,
    double? goalValue,
    required DateTime date,
    required int targetId,
    required String notes,
  }) {
    return MeasurementEntity(
      value: value,
      goalValue: goalValue,
      date: date,
      targetId: targetId,
      notes: notes,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      userId: 1, // TODO: change it to actual user id
    );
  }

  factory MeasurementEntity.fromJson(Map<String, dynamic> json) =>
      _$MeasurementEntityFromJson(json);
}

// class MeasurementEntity {
//   MeasurementEntity({
//     required this.value,
//     required this.date,
//     this.id,
//     required this.type,
//     required this.unit,
//   });

//   factory MeasurementEntity.fromMap(Map<String, dynamic> json) {
//     return MeasurementEntity(
//       value: json['value'] as double,
//       date: DateTime.parse(
//         json['date'] as String,
//       ), // may be error
//       id: json['id'].toString(),
//       type: json['type'] as String,
//       unit: json['unit'] as String,
//     );
//   }

//   final double value;
//   final DateTime date;
//   final String? id;
//   final String type;
//   final String unit;

//   Map<String, Object?> toMap() {
//     return <String, Object?>{
//       'value': value,
//       'date': date.toIso8601String(),
//       'id': id,
//       'type': type,
//       'unit': unit,
//     };
//   }

//   //copy with
//   MeasurementEntity copyWith({
//     double? value,
//     DateTime? date,
//     String? id,
//     String? type,
//     String? unit,
//   }) {
//     return MeasurementEntity(
//       value: value ?? this.value,
//       date: date ?? this.date,
//       id: id ?? this.id,
//       type: type ?? this.type,
//       unit: unit ?? this.unit,
//     );
//   }
// }
