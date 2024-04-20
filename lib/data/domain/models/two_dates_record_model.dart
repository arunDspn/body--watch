import 'package:freezed_annotation/freezed_annotation.dart';

part 'two_dates_record_model.freezed.dart';
part 'two_dates_record_model.g.dart';

@freezed
class TwoDatesRecord with _$TwoDatesRecord {
  const factory TwoDatesRecord({
    required String name,
    required double? data1,
    required double? data2,
  }) = _TwoDatesRecord;

  factory TwoDatesRecord.fromJson(Map<String, dynamic> json) =>
      _$TwoDatesRecordFromJson(json);
}
