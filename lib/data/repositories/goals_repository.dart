import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/measurement/i_goals.dart';
import 'package:watcha_body/domain/measurement/models/goal_entity.dart';

class GoalsRepository extends IGoalsFacade {
  GoalsRepository(this.databaseService);

  final DatabaseService databaseService;

  @override
  Future<Either<String, Unit>> createOrReplaceActiveGoal({
    required GoalEntity goal,
  }) async {
    try {
      final db = await databaseService.database;
      final now = DateTime.now().toIso8601String();

      await db.transaction((txn) async {
        await txn.update(
          DatabaseService.measurementGoalsTable,
          {'status': GoalStatus.cancelled.name, 'updated_at': now},
          where: 'user_id = ? AND target_id = ? AND status = ?',
          whereArgs: [goal.userId, goal.targetId, GoalStatus.active.name],
        );

        await txn.insert(
          DatabaseService.measurementGoalsTable,
          goal
              .copyWith(
                status: GoalStatus.active,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              )
              .toJson()
            ..remove('id'),
          conflictAlgorithm: ConflictAlgorithm.abort,
        );
      });

      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GoalEntity?>> getActiveGoal({
    required int userId,
    required int targetId,
  }) async {
    try {
      final db = await databaseService.database;
      final data = await db.query(
        DatabaseService.measurementGoalsTable,
        where: 'user_id = ? AND target_id = ? AND status = ?',
        whereArgs: [userId, targetId, GoalStatus.active.name],
        orderBy: 'created_at DESC',
        limit: 1,
      );

      if (data.isEmpty) {
        return const Right(null);
      }

      return Right(GoalEntity.fromJson(data.first));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<GoalEntity>>> getGoalsByTarget({
    required int userId,
    required int targetId,
  }) async {
    try {
      final db = await databaseService.database;
      final data = await db.query(
        DatabaseService.measurementGoalsTable,
        where: 'user_id = ? AND target_id = ?',
        whereArgs: [userId, targetId],
        orderBy: 'created_at DESC',
      );

      return Right(data.map(GoalEntity.fromJson).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> completeGoal({required int goalId}) async {
    return _updateGoalStatus(goalId: goalId, status: GoalStatus.completed);
  }

  @override
  Future<Either<String, Unit>> cancelGoal({required int goalId}) async {
    return _updateGoalStatus(goalId: goalId, status: GoalStatus.cancelled);
  }

  Future<Either<String, Unit>> _updateGoalStatus({
    required int goalId,
    required GoalStatus status,
  }) async {
    try {
      final db = await databaseService.database;
      await db.update(
        DatabaseService.measurementGoalsTable,
        {'status': status.name, 'updated_at': DateTime.now().toIso8601String()},
        where: 'id = ?',
        whereArgs: [goalId],
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
