part of 'backup_data_cubit.dart';

@freezed
class BackupRestoreDataState with _$BackupRestoreDataState {
  const factory BackupRestoreDataState.initial() = _Initial;
  const factory BackupRestoreDataState.success() = _Success;
  const factory BackupRestoreDataState.loading() = _Loading;
  const factory BackupRestoreDataState.failed(String msg) = _Failed;
}
