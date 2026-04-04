/**
 * GoalEntity
id
userId
targetId
targetValue
startDate
dueDate optional
notes optional
status active/completed/cancelled
 */

import 'package:freezed_annotation/freezed_annotation.dart';
part 'goal_entity.freezed.dart';
part 'goal_entity.g.dart';

enum GoalStatus {
  @JsonValue('active')
  active,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

@freezed
abstract class GoalEntity with _$GoalEntity {
  const factory GoalEntity({
    @JsonKey(name: 'target_id') required int targetId,
    @JsonKey(name: 'target_value') required double targetValue,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    String? notes,
    @JsonKey(name: 'status') @Default(GoalStatus.active) GoalStatus status,
    @JsonKey(name: 'created_at') @Default(null) DateTime? createdAt,
    @JsonKey(name: 'updated_at') @Default(null) DateTime? updatedAt,
    @JsonKey(name: 'user_id') required int userId,
    //a optional Note
    String? goalNote,

    int? id,
  }) = _GoalEntity;

  factory GoalEntity.fromJson(Map<String, dynamic> json) =>
      _$GoalEntityFromJson(json);
}
