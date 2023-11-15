import 'package:mockito/annotations.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

@GenerateMocks([MeasurementRepository])
void main() {
  // group('Widget Repository Test', () {
  //   const tableName = 'widget_table';
  //   final measurement = Measurement(
  //     50.1,
  //     DateTime.now(),
  //   );

  //   late MeasurementRepository measurementRepository;

  //   setUp(() {
  //     measurementRepository = MockMeasurementRepository();
  //   });

  //   // Create Measurement
  //   test(
  //     'Create Measurement SUCCESS',
  //     () async {
  //       when(
  //         measurementRepository.createMeasurement(
  //           dataTypeAndName: tableName,
  //           measurement: measurement,
  //         ),
  //       ).thenAnswer(
  //         (_) async => const Right(unit),
  //       );

  //       expect(
  //         await measurementRepository.createMeasurement(
  //           dataTypeAndName: tableName,
  //           measurement: measurement,
  //         ),
  //         isA<Right>(),
  //       );
  //     },
  //   );
  //   // Delete Measurement
  //   // Get All  Measurements
  //   // Get Latest Measurements
  //   // Update Measurement
  // });
}
