import 'package:enum_to_string/enum_to_string.dart';

enum WeightUnit {
  kg,
  lb,
}

enum LengthUnit {
  cm,
  inch,
}

const Map<String, WeightUnit> weightMap = {
  'kg': WeightUnit.kg,
  'lb': WeightUnit.lb,
};

const Map<String, LengthUnit> lengthMap = {
  'cm': LengthUnit.cm,
  'inch': LengthUnit.inch,
};

class AppPreferences {
  AppPreferences(
    this.weightUnit,
    this.lengthUnit,
  );

  final WeightUnit weightUnit;
  final LengthUnit lengthUnit;

  String get weightUnitString => EnumToString.convertToString(weightUnit);
  String get lengthUnitString => EnumToString.convertToString(lengthUnit);

  AppPreferences copyWith({
    WeightUnit? weightUnit,
    LengthUnit? lengthUnit,
  }) =>
      AppPreferences(
        weightUnit ?? this.weightUnit,
        lengthUnit ?? this.lengthUnit,
      );
}
