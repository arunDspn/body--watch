import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:watcha_body/constants/theme.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
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
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: AspectRatio(
              aspectRatio: 1.50,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    checkToShowHorizontalLine: (value) => true,
                    checkToShowVerticalLine: (value) => false,
                  ),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: kPrimaryLightBackground,
                      getTooltipItems: (touchedSpots) {
                        final dateString = switch (dayToText.timeUnit) {
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
                            const TextStyle(
                              color: kPrimaryColorInLight,
                              fontSize: 10,
                            ),
                          ),
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
                        getTitlesWidget: (value, meta) {
                          // if (dayToText.timeUnit == TimeUnit.month) {
                          //   print(
                          //       " -- $value ${meta.axisSide.index} --- ${dayToText.timeUnit}");
                          // }

                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              dayToText.getRelevantTextByNumber(
                                value,
                              ),
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
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
                  minX: 0.9,
                  maxY: setMaxY(snapshot.data!),
                  minY: setMinY(snapshot.data!),
                  maxX: setMaxX(dayToText.timeUnit, startDate),
                  lineBarsData: [
                    LineChartBarData(
                      spots: snapshot.data!.reversed.toList(),
                      isCurved: true,
                      aboveBarData: BarAreaData(),
                      curveSmoothness: .2,
                      preventCurveOverShooting: true,
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
                      belowBarData: BarAreaData(),
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
    TimeUnit.month => calculateTotalWeeksInCurrentMonth(dateTime),
    TimeUnit.threeMonth => 4,
    TimeUnit.year => 13,
  };
}

double calculateTotalWeeksInCurrentMonth(DateTime date) {
  // Find the first day of the month
  final firstDayOfMonth = DateTime(date.year, date.month, 1);

  // Find the last day of the month
  final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

  // Calculate the difference in days between the first and last day of the month
  final differenceInDays = lastDayOfMonth.difference(firstDayOfMonth).inDays;

  // Calculate the total weeks
  final totalWeeks = ((differenceInDays + firstDayOfMonth.weekday) / 7).ceil();

  return totalWeeks.toDouble();
}

double getWeekOfMonth(DateTime date) {
  final firstDayOfMonth = DateTime(date.year, date.month, 1).weekday;
  final dayOfMonth = date.day;

  // Calculate the week of the month
  final weekOfMonth = ((dayOfMonth + firstDayOfMonth - 2) / 7).ceil();

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

  // if (timeUnit == TimeUnit.threeMonth) {
  //   print('Yio');
  // }

  if (previousMeasurement != null) {
    firstSpot = FlSpot(0.9, previousMeasurement.value);
  }
  if (nextMeasurement != null) {
    final lastSpotX = setMaxX(timeUnit, startDate);
    lastSpot = FlSpot(lastSpotX + .09, nextMeasurement.value);
  }

  // if (timeUnit == TimeUnit.threeMonth) {
  //   print('Yio');
  // }

  final fd = <FlSpot>[
    if (firstSpot != null) ...[firstSpot] else ...[],
    ...flspots,
    if (lastSpot != null) ...[lastSpot] else ...[],
  ]..sort((a, b) => a.x.compareTo(b.x));
  return fd;
}
