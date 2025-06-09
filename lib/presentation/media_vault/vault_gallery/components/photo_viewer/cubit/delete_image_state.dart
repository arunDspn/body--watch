part of 'delete_image_cubit.dart';

@freezed
abstract class DeleteImageState with _$DeleteImageState {
  const factory DeleteImageState.initial() = _Initial;
  const factory DeleteImageState.loading() = _Loading;
  const factory DeleteImageState.success({required String deletedItemId}) =
      _Success;
  const factory DeleteImageState.failed(String message) = _Failed;
}
