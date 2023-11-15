

// @GenerateMocks([DatabaseService])
// void main() {
//   late DatabaseService databaseService;

//   setUp(() {
//     databaseService = MockDatabaseService();
//   });
//   group('Widget Repository Test', () {
//     const tableName = 'widget_table';
//     const map = <String, dynamic>{'test': 'tets'};
//     test(
//       'insert into DB Success',
//       () async {
//         when(
//           databaseService.insert(
//             dataTypeAndName: tableName,
//             map: map,
//           ),
//         ).thenAnswer(
//           (_) async {},
//         );

//         expect(
//           databaseService.insert(
//             dataTypeAndName: tableName,
//             map: map,
//           ),
//           isA<Future<void>>(),
//         );
//       },
//       skip: true,
//     );
//     test(
//       'insert into DB Failure',
//       () async {
//         when(
//           databaseService.insert(
//             dataTypeAndName: tableName,
//             map: map,
//           ),
//           // ).thenThrow(Exception());
//         ).thenAnswer(
//           (_) async {
//             return Future.error('error');
//           },
//         );

//         try {
//           await databaseService.insert(
//             dataTypeAndName: tableName,
//             map: map,
//           );
//         } catch (e) {
//           expect(e, isA<String>());
//         }
//       },
//       // skip: true,
//     );
//   });
// }
