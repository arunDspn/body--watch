import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/goals_repository.dart';
import 'package:watcha_body/domain/measurement/models/goal_entity.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';

part 'add_initial_measurement_data_state.dart';
part 'add_initial_measurement_data_cubit.freezed.dart';

class AddInitialMeasurementDataCubit
    extends Cubit<AddInitialMeasurementDataState> {
  AddInitialMeasurementDataCubit({
    required this.measurementRepository,
    required this.goalsRepository,
  }) : super(const AddInitialMeasurementDataState.initial());

  final MeasurementRepository measurementRepository;
  final GoalsRepository goalsRepository;

  Future<void> insertDataOnly({required MeasurementEntity measurement}) async {
    emit(const AddInitialMeasurementDataState.loading());
    final Either<String, Unit> result;
    if (measurement.id == null) {
      result = await measurementRepository.createMeasurement(
        measurement: measurement,
      );
    } else {
      result = await measurementRepository.updateMeasurement(
        measurement: measurement,
      );
    }

    result.fold(
      (l) => emit(AddInitialMeasurementDataState.failure(l)),
      (r) => emit(const AddInitialMeasurementDataState.success()),
    );
  }

  Future<void> insertDataWithGoal({
    required MeasurementEntity measurement,
    required double targetValue,
    DateTime? dueDate,
    String? goalNote,
  }) async {
    emit(const AddInitialMeasurementDataState.loading());

    final Either<String, Unit> measurementResult;
    if (measurement.id == null) {
      measurementResult = await measurementRepository.createMeasurement(
        measurement: measurement,
      );
    } else {
      measurementResult = await measurementRepository.updateMeasurement(
        measurement: measurement,
      );
    }

    final shouldContinue = measurementResult.fold((failure) {
      emit(AddInitialMeasurementDataState.failure(failure));
      return false;
    }, (_) => true);

    if (!shouldContinue) {
      return;
    }

    final goal = GoalEntity(
      targetId: measurement.targetId,
      targetValue: targetValue,
      startDate: measurement.date,
      dueDate: dueDate,
      notes: goalNote,
      userId: measurement.userId,
    );

    final goalResult = await goalsRepository.createOrReplaceActiveGoal(
      goal: goal,
    );

    goalResult.fold(
      (failure) => emit(
        AddInitialMeasurementDataState.failure(
          failure.isEmpty
              ? 'Measurement saved, but failed to save goal'
              : 'Measurement saved, but failed to save goal: $failure',
        ),
      ),
      (_) => emit(const AddInitialMeasurementDataState.success()),
    );
  }
}
