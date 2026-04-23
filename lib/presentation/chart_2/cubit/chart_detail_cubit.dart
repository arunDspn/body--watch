import 'package:bloc/bloc.dart';
import 'package:watcha_body/data/repositories/goals_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/domain/measurement/i_measurements.dart';
import 'package:watcha_body/domain/measurement/models/goal_entity.dart';
import 'package:watcha_body/domain/measurement/models/measurement_model.dart';

class ChartDetailCubit extends Cubit<ChartDetailState> {
  ChartDetailCubit(this._measurementRepository, this._goalsRepository)
    : super(const ChartDetailInitial());

  final MeasurementRepository _measurementRepository;
  final GoalsRepository _goalsRepository;

  Future<void> load({
    required int targetId,
    int userId = 1,
    MeasurementSourceFilter sourceFilter = MeasurementSourceFilter.manual,
  }) async {
    emit(ChartDetailLoading(sourceFilter: sourceFilter));

    final measurementsResult = await _measurementRepository
        .getMeasurementsByTarget(
          targetId: targetId,
          userId: userId,
          sourceFilter: sourceFilter,
        );
    final goalResult = await _goalsRepository.getActiveGoal(
      userId: userId,
      targetId: targetId,
    );

    measurementsResult.fold((error) => emit(ChartDetailFailure(error)), (
      measurements,
    ) {
      goalResult.fold(
        (_) => emit(
          ChartDetailLoaded(
            measurements: measurements,
            sourceFilter: sourceFilter,
          ),
        ),
        (activeGoal) => emit(
          ChartDetailLoaded(
            measurements: measurements,
            activeGoal: activeGoal,
            sourceFilter: sourceFilter,
          ),
        ),
      );
    });
  }

  Future<String?> createOrReplaceGoal({required GoalEntity goal}) async {
    final result = await _goalsRepository.createOrReplaceActiveGoal(goal: goal);
    return result.fold((error) => error, (_) => null);
  }

  Future<String?> completeGoal({required int goalId}) async {
    final result = await _goalsRepository.completeGoal(goalId: goalId);
    return result.fold((error) => error, (_) => null);
  }

  Future<String?> cancelGoal({required int goalId}) async {
    final result = await _goalsRepository.cancelGoal(goalId: goalId);
    return result.fold((error) => error, (_) => null);
  }
}

abstract class ChartDetailState {
  const ChartDetailState();
}

class ChartDetailInitial extends ChartDetailState {
  const ChartDetailInitial();
}

class ChartDetailLoading extends ChartDetailState {
  const ChartDetailLoading({
    this.sourceFilter = MeasurementSourceFilter.manual,
  });

  final MeasurementSourceFilter sourceFilter;
}

class ChartDetailLoaded extends ChartDetailState {
  const ChartDetailLoaded({
    required this.measurements,
    this.activeGoal,
    this.sourceFilter = MeasurementSourceFilter.manual,
  });

  final List<MeasurementModel> measurements;
  final GoalEntity? activeGoal;
  final MeasurementSourceFilter sourceFilter;
}

class ChartDetailFailure extends ChartDetailState {
  const ChartDetailFailure(this.message);

  final String message;
}
