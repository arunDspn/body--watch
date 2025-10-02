part of 'get_data_linked_cubit.dart';

@freezed
sealed class GetDataLinkedState with _$GetDataLinkedState {
  const factory GetDataLinkedState.initial() = GetDataLinkedStateInitial;
  const factory GetDataLinkedState.loading() = GetDataLinkedStateLoading;
  const factory GetDataLinkedState.loaded({
    required List<MeasurementEntity> dataLinked,
  }) = GetDataLinkedStateLoaded;
  const factory GetDataLinkedState.error({
    required String message,
  }) = GetDataLinkedStateError;
}
