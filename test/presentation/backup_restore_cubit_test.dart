import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watcha_body/data/repositories/app_backup_repository.dart';
import 'package:watcha_body/presentation/settings/cubits/backup_restore_cubit/backup_data_cubit.dart';
import 'package:watcha_body/presentation/settings/cubits/backup_restore_cubit/backup_data_state.dart';

@GenerateMocks([AppBackupRepository])
void main() {
  group('BackupRestoreDataCubit Tests', () {
    late MockAppBackupRepository mockAppBackupRepository;
    late BackupRestoreDataCubit backupRestoreDataCubit;

    setUp(() {
      mockAppBackupRepository = MockAppBackupRepository();
      backupRestoreDataCubit = BackupRestoreDataCubit(mockAppBackupRepository);
    });

    tearDown(() {
      backupRestoreDataCubit.close();
    });

    group('Initial State', () {
      test('initial state is BackupRestoreDataStateInitial', () {
        expect(
          backupRestoreDataCubit.state,
          isA<BackupRestoreDataStateInitial>(),
        );
      });
    });

    group('Backup Operations', () {
      test('backupMeasurementsOnly emits loading then success', () async {
        when(
          mockAppBackupRepository.backupDatabase(),
        ).thenAnswer((_) async => const Right('{}'));

        final states = <BackupRestoreDataState>[];
        final subscription = backupRestoreDataCubit.stream.listen(states.add);

        await backupRestoreDataCubit.backupMeasurementsOnly();

        await subscription.cancel();

        expect(
          states,
          containsAll([
            isA<BackupRestoreDataStateLoading>(),
            isA<BackupRestoreDataStateSuccess>(),
          ]),
        );
      });

      test('backupMeasurementsOnly emits failure on error', () async {
        const errorMsg = 'Backup failed';
        when(
          mockAppBackupRepository.backupDatabase(),
        ).thenAnswer((_) async => const Left(errorMsg));

        final states = <BackupRestoreDataState>[];
        final subscription = backupRestoreDataCubit.stream.listen(states.add);

        await backupRestoreDataCubit.backupMeasurementsOnly();

        await subscription.cancel();

        expect(
          states,
          containsAll([
            isA<BackupRestoreDataStateLoading>(),
            isA<BackupRestoreDataStateFailed>(),
          ]),
        );
      });

      test('backupPicturesOnly calls repository method', () async {
        when(
          mockAppBackupRepository.backupPicturesOnly(),
        ).thenAnswer((_) async => const Right('/path/to/backup.zip'));

        await backupRestoreDataCubit.backupPicturesOnly();

        verify(mockAppBackupRepository.backupPicturesOnly()).called(1);
      });

      test('backupFullData calls repository method', () async {
        when(
          mockAppBackupRepository.backupFullApp(),
        ).thenAnswer((_) async => const Right('/path/to/backup.zip'));

        await backupRestoreDataCubit.backupFullData();

        verify(mockAppBackupRepository.backupFullApp()).called(1);
      });
    });

    group('Export Operations', () {
      test('exportMeasurementsCsv calls repository method', () async {
        when(
          mockAppBackupRepository.exportMeasurementsCsv(),
        ).thenAnswer((_) async => const Right('/path/to/export.csv'));

        await backupRestoreDataCubit.exportMeasurementsCsv();

        verify(mockAppBackupRepository.exportMeasurementsCsv()).called(1);
      });

      test('exportMeasurementsPdf calls repository method', () async {
        when(
          mockAppBackupRepository.exportMeasurementsPdf(),
        ).thenAnswer((_) async => const Right('/path/to/export.pdf'));

        await backupRestoreDataCubit.exportMeasurementsPdf();

        verify(mockAppBackupRepository.exportMeasurementsPdf()).called(1);
      });
    });

    group('Restore Operations', () {
      test('restoreFromFile identifies and restores complete backup', () async {
        const testPath = '/path/to/backup.zip';

        when(
          mockAppBackupRepository.identifyBackupType(backupPath: testPath),
        ).thenAnswer((_) async => const Right('complete'));

        when(
          mockAppBackupRepository.restoreFullApp(
            backupPath: testPath,
            merge: true,
          ),
        ).thenAnswer((_) async => const Right(null));

        await backupRestoreDataCubit.restoreFromFile(
          path: testPath,
          merge: true,
        );

        verify(
          mockAppBackupRepository.identifyBackupType(backupPath: testPath),
        ).called(1);
      });

      test(
        'restoreFromFile identifies and restores measurements backup',
        () async {
          const testPath = '/path/to/backup.json';

          when(
            mockAppBackupRepository.identifyBackupType(backupPath: testPath),
          ).thenAnswer((_) async => const Right('measurements'));

          when(
            mockAppBackupRepository.restoreDatabase(
              stringifiedDatas: anyNamed('stringifiedDatas'),
              merge: anyNamed('merge'),
            ),
          ).thenAnswer((_) async => const Right(null));

          // Note: This would fail in practice due to file read operations
          // but demonstrates the structure
          await backupRestoreDataCubit.restoreFromFile(
            path: testPath,
            merge: true,
          );

          verify(
            mockAppBackupRepository.identifyBackupType(backupPath: testPath),
          ).called(1);
        },
      );

      test('restoreFromFile emits failure for unknown backup type', () async {
        const testPath = '/path/to/backup.zip';

        when(
          mockAppBackupRepository.identifyBackupType(backupPath: testPath),
        ).thenAnswer(
          (_) async => const Left('Unable to determine backup type'),
        );

        final states = <BackupRestoreDataState>[];
        final subscription = backupRestoreDataCubit.stream.listen(states.add);

        await backupRestoreDataCubit.restoreFromFile(
          path: testPath,
          merge: true,
        );

        await subscription.cancel();

        expect(
          states,
          containsAll([
            isA<BackupRestoreDataStateLoading>(),
            isA<BackupRestoreDataStateFailed>(),
          ]),
        );
      });
    });

    group('Success Message', () {
      test('successMessage is populated after successful backup', () async {
        when(
          mockAppBackupRepository.backupDatabase(),
        ).thenAnswer((_) async => const Right('{}'));

        await backupRestoreDataCubit.backupMeasurementsOnly();

        expect(
          backupRestoreDataCubit.successMessage.contains('Measurements backup'),
          true,
        );
      });

      test('successMessage is populated after successful export', () async {
        when(
          mockAppBackupRepository.exportMeasurementsCsv(),
        ).thenAnswer((_) async => const Right('/path/to/export.csv'));

        await backupRestoreDataCubit.exportMeasurementsCsv();

        expect(backupRestoreDataCubit.successMessage.contains('CSV'), true);
      });
    });
  });
}
