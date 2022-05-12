import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';

import '../../presentation/overview/bloc/getallwidgetsdata_bloc_test.mocks.dart';

@GenerateMocks([DatabaseService])
void main() {
  late DatabaseService databaseService;

  setUp(() {
    databaseService = MockDatabaseService();
  });
  group('Widget Repository Test', () {
    const tableName = 'widget_table';
    const map = <String, dynamic>{'test': 'tets'};
    test(
      'insert into DB Success',
      () async {
        when(
          databaseService.insert(
            tableName: tableName,
            map: map,
          ),
        ).thenAnswer(
          (_) async {},
        );

        expect(
          databaseService.insert(
            tableName: tableName,
            map: map,
          ),
          isA<Future<void>>(),
        );
      },
      skip: true,
    );
    test(
      'insert into DB Failure',
      () async {
        when(
          databaseService.insert(
            tableName: tableName,
            map: map,
          ),
          // ).thenThrow(Exception());
        ).thenAnswer(
          (_) async {
            return Future.error('error');
          },
        );

        try {
          await databaseService.insert(
            tableName: tableName,
            map: map,
          );
        } catch (e) {
          expect(e, isA<String>());
        }
      },
      // skip: true,
    );
  });
}
