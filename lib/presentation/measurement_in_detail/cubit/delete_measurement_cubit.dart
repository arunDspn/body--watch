import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/i_measurements.dart';

part 'delete_measurement_state.dart';
part 'delete_measurement_cubit.freezed.dart';

class DeleteMeasurementCubit extends Cubit<DeleteMeasurementState> {
  DeleteMeasurementCubit(this.measurementsFacade)
      : super(const DeleteMeasurementState.initial());

  final IMeasurementsFacade measurementsFacade;

  Future<void> delete({required String id}) async {
    final result = await measurementsFacade.deleteMeasurement(id: id);

    result.fold(
      (failure) => emit(DeleteMeasurementState.error(failure)),
      (_) => emit(DeleteMeasurementState.deleted(id)),
    );
  }
}
