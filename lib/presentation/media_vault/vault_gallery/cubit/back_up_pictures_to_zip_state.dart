part of 'back_up_pictures_to_zip_cubit.dart';

@freezed
class BackUpPicturesToZipState with _$BackUpPicturesToZipState {
  const factory BackUpPicturesToZipState.initial() = _Initial;
  const factory BackUpPicturesToZipState.loading() = _Loading;
  const factory BackUpPicturesToZipState.success(String path) = _Success;
  const factory BackUpPicturesToZipState.failure(String message) = _Failure;
}
