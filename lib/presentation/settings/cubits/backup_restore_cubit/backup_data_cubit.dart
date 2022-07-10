import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

part 'backup_data_state.dart';
part 'backup_data_cubit.freezed.dart';

class BackupRestoreDataCubit extends Cubit<BackupRestoreDataState> {
  BackupRestoreDataCubit(this.measurementRepository)
      : super(const BackupRestoreDataState.initial());
  final MeasurementRepository measurementRepository;

  Future<void> backupData() async {
    emit(const BackupRestoreDataState.loading());

    final _result = await measurementRepository.backupDatabase();

    await _result.fold(
      (l) {
        emit(BackupRestoreDataState.failed(l));
      },
      (data) async {
        try {
          // Permission Status
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

  Future<void> _writeJson(String data) async {
    try {
      final _saveDir = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS,
      );

      final formatter = DateFormat('dd_mm_yyyy_hh_mm_ss');

      final _file = await File(
        '$_saveDir/watchbody/wb_backup_${formatter.format(DateTime.now())}.json',
      ).create(recursive: true);

      await _file.writeAsString(data);
      emit(const BackupRestoreDataState.success());
    } catch (e) {
      emit(BackupRestoreDataState.failed(e.toString()));
    }
  }

  Future<void> restoreData({
    required String path,
    bool merge = true,
  }) async {
    emit(const BackupRestoreDataState.loading());

    final _data = await File(path).readAsString();

    final _result = await measurementRepository.restoreDatabase(
      stringifiedDatas: _data,
      merge: merge,
    );

    await _result.fold(
      (l) {
        emit(BackupRestoreDataState.failed(l));
      },
      (data) async {
        emit(const BackupRestoreDataState.success());
      },
    );
  }

  Future<void> shareDatabase({bool isIos = false}) async {
    emit(const BackupRestoreDataState.loading());
    final _result = await measurementRepository.backupDatabase();

    await _result.fold(
      (l) {
        emit(BackupRestoreDataState.failed(l));
      },
      (data) async {
        try {
          // Permission Status
          if (!await _checkPermission(isIos).isGranted) {
            final st = await _requestPermission(isIos);
            if (st.isGranted) {
              final _dataFile = await _writeCacheJson(data);
              await _shareFile(_dataFile);
            } else {
              emit(const BackupRestoreDataState.failed('Permission Scene'));
            }
          } else {
            final _dataFile = await _writeCacheJson(data);
            await _shareFile(_dataFile);
          }
        } catch (e) {
          emit(BackupRestoreDataState.failed(e.toString()));
        }
      },
    );
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
      await Share.shareFiles([file.path]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<File> _writeCacheJson(String data) async {
    // internal docs dir
    // rm old files
    try {
      final _saveDir = await getApplicationSupportDirectory();

      final formatter = DateFormat('dd_mm_yyyy_hh_mm_ss');

      Directory('${_saveDir.path}/watchbody').exists().then((exists) {
        if (exists) {
          Directory('${_saveDir.path}/watchbody').delete(recursive: true);
        }
      });

      final _file = await File(
        '${_saveDir.path}/watchbody/wb_backup_${formatter.format(DateTime.now())}.json',
      ).create(recursive: true);

      await _file.writeAsString(data);
      return _file;
    } catch (e) {
      return Future<File>.error(e);
    }
  }
}
