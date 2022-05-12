import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/repositories/widget_repository.dart';
import 'package:watcha_body/presentation/display_models/measurement_display.dart';

part 'getallwidgetsdata_event.dart';
part 'getallwidgetsdata_state.dart';
part 'getallwidgetsdata_bloc.freezed.dart';

class GetallwidgetsdataBloc
    extends Bloc<GetallwidgetsdataEvent, GetallwidgetsdataState> {
  GetallwidgetsdataBloc(this.widgetRepository, this.measurementRepository)
      : super(const _Initial()) {
    on<GetallwidgetsdataEvent>((event, emit) async {
      await event.map(
        fetchAllData: (value) async {
          emit(const GetallwidgetsdataState.loading());
          final _widgetList = await widgetRepository.getAddedWidgets();

          List<LatestMeasurementDisplayModel> list = [];

          await _widgetList.fold(
            (l) {
              emit(GetallwidgetsdataState.failure(l));
            },
            (r) async {
              for (final e in r) {
                final _data = await measurementRepository.getLatestDetails(
                  tableName: e.tableName,
                );
                _data.fold(
                  (l) {
                    emit(GetallwidgetsdataState.failure(l));
                  },
                  (r) {
                    list.add(
                      LatestMeasurementDisplayModel.fromMeasurementList(
                        measurement: r,
                        name: e.name,
                        tableName: e.tableName,
                      ),
                    );
                  },
                );
              }
              emit(GetallwidgetsdataState.success(list));
            },
          );
        },
      );
    });
  }

  //   Future<GetallwidgetsdataState> _latestDetails(MeasurementWidget e) async {
  //   List<LatestMeasurementDisplayModel> list = [];

  //   final _data = await measurementRepository.getLatestDetails(
  //     tableName: e.tableName,
  //   );
  //   _data.fold(
  //     (l) {
  //       return GetallwidgetsdataState.failure(l);
  //     },
  //     (r) {
  //       list.add(
  //         LatestMeasurementDisplayModel.fromMeasurementList(
  //           measurement: r,
  //           name: e.name,
  //         ),
  //       );
  //     },
  //   );
  //   return GetallwidgetsdataState.success(list);
  // }
  final WidgetRepository widgetRepository;
  final MeasurementRepository measurementRepository;
}
