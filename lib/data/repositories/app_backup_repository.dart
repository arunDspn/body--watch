import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/domain/models/restore_summary.dart';

class AppBackupRepository {
  AppBackupRepository({
    required this.measurementRepository,
    required this.bodyPictureRepository,
  });

  final MeasurementRepository measurementRepository;
  final BodyPictureRepository bodyPictureRepository;

  static const String _backupFormat = 'watcha_body.full_backup.v1';
  static const int _backupSchemaVersion = 1;

  Future<Either<String, String>> backupFullApp({
    bool storeExternally = true,
  }) async {
    Directory? tempRootDir;

    try {
      final formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
      final timestamp = formatter.format(DateTime.now());

      final measurementResult = await measurementRepository.backupDatabase();
      final measurementJson = measurementResult.fold((l) => null, (r) => r);
      if (measurementJson == null) {
        return Left(measurementResult.swap().getOrElse(() => 'Backup failed'));
      }

      final tempParent = await getTemporaryDirectory();
      tempRootDir = Directory(
        '${tempParent.path}/watchbody_full_backup_$timestamp',
      );
      await tempRootDir.create(recursive: true);

      final measurementsFile = File('${tempRootDir.path}/measurements.json');
      await measurementsFile.writeAsString(measurementJson);

      final picturesZipFile = File('${tempRootDir.path}/pictures.zip');
      final picturesResult = await bodyPictureRepository
          .createPicturesBackupArchive(outputZipPath: picturesZipFile.path);
      if (picturesResult.isLeft()) {
        return Left(
          picturesResult.swap().getOrElse(() => 'Pictures backup failed'),
        );
      }

      final manifestFile = File('${tempRootDir.path}/manifest.json');
      await manifestFile.writeAsString(
        const JsonEncoder.withIndent('  ').convert({
          'format': _backupFormat,
          'schemaVersion': _backupSchemaVersion,
          'createdAt': DateTime.now().toIso8601String(),
          'parts': ['measurements.json', 'pictures.zip'],
        }),
      );

      final outputRoot = storeExternally
          ? await ExternalPath.getExternalStoragePublicDirectory(
              ExternalPath.DIRECTORY_DOCUMENTS,
            )
          : (await getApplicationSupportDirectory()).path;

      final outputFile = File(
        '$outputRoot/watchbody/wb_full_backup_$timestamp.zip',
      );
      await outputFile.create(recursive: true);

      await ZipFile.createFromDirectory(
        sourceDir: tempRootDir,
        zipFile: outputFile,
        recurseSubDirs: true,
      );

      return Right(outputFile.path);
    } catch (e) {
      return Left(e.toString());
    } finally {
      if (tempRootDir != null && tempRootDir.existsSync()) {
        await tempRootDir.delete(recursive: true);
      }
    }
  }

  Future<Either<String, RestoreSummary>> restoreFullApp({
    required String backupPath,
    bool merge = true,
  }) async {
    Directory? extractDir;

    try {
      final archive = File(backupPath);
      if (!archive.existsSync()) {
        return Left('Backup file not found at: $backupPath');
      }

      final tempParent = await getTemporaryDirectory();
      extractDir = Directory(
        '${tempParent.path}/watchbody_full_restore_${DateTime.now().millisecondsSinceEpoch}',
      );
      await extractDir.create(recursive: true);

      await ZipFile.extractToDirectory(
        zipFile: archive,
        destinationDir: extractDir,
      );

      final manifestFile = File('${extractDir.path}/manifest.json');
      final measurementsFile = File('${extractDir.path}/measurements.json');
      final picturesFile = File('${extractDir.path}/pictures.zip');

      if (!manifestFile.existsSync() ||
          !measurementsFile.existsSync() ||
          !picturesFile.existsSync()) {
        return const Left('Invalid full backup package.');
      }

      final manifest = jsonDecode(await manifestFile.readAsString());
      if (manifest is! Map<String, dynamic>) {
        return const Left('Invalid full backup manifest.');
      }

      if (manifest['format'] != _backupFormat) {
        return Left('Unsupported full backup format: ${manifest['format']}');
      }

      if (manifest['schemaVersion'] != _backupSchemaVersion) {
        return Left(
          'Unsupported full backup schema version: ${manifest['schemaVersion']}',
        );
      }

      final measurementsJson = await measurementsFile.readAsString();
      final parsedMeasurementJson = jsonDecode(measurementsJson);
      if (parsedMeasurementJson is! Map<String, dynamic>) {
        return const Left('Invalid measurements payload in full backup.');
      }

      final pictureRestoreResult = await bodyPictureRepository
          .restorePhotosFromZip(zipPath: picturesFile.path, merge: merge);
      if (pictureRestoreResult.isLeft()) {
        return Left(
          pictureRestoreResult.swap().getOrElse(
            () => 'Pictures restore failed',
          ),
        );
      }

      final measurementRestoreResult = await measurementRepository
          .restoreDatabase(stringifiedDatas: measurementsJson, merge: merge);
      if (measurementRestoreResult.isLeft()) {
        return Left(
          measurementRestoreResult.swap().getOrElse(
            () => 'Measurements restore failed',
          ),
        );
      }

      return right(
        RestoreSummary(
          scope: 'full app',
          merge: merge,
          sections: [
            pictureRestoreResult.getOrElse(
              () => const RestoreSummary(scope: 'pictures', merge: true),
            ),
            measurementRestoreResult.getOrElse(
              () => const RestoreSummary(scope: 'measurements', merge: true),
            ),
          ],
        ),
      );
    } catch (e) {
      return Left(e.toString());
    } finally {
      if (extractDir != null && extractDir.existsSync()) {
        await extractDir.delete(recursive: true);
      }
    }
  }
}
