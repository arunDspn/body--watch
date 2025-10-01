class Measurement {
  Measurement({
    required this.value,
    required this.date,
    this.id,
    required this.type,
    required this.unit,
  });

  factory Measurement.fromMap(Map<String, dynamic> json) {
    return Measurement(
      value: json['value'] as double,
      date: DateTime.parse(
        json['date'] as String,
      ), // may be error
      id: json['id'].toString(),
      type: json['type'] as String,
      unit: json['unit'] as String,
    );
  }

  final double value;
  final DateTime date;
  final String? id;
  final String type;
  final String unit;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'value': value,
      'date': date.toIso8601String(),
      'id': id,
      'type': type,
      'unit': unit,
    };
  }

  //copy with
  Measurement copyWith({
    double? value,
    DateTime? date,
    String? id,
    String? type,
    String? unit,
  }) {
    return Measurement(
      value: value ?? this.value,
      date: date ?? this.date,
      id: id ?? this.id,
      type: type ?? this.type,
      unit: unit ?? this.unit,
    );
  }
}
