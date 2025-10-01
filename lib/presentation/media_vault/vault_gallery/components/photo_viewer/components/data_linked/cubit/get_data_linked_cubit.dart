import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/measurement/i_measurements.dart';
import 'package:watcha_body/data/domain/measurement/models/pmeasurement.dart';

part 'get_data_linked_state.dart';
part 'get_data_linked_cubit.freezed.dart';

class GetDataLinkedCubit extends Cubit<GetDataLinkedState> {
  GetDataLinkedCubit(this.measurementsFacade)
      : super(const GetDataLinkedState.initial());

  final IMeasurementsFacade measurementsFacade;

  Future<void> getData({required DateTime date}) async {
    emit(const GetDataLinkedState.loading());

    final result =
        await measurementsFacade.getAllMeasurementsByDate(date: date);

    result.fold((l) {
      emit(const GetDataLinkedState.error(message: 'Error getting data'));
    }, (r) {
      emit(GetDataLinkedState.loaded(dataLinked: r));
    });
  }
}
