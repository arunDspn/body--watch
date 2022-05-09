abstract class PMeasurement {
  PMeasurement(this.measurement, this.date);

  final int measurement;
  final DateTime date;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'measurement': measurement,
      'date': date.toIso8601String(),
    };
  }
}

class Waist extends PMeasurement {
  Waist(
    int measurement,
    DateTime date,
  ) : super(measurement, date);

  factory Waist.fromMap(Map<String, dynamic> json) {
    return Waist(json['measurement'] as int, json['date'] as DateTime);
  }
}

// class Hip extends PMeasurement {
//   Hip(int measurement, DateTime measurementDate)
//       : super(measurement, measurementDate);
// }

// class Neck extends PMeasurement {
//   Neck(int measurement, DateTime measurementDate)
//       : super(measurement, measurementDate);
// }

class Chest extends PMeasurement {
  Chest(int measurement, DateTime measurementDate)
      : super(measurement, measurementDate);

  factory Chest.fromMap(Map<String, dynamic> json) {
    return Chest(
      json['measurement'] as int,
      DateTime.parse(json['date'] as String) as DateTime,
    );
  }
}
