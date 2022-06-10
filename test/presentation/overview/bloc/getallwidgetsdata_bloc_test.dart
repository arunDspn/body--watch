import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/repositories/widget_repository.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';

// import 'getallwidgetsdata_bloc_test.mocks.dart';

// @GenerateMocks([MeasurementRepository, DatabaseService])
// void main() {
//   late WidgetRepository widgetRepository;
//   late GetallwidgetsdataBloc bloc;
//   late DatabaseService databaseService;
//   late MeasurementRepository measurementRepository;

//   setUp(() {
//     widgetRepository = MockWidgetRepository();
//     measurementRepository = MockMeasurementRepository();
//     databaseService = MockDatabaseService();
//     bloc = GetallwidgetsdataBloc(widgetRepository, measurementRepository);
//   });

//   group('Get all Widgets Test', () {
//     widgetRepository = MockWidgetRepository();
//     when(widgetRepository.getAddedWidgets()).thenAnswer((_) async {
//       return const Left('error');
//     });

//     blocTest<GetallwidgetsdataBloc, GetallwidgetsdataState>(
//       'Check for Failure',
//       build: () {
//         return bloc;
//       },
//       act: (bloc) => bloc.add(const GetallwidgetsdataEvent.fetchAllData()),
//       expect: () => [const GetallwidgetsdataState.failure('error')],
//     );
//   });
// }
