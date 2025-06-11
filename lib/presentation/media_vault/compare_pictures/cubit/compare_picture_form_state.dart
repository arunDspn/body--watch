part of 'compare_picture_form_cubit.dart';

@freezed
sealed class ComparePictureFormState with _$ComparePictureFormState {
  const factory ComparePictureFormState.state({
    required String tag,
    required DateTime? firstDate,
    required DateTime? secondDate,
    required bool ready,
  }) = ComparePictureFormStateData;
}
