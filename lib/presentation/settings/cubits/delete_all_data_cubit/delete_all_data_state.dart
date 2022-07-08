part of 'delete_all_data_cubit.dart';

@freezed
class DeleteAllDataState with _$DeleteAllDataState {
  const factory DeleteAllDataState.initial() = _Initial;
  const factory DeleteAllDataState.loading() = _Loading;
  const factory DeleteAllDataState.success() = _Success;
  const factory DeleteAllDataState.failed(String msg) = _Failed;
}
