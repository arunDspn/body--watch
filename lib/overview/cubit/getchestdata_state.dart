part of 'getchestdata_cubit.dart';

@freezed
class GetchestdataState with _$GetchestdataState {
  const factory GetchestdataState.initial() = _Initial;
  const factory GetchestdataState.loading() = _Loading;
  const factory GetchestdataState.failure(String casue) = _Failure;
  const factory GetchestdataState.success(List<Chest> list) = _Success;
}
