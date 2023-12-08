import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:watcha_body/constants/theme.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_indexer.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_to_text.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';

class MetricsLineGraph extends StatelessWidget {
  const MetricsLineGraph({
    super.key,
    required this.filteredMeasurements,
    required this.startDate,
    required this.endDate,
    required this.dayToText,
    required this.previousMeasurement,
    this.nextMeasurement,
  });

  final List<Measurement> filteredMeasurements;
  final DateTime startDate;
  final DateTime endDate;
  final DayToText dayToText;
  final Measurement? previousMeasurement;
  final Measurement? nextMeasurement;

  @override
  Widget build(BuildContext context) {
    // print("00 ------------- exe");
    // Convert data to F§lSpot

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

    final reversedList = filteredMeasurements.reversed.toList();

    return FutureBuilder<List<FlSpot>>(
      future: genDataConcurrently(
        list: reversedList,
        startDate: startDate,
        endDate: endDate,
        timeUnit: dayToText.timeUnit,
        previousMeasurement: previousMeasurement,
        nextMeasurement: nextMeasurement,
        dayToText: dayToText,
      ),
      // genData(
      //   startDate: startDate,
      //   endDate: endDate,
      //   list: filteredMeasurements,
      // ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          // print("------ ${snapshot.data!.length}");
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
                        final dateString = switch (dayToText.timeUnit) {
                          // TODO: Handle this case.
                          TimeUnit.week => dayToText.denormalizeWeekday(
                              touchedSpots.first.x,
                            ),
                          // TODO: Handle this case.
                          TimeUnit.month => '',
                          TimeUnit.threeMonth =>
                            dayToText.derangeifyThreeMonthsToString(
                              touchedSpots.first.x,
                            ),
                          TimeUnit.year => dayToText
                              .derangeifyMonthsInYear(touchedSpots.first.x),
                        };

                        return [
                          LineTooltipItem(
                            '${touchedSpots.first.y} on $dateString',
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
                        interval: 1,
                        // getTitlesWidget: bottomTitleWidgets,
                        getTitlesWidget: (value, meta) {
                          if (dayToText.timeUnit == TimeUnit.month) {
                            print(
                                " -- $value ${meta.axisSide.index} --- ${dayToText.timeUnit}");
                          }
                          // print(
                          //     " -- $value ${meta.axisSide.index} --- ${dayToText.timeUnit}");
                          // return SideTitleWidget(
                          //     child: Text(value.toString()),
                          //     axisSide: meta.axisSide);
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            // child: Text((value + 1).toInt().toString()),
                            child: Text(
                              dayToText.getRelevantTextByNumber(
                                value,
                                // DayIndex().getDateFromDayIndex(
                                //   value.toInt(),
                                // filteredMeasurements[value.toInt()].date,
                                // ),
                              ),
                              style: const TextStyle(
                                fontSize: 10,
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
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        // interval: 15,
                        // getTitlesWidget: leftTitleWidgets,
                        reservedSize: 32,
                        getTitlesWidget: (value, meta) => SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            meta.formattedValue,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
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
                  minX: 0.9,
                  maxY: setMaxY(snapshot.data!),
                  minY: setMinY(snapshot.data!),
                  // maxX: 60,
                  // minX: setMaxX(dayToText.timeUnit),
                  maxX: setMaxX(dayToText.timeUnit, startDate),
                  lineBarsData: [
                    LineChartBarData(
                      spots: snapshot.data!.reversed.toList(),
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
                      curveSmoothness: .2,
                      preventCurveOverShooting: true,
                      // isStrokeCapRound: true,
                      color: kPrimaryColorInDark,
                      dotData: FlDotData(
                        checkToShowDot: (spot, barData) => spot.y != 0,
                        getDotPainter: (p0, p1, p2, p3) {
                          if (p0.x == 0.9) {
                            // todo: fix?
                            return FlDotCirclePainter(
                              color: Colors.transparent,
                              strokeWidth: 0,
                            );
                          }
                          // else if (p0.x == p2.spots.first.x) {
                          //   // todo: fix?
                          //   return FlDotCirclePainter(
                          //     color: Colors.transparent,
                          //     strokeWidth: 0,
                          //   );
                          // }
                          return FlDotCirclePainter(
                            color: kPrimaryColorInDark,
                            radius: 3,
                            strokeWidth: 0,
                          );
                        },
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

double setMaxY(List<FlSpot> lists) {
  final item =
      lists.reduce((value, element) => value.y > element.y ? value : element);
  return item.y + 2;
}

double setMinY(List<FlSpot> lists) {
  final item =
      lists.reduce((value, element) => value.y < element.y ? value : element);
  return item.y - 2;
}

double setMaxX(TimeUnit timeUnit, DateTime dateTime) {
  return switch (timeUnit) {
    TimeUnit.week => 8,
    // TODO: Handle this case.
    TimeUnit.month => calculateTotalWeeksInCurrentMonth(dateTime),
    // TODO: Handle this case.
    TimeUnit.threeMonth => 4,
    // TODO: Handle this case.
    TimeUnit.year => 13,
  };
}

double calculateTotalWeeksInCurrentMonth(DateTime date) {
  // Find the first day of the month
  DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);

  // Find the last day of the month
  DateTime lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

  // Calculate the difference in days between the first and last day of the month
  int differenceInDays = lastDayOfMonth.difference(firstDayOfMonth).inDays;

  // Calculate the total weeks
  int totalWeeks = ((differenceInDays + firstDayOfMonth.weekday) / 7).ceil();

  return totalWeeks.toDouble();
}

double getWeekOfMonth(DateTime date) {
  int firstDayOfMonth = DateTime(date.year, date.month, 1).weekday;
  int dayOfMonth = date.day;

  // Calculate the week of the month
  int weekOfMonth = ((dayOfMonth + firstDayOfMonth - 2) / 7).ceil();

  return weekOfMonth.toDouble();
}

Future<List<FlSpot>> genDataConcurrently({
  required DateTime startDate,
  required DateTime endDate,
  required List<Measurement> list,
  required TimeUnit timeUnit,
  required Measurement? previousMeasurement,
  required Measurement? nextMeasurement,
  required DayToText dayToText,
}) async {
  // return compute(genDataCompute, {
  //   'startDate': startDate,
  //   'endDate': endDate,
  //   'list': list,
  // });

  // const firstItem = FlSpot(0.9, 55);

  final flspots = switch (timeUnit) {
    TimeUnit.week => list
        .map((e) => FlSpot(dayToText.normalizeWeekday(e.date), e.value))
        .toList(),
    TimeUnit.month =>
      list.map((e) => FlSpot(getWeekOfMonth(e.date), e.value)).toList(),
    TimeUnit.threeMonth => list
        .map(
          (e) => FlSpot(dayToText.rangeifyThreeMonths(e.date), e.value),
        )
        .toList(),
    TimeUnit.year => list
        .map((e) => FlSpot(dayToText.rangeifyMonthsInYear(e.date), e.value))
        .toList(),
  };

  FlSpot? lastSpot;
  FlSpot? firstSpot;

  if (timeUnit == TimeUnit.threeMonth) {
    print('Yio');
  }

  if (previousMeasurement != null) {
    firstSpot = FlSpot(0.9, previousMeasurement.value);
  }
  if (nextMeasurement != null) {
    final lastSpotX = setMaxX(timeUnit, startDate);
    lastSpot = FlSpot(lastSpotX + .09, nextMeasurement.value);
  }

  // return [
  //   if (firstSpot != null) ...[firstSpot] else ...[],
  //   ...flspots,
  //   if (lastSpot != null) ...[lastSpot] else ...[],
  // ];

  if (timeUnit == TimeUnit.threeMonth) {
    print('Yio');
  }

  final fd = <FlSpot>[
    if (firstSpot != null) ...[firstSpot] else ...[],
    ...flspots,
    if (lastSpot != null) ...[lastSpot] else ...[],
  ]..sort((a, b) => a.x.compareTo(b.x));
  return fd;

  // final flspots = <FlSpot>[];

  // for (var i = 0; i < list.length; i++) {
  //   // flspots.add(FlSpot(i.toDouble(), list[i].value));
  //   flspots.add();
  // }
  // // return list.map((e) => FlSpot(e.date.weekday.toDouble(), e.value)).toList();
  // return flspots;
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

    // flSpots.add(
    //   FlSpot(
    //     DayIndex().calculateDaysSinceReference(date).toDouble(),
    //     // measure.value != 0 ? measure.value : double.nan,
    //     measure.value,
    //   ),
    // );
    // index++;
    // flSpots.add(
    //   measure.value == 0
    //       ? FlSpot.nullSpot
    //       : FlSpot(
    //           DayIndex().calculateDaysSinceReference(date).toDouble(),
    //           measure.value,
    //         ),
    // );
    flSpots.add(FlSpot(
      DayIndex().calculateDaysSinceReference(date).toDouble(),
      measure.value,
    ));
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




// Save Stuff


