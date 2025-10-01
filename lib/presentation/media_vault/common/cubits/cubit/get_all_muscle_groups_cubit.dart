import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/measurement/i_measurements.dart';

part 'get_all_muscle_groups_state.dart';
part 'get_all_muscle_groups_cubit.freezed.dart';

class GetAllMuscleGroupsCubit extends Cubit<GetAllMuscleGroupsState> {
  GetAllMuscleGroupsCubit(
    this.measurementsFacade,
  ) : super(const GetAllMuscleGroupsState.initial());

  final IMeasurementsFacade measurementsFacade;

  /// Fetch all muscle groups
  Future<void> fetchAllMuscleGroups() async {
    emit(const GetAllMuscleGroupsState.loading());

    final result = await measurementsFacade.getAllMeasurementItems();

    result.fold(
      (failure) => emit(GetAllMuscleGroupsState.failure(failure)),
      (muscleGroups) => emit(GetAllMuscleGroupsState.success(muscleGroups)),
    );
  }
}
