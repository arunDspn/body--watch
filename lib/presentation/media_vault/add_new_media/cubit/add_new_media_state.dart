part of 'add_new_media_cubit.dart';

@freezed
abstract class AddNewMediaState with _$AddNewMediaState {
  const factory AddNewMediaState.initial() = _Initial;
  // Loading
  const factory AddNewMediaState.loading() = _Loading;
  // Success
  const factory AddNewMediaState.success({required VaultImage savedImage}) =
      _Success;
  // Failure
  const factory AddNewMediaState.failure(String failure) = _Failure;
}
