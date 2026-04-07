import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:external_path/external_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:watcha_body/data/repositories/app_backup_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

part 'backup_data_state.dart';
part 'backup_data_cubit.freezed.dart';

class BackupRestoreDataCubit extends Cubit<BackupRestoreDataState> {
  BackupRestoreDataCubit(this.measurementRepository, this.appBackupRepository)
    : super(const BackupRestoreDataState.initial());

  final MeasurementRepository measurementRepository;
  final AppBackupRepository appBackupRepository;
  String _successMessage = 'Success';

  String get successMessage => _successMessage;

  Future<void> backupData() async {
    emit(const BackupRestoreDataState.loading());

    final result = await measurementRepository.backupDatabase();

    await result.fold(
      (l) {
        emit(BackupRestoreDataState.failed(l));
      },
      (data) async {
        try {
          if (!await Permission.manageExternalStorage.status.isGranted) {
            if (await Permission.manageExternalStorage.request().isGranted) {
              await _writeJson(data);
            } else {
              emit(const BackupRestoreDataState.failed('Permission Scene'));
            }
          } else {
            await _writeJson(data);
          }
        } catch (e) {
          emit(BackupRestoreDataState.failed(e.toString()));
        }
      },
    );
  }

  Future<void> backupFullData() async {
    emit(const BackupRestoreDataState.loading());

    try {
      if (!await Permission.manageExternalStorage.status.isGranted) {
        if (!await Permission.manageExternalStorage.request().isGranted) {
          emit(const BackupRestoreDataState.failed('Permission Scene'));
          return;
        }
      }

      final result = await appBackupRepository.backupFullApp();
      result.fold((l) => emit(BackupRestoreDataState.failed(l)), (path) {
        _successMessage = 'Full backup created\nPath: $path';
        emit(const BackupRestoreDataState.success());
      });
    } catch (e) {
      emit(BackupRestoreDataState.failed(e.toString()));
    }
  }

  Future<void> _writeJson(String data) async {
    try {
      final saveDir = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS,
      );

      final formatter = DateFormat('dd_mm_yyyy_hh_mm_ss');
      final file = await File(
        '$saveDir/watchbody/wb_backup_${formatter.format(DateTime.now())}.json',
      ).create(recursive: true);

      await file.writeAsString(data);
      _successMessage = 'Measurements backup created\nPath: ${file.path}';
      emit(const BackupRestoreDataState.success());
    } catch (e) {
      emit(BackupRestoreDataState.failed(e.toString()));
    }
  }

  Future<void> restoreData({required String path, bool merge = true}) async {
    emit(const BackupRestoreDataState.loading());

    final data = await File(path).readAsString();
    final result = await measurementRepository.restoreDatabase(
      stringifiedDatas: data,
      merge: merge,
    );

    await result.fold(
      (l) {
        emit(BackupRestoreDataState.failed(l));
      },
      (summary) async {
        _successMessage = summary.toUserMessage();
        emit(const BackupRestoreDataState.success());
      },
    );
  }

  Future<void> restoreFullData({
    required String path,
    bool merge = true,
  }) async {
    emit(const BackupRestoreDataState.loading());

    final result = await appBackupRepository.restoreFullApp(
      backupPath: path,
      merge: merge,
    );

    await result.fold(
      (l) {
        emit(BackupRestoreDataState.failed(l));
      },
      (summary) async {
        _successMessage = summary.toUserMessage();
        emit(const BackupRestoreDataState.success());
      },
    );
  }

  Future<void> shareDatabase({bool isIos = false}) async {
    emit(const BackupRestoreDataState.loading());
    final result = await measurementRepository.backupDatabase();

    await result.fold(
      (l) {
        emit(BackupRestoreDataState.failed(l));
      },
      (data) async {
        try {
          if (!await _checkPermission(isIos).isGranted) {
            final st = await _requestPermission(isIos);
            if (st.isGranted) {
              final dataFile = await _writeCacheJson(data);
              await _shareFile(dataFile);
            } else {
              emit(const BackupRestoreDataState.failed('Permission Scene'));
            }
          } else {
            final dataFile = await _writeCacheJson(data);
            await _shareFile(dataFile);
          }
        } catch (e) {
          emit(BackupRestoreDataState.failed(e.toString()));
        }
      },
    );
  }

  Future<void> shareFullBackup({bool isIos = false}) async {
    emit(const BackupRestoreDataState.loading());

    try {
      if (!await _checkPermission(isIos).isGranted) {
        final st = await _requestPermission(isIos);
        if (!st.isGranted) {
          emit(const BackupRestoreDataState.failed('Permission Scene'));
          return;
        }
      }

      final result = await appBackupRepository.backupFullApp(
        storeExternally: false,
      );

      await result.fold(
        (l) {
          emit(BackupRestoreDataState.failed(l));
        },
        (path) async {
          await _shareFile(File(path));
          _successMessage = 'Full backup shared\nPath: $path';
          emit(const BackupRestoreDataState.success());
        },
      );
    } catch (e) {
      emit(BackupRestoreDataState.failed(e.toString()));
    }
  }

  Future<PermissionStatus> _checkPermission(bool ios) async {
    if (ios) {
      return Permission.mediaLibrary.status;
    } else {
      return Permission.storage.status;
    }
  }

  Future<PermissionStatus> _requestPermission(bool ios) async {
    if (ios) {
      return Permission.mediaLibrary.request();
    } else {
      return Permission.storage.request();
    }
  }

  Future<void> _shareFile(File file) async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: 'Watcha Body Backup',
          subject: 'Watcha Body Backup Data',
          sharePositionOrigin: const Rect.fromLTWH(0, 0, 100, 100),
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<File> _writeCacheJson(String data) async {
    try {
      final saveDir = await getApplicationSupportDirectory();
      final formatter = DateFormat('dd_mm_yyyy_hh_mm_ss');

      await Directory('${saveDir.path}/watchbody').exists().then((exists) {
        if (exists) {
          Directory('${saveDir.path}/watchbody').delete(recursive: true);
        }
      });

      final file = await File(
        '${saveDir.path}/watchbody/wb_backup_${formatter.format(DateTime.now())}.json',
      ).create(recursive: true);

      await file.writeAsString(data);
      return file;
    } catch (e) {
      return Future<File>.error(e);
    }
  }
}
