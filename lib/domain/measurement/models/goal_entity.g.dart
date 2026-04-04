// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalEntity _$GoalEntityFromJson(Map<String, dynamic> json) => _GoalEntity(
  targetId: (json['target_id'] as num).toInt(),
  targetValue: (json['target_value'] as num).toDouble(),
  startDate: DateTime.parse(json['start_date'] as String),
  dueDate: json['due_date'] == null
      ? null
      : DateTime.parse(json['due_date'] as String),
  notes: json['notes'] as String?,
  status:
      $enumDecodeNullable(_$GoalStatusEnumMap, json['status']) ??
      GoalStatus.active,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  userId: (json['user_id'] as num).toInt(),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$GoalEntityToJson(_GoalEntity instance) =>
    <String, dynamic>{
      'target_id': instance.targetId,
      'target_value': instance.targetValue,
      'start_date': instance.startDate.toIso8601String(),
      'due_date': instance.dueDate?.toIso8601String(),
      'notes': instance.notes,
      'status': _$GoalStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_id': instance.userId,
      'id': instance.id,
    };

const _$GoalStatusEnumMap = {
  GoalStatus.active: 'active',
  GoalStatus.completed: 'completed',
  GoalStatus.cancelled: 'cancelled',
};
