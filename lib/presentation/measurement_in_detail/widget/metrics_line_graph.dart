import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/constants/theme.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_indexer.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_to_text.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';
import 'package:watcha_body/services/time_range_service/service.dart';

class MetricsLineGraph extends StatelessWidget {
  const MetricsLineGraph({
    super.key,
    required this.filteredMeasurements,
    required this.startDate,
    required this.endDate,
    required this.dayToText,
  });

  final List<Measurement> filteredMeasurements;
  final DateTime startDate;
  final DateTime endDate;
  final DayToText dayToText;

  @override
  Widget build(BuildContext context) {
    print("00 ------------- exe");
    // Convert data to FlSpot

    // final minY = measurements.reduce(
    //   (value, element) => value.value < element.value ? value : element,
    // );
    // final maxY = measurements.reduce(
    //   (value, element) => value.value > element.value ? value : element,
    // );

    // print(flSpots.toString());

    // for (var i = 0; i < filteredMeasurements.length; i++) {
    //   flSpots.add(
    //     // FlSpot(
    //     //   measurements[i].date.millisecondsSinceEpoch.toDouble(),
    //     //   measurements[i].value,
    //     // ),
    //     FlSpot(i.toDouble(), filteredMeasurements[i].value),
    //   );
    // }

    // for (DateTime date = startDate;
    //     date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
    //     date = date.add(Duration(days: 1))) {
    //   // Check if there is a measure for the current date
    //   final measure = filteredMeasurements.firstWhere(
    //     (element) => element.date.isAtSameMomentAs(date),
    //     orElse: () => sample.copyWith(value: 0, date: date),
    //   );

    //   // Add a FlSpot with the value for the date
    //   flSpots
    //       .add(FlSpot(date.millisecondsSinceEpoch.toDouble(), measure.value));
    //   print("$measure  \n");
    // }

    return FutureBuilder<List<FlSpot>>(
      future: genDataConcurrently(
        list: filteredMeasurements,
        startDate: startDate,
        endDate: endDate,
      ),
      // genData(
      //   startDate: startDate,
      //   endDate: endDate,
      //   list: filteredMeasurements,
      // ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          print("------ ${snapshot.data!.length}");
          // for (var i = 0; i < snapshot.data!.length; i++) {
          //   print("${snapshot.data![i].x} --- ${(snapshot.data![i].y)} ");
          // }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: AspectRatio(
              // aspectRatio: 1.70,
              aspectRatio: 1.50,
              child: LineChart(
                // curve: Curves.bounceIn,
                // duration: const Duration(seconds: 3),
                LineChartData(
                  gridData: FlGridData(
                    checkToShowHorizontalLine: (value) => true,
                    checkToShowVerticalLine: (value) => false,
                    // show: false,
                    // horizontalInterval: 0,
                    // verticalInterval: 1,
                    // getDrawingHorizontalLine: (value) {
                    //   return FlLine(
                    //     // color: kPrimaryLightFont,
                    //     color: Colors.grey.shade50,
                    //     strokeWidth: 1,
                    //     dashArray: [5, 5],
                    //   );
                    // },
                    // getDrawingVerticalLine: (value) {
                    //   return FlLine(
                    //     // color: kPrimaryLightFont,

                    //     color: Colors.grey.shade50,
                    //     strokeWidth: 1,
                    //   );
                    // },
                  ),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: kPrimaryLightBackground,
                      getTooltipItems: (touchedSpots) {
                        // print(
                        //     '${DayIndex().getDateStringFromDayIndex(touchedSpots.first.y.toInt())}');
                        // final date = dayToText.
                        return [
                          LineTooltipItem(
                            '${touchedSpots.first.y} on ${DayIndex().getDateStringFromDayIndex(touchedSpots.first.x.toInt())}',
                            // '${DayIndex().getDateStringFromDayIndex(touchedSpots.first.x.toInt())}',
                            // "Good is God \n Max asdasd addsaaaaaaaaaa",
                            const TextStyle(
                              color: kPrimaryColorInLight,
                              fontSize: 10,
                            ),
                          ),
                          // LineTooltipItem(
                          //     touchedSpots.first.y.toString(), TextStyle()),
                        ];
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        // interval: 7,
                        // getTitlesWidget: bottomTitleWidgets,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            // child: Text((value + 1).toInt().toString()),
                            child: Text(
                              dayToText.getRelevantText(
                                DayIndex().getDateFromDayIndex(value.toInt()),
                              ),
                            ),
                          );
                          // final data = generateBottomTitleWidget(
                          //   stateValue.timeUnit,
                          //   context,
                          //   stateValue.startDate,
                          // );

                          // var text = '?';

                          // // Use the value as the index to get the corresponding month name
                          // final index = value.toInt();
                          // if (index >= 0 && index < filteredMeasurements.length) {
                          //   text = DateFormat('MMM')
                          //       .format(filteredMeasurements[index].date);

                          //   return Text(text);
                          // } else {
                          //   text = '-';

                          //   return Text(text);
                          // }

                          // const weekDays = <String>[
                          //   'Mon',
                          //   'Tue',
                          //   'Wed',
                          //   'Thu',
                          //   'Fri',
                          //   'Sat',
                          //   'Sun'
                          // ];
                          // return SideTitleWidget(
                          //   axisSide: meta.axisSide,
                          //   child: Text(
                          //     weekDays[value.toInt()],
                          //     style: const TextStyle(
                          //       color: Colors.red,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 15,
                        // getTitlesWidget: leftTitleWidgets,
                        reservedSize: 32,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(color: Colors.grey),
                  ),
                  // minX: 7,
                  // maxX: 14,
                  // minY: minY.value,
                  // maxY: maxY.value,
                  // minX: 6,
                  // maxX: 60,
                  lineBarsData: [
                    LineChartBarData(
                      spots: snapshot.data ?? [],
                      // spots: const [
                      //   FlSpot(0, 3),
                      //   FlSpot(2.6, 2),
                      //   FlSpot(4.9, 5),
                      //   FlSpot(6.8, 3.1),
                      //   FlSpot(8, 4),
                      //   FlSpot(9.5, 3),
                      //   FlSpot(11, 4),
                      // ],
                      isCurved: true,
                      // barWidth: 2,
                      aboveBarData: BarAreaData(),
                      curveSmoothness: .1,
                      preventCurveOverShooting: true,
                      // isStrokeCapRound: true,
                      color: kPrimaryColorInDark,
                      dotData: FlDotData(
                        checkToShowDot: (spot, barData) => spot.y != 0,
                      ),
                      belowBarData: BarAreaData(
                          // gradient: LinearGradient(
                          //   colors: gradientColors
                          //       .map((color) => color.withOpacity(0.3))
                          //       .toList(),
                          // ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

Future<List<FlSpot>> genDataConcurrently({
  required DateTime startDate,
  required DateTime endDate,
  required List<Measurement> list,
}) async {
  return compute(genDataCompute, {
    'startDate': startDate,
    'endDate': endDate,
    'list': list,
  });
}

List<FlSpot> genDataCompute(Map<String, dynamic> data) {
  final startDate = data['startDate'] as DateTime;
  final endDate = data['endDate'] as DateTime;
  final list = data['list'] as List<Measurement>;

  final flSpots = <FlSpot>[];
  final sample = list.first;

  // var index = -1.0;

  for (var date = startDate;
      date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
      date = date.add(const Duration(days: 1))) {
    final measure = list.firstWhere(
      (element) =>
          element.date.day == date.day && element.date.month == date.month,
      orElse: () => sample.copyWith(date: date, value: 0),
    );

    flSpots.add(
      FlSpot(
        DayIndex().calculateDaysSinceReference(date).toDouble(),
        // measure.value != 0 ? measure.value : double.nan,
        measure.value,
      ),
    );
    // index++;
    // flSpots.add(
    //   measure.value == 0
    //       ? FlSpot.nullSpot
    //       : FlSpot(
    //           DayIndex().calculateDaysSinceReference(date).toDouble(),
    //           measure.value,
    //         ),
    // );
  }

  // print(
  // "${startDate.toIso8601String()} ${endDate.toIso8601String()} -- Length = ${flSpots.length}");

  return flSpots;
}

// List<FlSpot> genData({
//   required DateTime startDate,
//   required DateTime endDate,
//   required List<Measurement> list,
// }) {
//   final flSpots = <FlSpot>[];
//   // await Future<void>.delayed(const Duration(seconds: 10));

//   final sample = list.first;
//   for (var date = startDate;
//       date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
//       date = date.add(const Duration(days: 1))) {
//     // Check if there is a measure for the current date
//     final measure = list.firstWhere(
//       (element) => element.date.isAtSameMomentAs(date),
//       orElse: () => sample.copyWith(date: date, value: 0),
//     );

//     // Add a FlSpot with the value for the date
//     flSpots.add(FlSpot(date.millisecondsSinceEpoch.toDouble(), measure.value));
//   }
//   return flSpots;
// }

// String generateBottomTitleWidget(
//   TimeUnit timeUnit,
//   BuildContext context,
//   DateTime date,
// ) {
//   return switch (timeUnit) {
//     TimeUnit.week => weekBottomTitleText(),
//     TimeUnit.month => monthBottomTitleText(context, date),
//     TimeUnit.threeMonth => threeMonthBottomTitleWidget(date),
//     TimeUnit.year => yearBottomTitleWidget(),
//   };
// }

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10K';
      break;
    case 3:
      text = '30k';
      break;
    case 5:
      text = '50k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              // showAvg ? avgData() : mainData(),
              // avgData(),
              mainData(),
            ),
          ),
        ),
        // SizedBox(
        //   width: 60,
        //   height: 34,
        //   child: TextButton(
        //     onPressed: () {
        //       setState(() {
        //         showAvg = !showAvg;
        //       });
        //     },
        //     child: Text(
        //       'avg',
        //       style: TextStyle(
        //         fontSize: 12,
        //         color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // color: kPrimaryLightFont,
            color: Colors.grey.shade50,
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            // color: kPrimaryLightFont,

            color: Colors.grey.shade50,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        rightTitles: AxisTitles(),
        topTitles: AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   // border: Border.all(color: Colors.grey),
      //   border: Border.all(color: const Color.fromARGB(255, 177, 31, 31)),
      // ),
      // minX: 7,
      // maxX: 7,
      // minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          barWidth: 2,
          isStrokeCapRound: true,
          color: kPrimaryColorInDark,
          dotData: FlDotData(
            show: false,
            checkToShowDot: (spot, _) {
              return spot.y != 0;
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            // gradient: LinearGradient(
            //   colors: gradientColors
            //       .map((color) => color.withOpacity(0.3))
            //       .toList(),
            // ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
        drawHorizontalLine: false,
        verticalInterval: 1,
        horizontalInterval: 1,
        drawVerticalLine: false,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          barWidth: 1,
          isStrokeCapRound: true,
          // color: Colors.red,
          // dashArray: [5, 10],
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true, color: Colors.amber,
            // gradient: LinearGradient(
            //   colors: [
            //     ColorTween(begin: gradientColors[0], end: gradientColors[1])
            //         .lerp(0.2)!
            //         .withOpacity(0.1),
            //     ColorTween(begin: gradientColors[0], end: gradientColors[1])
            //         .lerp(0.2)!
            //         .withOpacity(0.1),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}

// List<FlSpot> genDataCompute(Map<String, dynamic> data) {
//   final startDate = data['startDate'] as DateTime;
//   final endDate = data['endDate'] as DateTime;
//   final list = data['list'] as List<Measurement>;

//   final flSpots = <FlSpot>[];
//   final sample = list.first;

//   int i = 1;

//   for (var date = startDate;
//       date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
//       date = date.add(const Duration(days: 1))) {
//     final measure = list.firstWhere(
//       (element) => element.date.isAtSameMomentAs(date),
//       orElse: () => sample.copyWith(date: date, value: 0),
//     );

//     flSpots.add(FlSpot(date.millisecondsSinceEpoch.toDouble(), measure.value));
//   }

//   i++;
//   print("------- 88888 ------- $i");

//   return flSpots;
// }
// Create a new benchmark by extending BenchmarkBase
class TemplateBenchmark extends BenchmarkBase {
  TemplateBenchmark() : super('Template');
  DateTime startDate = DateTime(2022, 1, 1);
  DateTime endDate = DateTime(2022, 1, 20);
  final list = <Measurement>[
    Measurement(date: DateTime(2022, 1, 1), value: 1, type: "", unit: ""),
    Measurement(date: DateTime(2022, 1, 2), value: 2, type: "", unit: ""),
    Measurement(date: DateTime(2022, 1, 3), value: 3, type: "", unit: ""),
  ];

  static void main() {
    TemplateBenchmark().report();
  }

  // The benchmark code.
  @override
  void run() {
    final result = genDataCompute(<String, dynamic>{
      'startDate': startDate,
      'endDate': endDate,
      'list': list,
    });
  }

  // Not measured setup code executed prior to the benchmark runs.
  @override
  void setup() {}

  // Not measured teardown code executed after the benchmark runs.
  @override
  void teardown() {}

  // To opt into the reporting the time per run() instead of per 10 run() calls.
  //@override
  //void exercise() => run();
}

void main() {
  TemplateBenchmark.main();
}
