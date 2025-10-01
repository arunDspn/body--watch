part of 'get_all_muscle_groups_cubit.dart';

@freezed
abstract class GetAllMuscleGroupsState with _$GetAllMuscleGroupsState {
  const factory GetAllMuscleGroupsState.initial() = _Initial;

  // Loading state
  const factory GetAllMuscleGroupsState.loading() = _Loading;
  // Failure state with error message
  const factory GetAllMuscleGroupsState.failure(String cause) = _Failure;
  // Success state with list of muscle groups
  const factory GetAllMuscleGroupsState.success(List<String> muscleGroups) =
      _Success;
}
