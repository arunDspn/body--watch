class MeasurementType {
  const MeasurementType({
    required this.name,
  });

  final String name;
}

class LengthMeasurementType extends MeasurementType {
  const LengthMeasurementType({
    required String name,
  }) : super(name: name);
}

class WeightMeasurementType extends MeasurementType {
  const WeightMeasurementType({
    required String name,
  }) : super(name: name);
}

class PercentageMeasurementType extends MeasurementType {
  const PercentageMeasurementType({
    required String name,
  }) : super(name: name);
}

const LengthMeasurementType chest = LengthMeasurementType(name: 'Chest');
const LengthMeasurementType waist = LengthMeasurementType(name: 'Waist');
const LengthMeasurementType hips = LengthMeasurementType(name: 'Hips');
const LengthMeasurementType thighLeft =
    LengthMeasurementType(name: 'Thigh · Left');
const LengthMeasurementType thighRight =
    LengthMeasurementType(name: 'Thigh · Right');
const LengthMeasurementType calfLeft =
    LengthMeasurementType(name: 'Calf · Left');
const LengthMeasurementType calfRight =
    LengthMeasurementType(name: 'Calf · Right');
const LengthMeasurementType neck = LengthMeasurementType(name: 'Neck');
const LengthMeasurementType bicepsLeft =
    LengthMeasurementType(name: 'Biceps · Left');
const LengthMeasurementType bicepsRight =
    LengthMeasurementType(name: 'Biceps · Right');
const LengthMeasurementType forearmLeft =
    LengthMeasurementType(name: 'Forearm · Left');
const LengthMeasurementType forearmRight =
    LengthMeasurementType(name: 'Forearm · Right');
const LengthMeasurementType wristLeft =
    LengthMeasurementType(name: 'Wrist · Left');
const LengthMeasurementType wristRight =
    LengthMeasurementType(name: 'Wrist · Right');
const LengthMeasurementType shoulder = LengthMeasurementType(name: 'Shoulder');
const WeightMeasurementType weight = WeightMeasurementType(name: 'Weight');
const PercentageMeasurementType bodyFat =
    PercentageMeasurementType(name: 'Body · Fat');

const List<MeasurementType> allWidgets = [
  chest,
  waist,
  hips,
  thighLeft,
  thighRight,
  calfLeft,
  calfRight,
  neck,
  bicepsLeft,
  bicepsRight,
  forearmLeft,
  forearmRight,
  wristLeft,
  wristRight,
  shoulder,
  weight,
  bodyFat,
];

MeasurementType? measurementTypeFromString(String name) {
  for (final element in allWidgets) {
    if (element.name == name) return element;
  }
  // return null;
  return MeasurementType(name: name + "🥶");
}
