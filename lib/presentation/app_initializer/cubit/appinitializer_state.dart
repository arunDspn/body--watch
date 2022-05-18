part of 'appinitializer_cubit.dart';

@freezed
class AppinitializerState with _$AppinitializerState {
  const factory AppinitializerState.initial() = _Initial;
  const factory AppinitializerState.loading() = _Loading;
  const factory AppinitializerState.success({
    required AppPreferences appPreferences,
  }) = Success;
  const factory AppinitializerState.failed({
    required String cause,
  }) = Failed;
}
