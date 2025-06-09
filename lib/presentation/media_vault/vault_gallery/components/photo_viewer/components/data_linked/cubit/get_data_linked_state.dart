part of 'get_data_linked_cubit.dart';

@freezed
abstract class GetDataLinkedState with _$GetDataLinkedState {
  const factory GetDataLinkedState.initial() = _Initial;
  const factory GetDataLinkedState.loading() = _Loading;
  const factory GetDataLinkedState.loaded({
    required List<Measurement> dataLinked,
  }) = _Loaded;
  const factory GetDataLinkedState.error({
    required String message,
  }) = _Error;
}
