import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/metrics_line_graph.dart';

void main() {
  // testWidgets('metrics line graph ...', (tester) async {
  //   // TODO: Implement test
  // });
  test("", () {
    // Arrange
    DateTime startDate = DateTime(2022, 1, 1);
    DateTime endDate = DateTime(2022, 1, 20);
    final list = <Measurement>[
      Measurement(date: DateTime(2022, 1, 1), value: 1, type: "", unit: ""),
      Measurement(date: DateTime(2022, 1, 2), value: 2, type: "", unit: ""),
      Measurement(date: DateTime(2022, 1, 3), value: 3, type: "", unit: ""),
    ];

    // Act
    final result = genDataCompute(<String, dynamic>{
      'startDate': startDate,
      'endDate': endDate,
      'list': list,
    });

    // Assert
    expect(result.length, equals(20));
    // expect(result[0].x, equals(startDate.millisecondsSinceEpoch.toDouble()));
    // expect(result[0].y, equals(1));
    // expect(
    //     result[1].x,
    //     equals(startDate
    //         .add(Duration(days: 1))
    //         .millisecondsSinceEpoch
    //         .toDouble()));
    // expect(result[1].y, equals(2));
    // expect(result[2].x, equals(endDate.millisecondsSinceEpoch.toDouble()));
    // expect(result[2].y, equals(3));
  });

  // test("As", () {

  // });
}
