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
  AppPreferences({
    required this.weightUnit,
    required this.lengthUnit,
    required this.heightUnit,
    this.lang = 'en',
  });

  final String? weightUnit;
  final String? lengthUnit;
  final String? heightUnit;
  final String lang;

  // String get weightUnitString => EnumToString.convertToString(weightUnit);
  // String get lengthUnitString => EnumToString.convertToString(lengthUnit);
  // String get heightUnitString => EnumToString.convertToString(heightUnit);

  AppPreferences copyWith({
    String? weightUnit,
    String? lengthUnit,
    String? heightUnit,
    String? lang,
  }) =>
      AppPreferences(
        // weightUnit ?? this.weightUnit,
        // lengthUnit ?? this.lengthUnit,
        // heightUnit ?? this.heightUnit,
        // lang ?? this.lang,

        weightUnit: weightUnit ?? this.weightUnit,
        lengthUnit: lengthUnit ?? this.lengthUnit,
        heightUnit: heightUnit ?? this.heightUnit,
        lang: lang ?? this.lang,
      );
}
