part of 'add_new_media_cubit.dart';

@freezed
sealed class AddNewMediaState with _$AddNewMediaState {
  const factory AddNewMediaState.initial() = AddNewMediaStateInitial;
  // Loading
  const factory AddNewMediaState.loading() = AddNewMediaStateLoading;
  // Success
  const factory AddNewMediaState.success({
    required VaultImageModel savedImage,
  }) = AddNewMediaStateSuccess;
  // Failure
  const factory AddNewMediaState.failure(String failure) =
      AddNewMediaStateFailure;
}
