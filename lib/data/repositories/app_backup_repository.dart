import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
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
  static const String _packageKindKey =
      'packageKind'; // 'complete', 'measurements', 'pictures'

  Future<Either<String, String>> backupDatabase() {
    return measurementRepository.backupDatabase();
  }

  Future<Either<String, RestoreSummary>> restoreDatabase({
    bool merge = false,
    required String stringifiedDatas,
  }) {
    return measurementRepository.restoreDatabase(
      merge: merge,
      stringifiedDatas: stringifiedDatas,
    );
  }

  Future<Either<String, String>> backupFullApp({
    bool storeExternally = true,
  }) async {
    Directory? tempRootDir;

    try {
      final formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
      final timestamp = formatter.format(DateTime.now());

      final measurementResult = await backupDatabase();
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
          'packageKind': 'complete',
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

  Future<Either<String, String>> backupPicturesOnly({
    bool storeExternally = true,
  }) async {
    try {
      final formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
      final timestamp = formatter.format(DateTime.now());

      final outputRoot = storeExternally
          ? await ExternalPath.getExternalStoragePublicDirectory(
              ExternalPath.DIRECTORY_DOCUMENTS,
            )
          : (await getApplicationSupportDirectory()).path;

      final outputFile = File(
        '$outputRoot/watchbody/wb_pictures_only_$timestamp.zip',
      );
      await outputFile.create(recursive: true);

      final result = await bodyPictureRepository.createPicturesOnlyArchive(
        outputZipPath: outputFile.path,
      );

      if (result.isLeft()) {
        return Left(
          result.swap().getOrElse(() => 'Pictures-only backup failed'),
        );
      }

      return Right(outputFile.path);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> exportMeasurementsCsv({
    bool storeExternally = true,
  }) async {
    try {
      final formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
      final timestamp = formatter.format(DateTime.now());

      final measurementResult = await backupDatabase();
      final measurementJson = measurementResult.fold((l) => null, (r) => r);
      if (measurementJson == null) {
        return Left(
          measurementResult.swap().getOrElse(
            () => 'Measurements export failed',
          ),
        );
      }

      final decoded = jsonDecode(measurementJson);
      if (decoded is! Map<String, dynamic>) {
        return Left('Invalid measurements payload');
      }

      final tables = decoded['tables'] as Map<String, dynamic>?;
      if (tables == null) {
        return Left('No tables present in measurements payload');
      }

      final measurements = tables["measurementsData"] as List<dynamic>?;
      if (measurements == null || measurements.isEmpty) {
        return Left('No measurement rows available for export');
      }

      final headers = (measurements.first as Map<String, dynamic>).keys
          .toList();

      final csvBuffer = StringBuffer();
      csvBuffer.writeln(headers.join(','));
      for (final row in measurements) {
        final values = headers
            .map((h) {
              final v = (row as Map<String, dynamic>)[h];
              if (v == null) return '';
              final s = v.toString().replaceAll('"', '""');
              if (s.contains(',') || s.contains('"') || s.contains('\n')) {
                return '"$s"';
              }
              return s;
            })
            .join(',');
        csvBuffer.writeln(values);
      }

      final outputRoot = storeExternally
          ? await ExternalPath.getExternalStoragePublicDirectory(
              ExternalPath.DIRECTORY_DOCUMENTS,
            )
          : (await getApplicationSupportDirectory()).path;

      final outputFile = File(
        '$outputRoot/watchbody/wb_measurements_$timestamp.csv',
      );
      await outputFile.create(recursive: true);
      await outputFile.writeAsString(csvBuffer.toString());

      return Right(outputFile.path);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> exportMeasurementsPdf({
    bool storeExternally = true,
  }) async {
    try {
      final formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
      final timestamp = formatter.format(DateTime.now());

      final measurementResult = await backupDatabase();
      final measurementJson = measurementResult.fold((l) => null, (r) => r);
      if (measurementJson == null) {
        return Left(
          measurementResult.swap().getOrElse(
            () => 'Measurements PDF export failed',
          ),
        );
      }

      final decoded = jsonDecode(measurementJson);
      if (decoded is! Map<String, dynamic>) {
        return Left('Invalid measurements payload');
      }

      final tables = decoded['tables'] as Map<String, dynamic>?;
      if (tables == null) {
        return Left('No tables present in measurements payload');
      }

      final measurements = tables["measurementsData"] as List<dynamic>?;
      if (measurements == null || measurements.isEmpty) {
        return Left('No measurement rows available for PDF export');
      }

      final headers = (measurements.first as Map<String, dynamic>).keys
          .toList();
      final data = measurements.map((row) {
        return headers
            .map((h) => (row as Map<String, dynamic>)[h]?.toString() ?? '')
            .toList();
      }).toList();

      final doc = pw.Document();
      doc.addPage(
        pw.MultiPage(
          build: (context) => [
            pw.Header(level: 0, child: pw.Text('Measurements Export')),
            pw.Text('Export generated at: ${DateTime.now().toIso8601String()}'),
            pw.SizedBox(height: 12),
            pw.Table.fromTextArray(headers: headers, data: data),
          ],
        ),
      );

      final outputRoot = storeExternally
          ? await ExternalPath.getExternalStoragePublicDirectory(
              ExternalPath.DIRECTORY_DOCUMENTS,
            )
          : (await getApplicationSupportDirectory()).path;

      final outputFile = File(
        '$outputRoot/watchbody/wb_measurements_$timestamp.pdf',
      );
      await outputFile.create(recursive: true);
      final bytes = await doc.save();
      await outputFile.writeAsBytes(bytes);

      return Right(outputFile.path);
    } catch (e) {
      return Left(e.toString());
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

      final packageKind = manifest['packageKind'] as String?;
      if (packageKind != 'complete') {
        return Left(
          'Invalid package type. Expected "complete" backup, got "$packageKind".',
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

      final measurementRestoreResult = await restoreDatabase(
        stringifiedDatas: measurementsJson,
        merge: merge,
      );
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

  /// Identify and validate the type of backup package
  /// Returns: 'complete', 'measurements', or 'pictures'
  Future<Either<String, String>> identifyBackupType({
    required String backupPath,
  }) async {
    try {
      final file = File(backupPath);
      if (!file.existsSync()) {
        return Left('Backup file not found at: $backupPath');
      }

      final isZip = backupPath.toLowerCase().endsWith('.zip');
      final isJson = backupPath.toLowerCase().endsWith('.json');

      if (!isZip && !isJson) {
        return Left('Invalid backup file format. Expected .zip or .json');
      }

      if (isJson) {
        // Could be measurements-only or legacy full backup as JSON
        try {
          final content = await file.readAsString();
          final decoded = jsonDecode(content);
          if (decoded is! Map<String, dynamic>) {
            return Left('Invalid backup JSON format');
          }
          return Right('measurements'); // Treat JSON as measurements
        } catch (e) {
          return Left('Failed to parse backup JSON: $e');
        }
      }

      // For .zip files, check the manifest
      Directory? extractDir;
      try {
        final tempParent = await getTemporaryDirectory();
        extractDir = Directory(
          '${tempParent.path}/watchbody_identify_${DateTime.now().millisecondsSinceEpoch}',
        );
        await extractDir.create(recursive: true);

        await ZipFile.extractToDirectory(
          zipFile: file,
          destinationDir: extractDir,
        );

        final manifestFile = File('${extractDir.path}/manifest.json');
        if (!manifestFile.existsSync()) {
          // Legacy pictures-only or unknown format
          return Right('pictures');
        }

        final manifestContent = await manifestFile.readAsString();
        final manifest = jsonDecode(manifestContent);

        if (manifest is! Map<String, dynamic>) {
          return Left('Invalid manifest format in backup');
        }

        final packageKind = manifest['packageKind'] as String;
        if (packageKind == 'complete' ||
            packageKind == 'measurements' ||
            packageKind == 'pictures') {
          return Right(packageKind);
        }

        // Default based on files present
        final hasImages = File('${extractDir.path}/images').existsSync();
        final hasMetadata = File(
          '${extractDir.path}/metadata.json',
        ).existsSync();

        if (hasImages && hasMetadata) {
          return Right('pictures');
        } else if (manifestFile.existsSync()) {
          return Right('complete');
        }

        return Left('Unable to determine backup type');
      } finally {
        if (extractDir != null && extractDir.existsSync()) {
          await extractDir.delete(recursive: true);
        }
      }
    } catch (e) {
      return Left('Error identifying backup type: $e');
    }
  }
}
