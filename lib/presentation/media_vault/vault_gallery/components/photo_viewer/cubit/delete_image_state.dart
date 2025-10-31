part of 'delete_image_cubit.dart';

@freezed
sealed class DeleteImageState with _$DeleteImageState {
  const factory DeleteImageState.initial() = DeleteImageStateInitial;
  const factory DeleteImageState.loading() = DeleteImageStateLoading;
  const factory DeleteImageState.success({required int deletedItemId}) =
      DeleteImageStateSuccess;
  const factory DeleteImageState.failed(String message) =
      DeleteImageStateFailed;
}
