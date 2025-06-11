part of 'backup_data_cubit.dart';

@freezed
sealed class BackupRestoreDataState with _$BackupRestoreDataState {
  const factory BackupRestoreDataState.initial() =
      BackupRestoreDataStateInitial;
  const factory BackupRestoreDataState.success() =
      BackupRestoreDataStateSuccess;
  const factory BackupRestoreDataState.loading() =
      BackupRestoreDataStateLoading;
  const factory BackupRestoreDataState.failed(String msg) =
      BackupRestoreDataStateFailed;
}
