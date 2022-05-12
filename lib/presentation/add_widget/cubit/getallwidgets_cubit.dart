import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/i_widget_repository.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';

part 'getallwidgets_state.dart';
part 'getallwidgets_cubit.freezed.dart';

class GetallwidgetsCubit extends Cubit<GetallwidgetsState> {
  GetallwidgetsCubit(this.widgetRepository)
      : super(const GetallwidgetsState.initial());
  final IWidgetRepository widgetRepository;

  Future<void> fetch() async {
    emit(const GetallwidgetsState.loading());

    final _result = await widgetRepository.getAllWidgets();

    _result.fold(
      (l) => emit(GetallwidgetsState.failure(l)),
      (r) => emit(GetallwidgetsState.success(r)),
    );
  }
}
