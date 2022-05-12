part of 'adddata_cubit.dart';

@freezed
class AdddataState with _$AdddataState {
  const factory AdddataState.initial() = _Initial;
  const factory AdddataState.loading() = _Loading;
  const factory AdddataState.failure(String message) = _Failure;
  const factory AdddataState.success() = _Success;
}
