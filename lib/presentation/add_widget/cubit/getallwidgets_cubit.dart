import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/i_measurements.dart';

part 'getallwidgets_state.dart';
part 'getallwidgets_cubit.freezed.dart';

class GetallwidgetsCubit extends Cubit<GetallwidgetsState> {
  GetallwidgetsCubit(this.measurementsFacade)
      : super(const GetallwidgetsState.initial());
  final IMeasurementsFacade measurementsFacade;

  Future<void> fetch() async {
    emit(const GetallwidgetsState.loading());

    final _result = await measurementsFacade.getAddedTypes();

    _result.fold(
      (l) => emit(GetallwidgetsState.failure(l)),
      (r) {
        final _remainingWidgets =
            allWidgets.where((e) => !r.contains(e.name)).toList();

        emit(GetallwidgetsState.success(_remainingWidgets));
      },
    );
  }
}
