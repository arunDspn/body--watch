part of 'get_all_image_tags_cubit.dart';

@freezed
class GetAllImageTagsState with _$GetAllImageTagsState {
  const factory GetAllImageTagsState.initial() = _Initial;

  const factory GetAllImageTagsState.loading() = _Loading;

  const factory GetAllImageTagsState.loaded({
    required List<ImageTagModel> tags,
  }) = _Loaded;

  const factory GetAllImageTagsState.error({
    required String message,
  }) = _Error;
}
