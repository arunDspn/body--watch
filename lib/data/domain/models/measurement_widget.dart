class MeasurementWidget {
  MeasurementWidget(this.name, this.tableName);

  factory MeasurementWidget.fromMap(Map<String, dynamic> json) {
    return MeasurementWidget(
      json['name'] as String,
      json['table_name'] as String,
    );
  }
  final String name;
  final String tableName;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'name': name,
      'table_name': tableName,
    };
  }
}
