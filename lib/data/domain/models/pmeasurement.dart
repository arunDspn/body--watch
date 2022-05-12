import 'dart:ffi';

class Measurement {
  Measurement(this.measurement, this.date);

  factory Measurement.fromMap(Map<String, dynamic> json) {
    return Measurement(
        json['measurement'] as double,
        DateTime.parse(
          json['date'] as String,
        ) as DateTime);
  }

  final double measurement;
  final DateTime date;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'measurement': measurement,
      'date': date.toIso8601String(),
    };
  }
}
