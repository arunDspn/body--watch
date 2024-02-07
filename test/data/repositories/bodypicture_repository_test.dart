// // import 'package:flutter_test/flutter_test.dart';

// // void main() {
// //   testWidgets('bodypicture repository ...', (tester) async {
// //     // TODO: Implement test
// //   });
// // }

// import 'package:flutter_test/flutter_test.dart';
// import 'package:watcha_body/data/data_layer/database_service.dart';
// import 'package:watcha_body/data/domain/i_bodypicture_facade.dart';
// import 'package:watcha_body/data/domain/models/vault_image_model.dart';
// import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

// void main() {
//   group('BodyPictureRepository', () {
//     final databaseService = DatabaseService();
//     final repository = BodyPictureRepository(
//       databaseService: databaseService,
//     );

//     test('getAllBodyPictures', () async {
//       // Arrange
//       final expected = <VaultImage>[];

//       // Act
//       final actual = await repository.getAllBodyPictures();

//       // Assert
//       expect(actual, expected);
//     });

//     test('getBodyPictureById', () async {
//       // Arrange
//       final id = 1;
//       final expected = VaultImage(id: id, path: 'path', tags: <String>[]);

//       // Act
//       final actual = await repository.getBodyPictureById(id);

//       // Assert
//       expect(actual, expected);
//     });

//     test('getBodyPicturesByTag', () async {
//       // Arrange
//       final tag = 'tag';
//       final expected = <VaultImage>[];

//       // Act
//       final actual = await repository.getBodyPicturesByTag(tag);

//       // Assert
//       expect(actual, expected);
//     });

//     test('saveBodyPicture', () async {
//       // Arrange
//       final bodyPicture = VaultImage(id: 1, path: 'path', tags: <String>[]);
//       final expected = bodyPicture;

//       // Act
//       final actual = await repository.saveBodyPicture(bodyPicture);

//       // Assert
//       expect(actual, expected);
//     });

//     test('updateBodyPicture', () async {
//       // Arrange
//       final bodyPicture = VaultImage(id: 1, path: 'path', tags: <String>[]);
//       final expected = bodyPicture;

//       // Act
//       final actual = await repository.updateBodyPicture(bodyPicture);

//       // Assert
//       expect(actual, expected);
//     });

//     test('deleteBodyPicture', () async {
//       // Arrange
//       final id = 1;

//       // Act
//       await repository.deleteBodyPicture(id);

//       // Assert
//       // TODO: Verify that the body picture was deleted from the database
//     });

//     test('deleteAllBodyPictures', () async {
//       // Arrange

//       // Act
//       await repository.deleteAllBodyPictures();

//       // Assert
//       // TODO: Verify that all body pictures were deleted from the database
//     });

//     test('addTag', () async {
//       // Arrange
//       final tag = 'tag';

//       // Act
//       await repository.addTag(tag);

//       // Assert
//       // TODO: Verify that the tag was added to the database
//     });

//     test('removeTag', () async {
//       // Arrange
//       final tag = 'tag';

//       // Act
//       await repository.removeTag(tag);

//       // Assert
//       // TODO: Verify that the tag was removed from the database
//     });

//     test('getAllTags', () async {
//       // Arrange
//       final expected = <String>[];

//       // Act
//       final actual = await repository.getAllTags();

//       // Assert
//       expect(actual, expected);
//     });
//   });
// }
