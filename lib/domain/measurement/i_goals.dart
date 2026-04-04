import 'package:dartz/dartz.dart';
import 'package:watcha_body/domain/measurement/models/goal_entity.dart';

abstract class IGoalsFacade {
  /// Creates a new active goal for a target and closes any existing active goal.
  Future<Either<String, Unit>> createOrReplaceActiveGoal({
    required GoalEntity goal,
  });

  /// Returns the currently active goal for a target, if present.
  Future<Either<String, GoalEntity?>> getActiveGoal({
    required int userId,
    required int targetId,
  });

  /// Returns all goals for a target ordered by newest first.
  Future<Either<String, List<GoalEntity>>> getGoalsByTarget({
    required int userId,
    required int targetId,
  });

  /// Marks a goal as completed.
  Future<Either<String, Unit>> completeGoal({required int goalId});

  /// Marks a goal as cancelled.
  Future<Either<String, Unit>> cancelGoal({required int goalId});
}
