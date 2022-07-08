import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
        // Permission Status
        final status = await Permission.storage.status;

        if (!status.isGranted) {
          await Permission.storage.request().then((value) {
            if (value.isGranted) {
              _writeJson(data);
            } else {
              emit(const BackupRestoreDataState.failed('Permission Scene'));
            }
          });
        } else {
          await _writeJson(data);
        }
      },
    );
  }

  Future<void> _writeJson(String data) async {
    try {
      final _saveDir = await getExternalStorageDirectory();

      final _file = await File(
        '${_saveDir!.path}/watchbody${DateTime.now().toIso8601String()}.json',
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
}
