part of 'back_up_pictures_to_zip_cubit.dart';

@freezed
sealed class BackUpPicturesToZipState with _$BackUpPicturesToZipState {
  const factory BackUpPicturesToZipState.initial() =
      BackUpPicturesToZipStateInitial;
  const factory BackUpPicturesToZipState.loading() =
      BackUpPicturesToZipStateLoading;
  const factory BackUpPicturesToZipState.success(String path) =
      BackUpPicturesToZipStateSuccess;
  const factory BackUpPicturesToZipState.failure(String message) =
      BackUpPicturesToZipStateFailure;
}
