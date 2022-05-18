import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';

part 'appinitializer_state.dart';
part 'appinitializer_cubit.freezed.dart';

class AppinitializerCubit extends Cubit<AppinitializerState> {
  AppinitializerCubit() : super(const AppinitializerState.initial());

  void fetchAppPreferences() {
    // Get Shared Preferences

    // Check if Shared Preferences is empty
    // If so its first time app is opened
    // So Set Default Preferences
    // Then Emit => Success

    // If not its not first time app is opened
    // So Get Preferences from Shared Preferences
    // And Set it to [AppPreferences]
    // Then Emit => Success
  }
}
