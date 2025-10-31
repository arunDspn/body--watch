part of 'add_new_image_tag_cubit.dart';

@freezed
class AddNewImageTagState with _$AddNewImageTagState {
  const factory AddNewImageTagState.initial() = _Initial;

  const factory AddNewImageTagState.loading() = _Loading;

  const factory AddNewImageTagState.success({
    required ImageTagModel tag,
  }) = _Success;

  const factory AddNewImageTagState.error({required String message}) = _Error;
}
