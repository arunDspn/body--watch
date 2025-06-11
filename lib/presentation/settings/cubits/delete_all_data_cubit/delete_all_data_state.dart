part of 'delete_all_data_cubit.dart';

@freezed
sealed class DeleteAllDataState with _$DeleteAllDataState {
  const factory DeleteAllDataState.initial() = DeleteAllDataStateInitial;
  const factory DeleteAllDataState.loading() = DeleteAllDataStateLoading;
  const factory DeleteAllDataState.success() = DeleteAllDataStateSuccess;
  const factory DeleteAllDataState.failed(String msg) =
      DeleteAllDataStateFailed;
}
