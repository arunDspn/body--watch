import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

part 'delete_all_data_state.dart';
part 'delete_all_data_cubit.freezed.dart';

class DeleteAllDataCubit extends Cubit<DeleteAllDataState> {
  DeleteAllDataCubit(this.measurementRepository)
      : super(const DeleteAllDataState.initial());
  final MeasurementRepository measurementRepository;

  Future<void> deleteAllData() async {
    emit(const DeleteAllDataState.loading());

    final _result = await measurementRepository.deleteMeasurement();

    _result.fold(
      (l) {
        emit(DeleteAllDataState.failed(l));
      },
      (data) {
        emit(const DeleteAllDataState.success());
      },
    );
  }
}
