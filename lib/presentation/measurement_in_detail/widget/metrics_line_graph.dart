import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_to_text.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';

class MetricsLineGraph extends StatefulWidget {
  const MetricsLineGraph({
    super.key,
    required this.filteredMeasurements,
    required this.startDate,
    required this.endDate,
    required this.dayToText,
    required this.previousMeasurement,
    this.nextMeasurement,
  });

  final List<MeasurementEntity> filteredMeasurements;
  final DateTime startDate;
  final DateTime endDate;
  final DayToText dayToText;
  final MeasurementEntity? previousMeasurement;
  final MeasurementEntity? nextMeasurement;

  @override
  State<MetricsLineGraph> createState() => _MetricsLineGraphState();
}

class _MetricsLineGraphState extends State<MetricsLineGraph> {
  @override
  Widget build(BuildContext context) {
    final reversedList = widget.filteredMeasurements.reversed.toList();

    return FutureBuilder<List<FlSpot>>(
      future: genDataConcurrently(
        list: reversedList,
        startDate: widget.startDate,
        endDate: widget.endDate,
        timeUnit: widget.dayToText.timeUnit,
        previousMeasurement: widget.previousMeasurement,
        nextMeasurement: widget.nextMeasurement,
        dayToText: widget.dayToText,
      ),
      builder: (context, snapshot) {
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: AspectRatio(
              aspectRatio: 1.50,
              child: (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData)
                  ? LineChart(
                      curve: Curves.decelerate,
                      duration: const Duration(seconds: 3),
                      LineChartData(
                        gridData: FlGridData(
                          checkToShowHorizontalLine: (_) => true,
                          checkToShowVerticalLine: (_) => false,
                        ),
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            // tooltipBgColor: Theme.of(context)
                            //     .colorScheme
                            //     .secondaryContainer,
                            getTooltipItems: (touchedSpots) {
                              final dateString =
                                  switch (widget.dayToText.timeUnit) {
                                TimeUnit.week =>
                                  widget.dayToText.denormalizeWeekday(
                                    touchedSpots.first.x,
                                  ),
                                // TODO: Handle this case.
                                TimeUnit.month => '',
                                TimeUnit.threeMonth => widget.dayToText
                                      .derangeifyThreeMonthsToString(
                                    touchedSpots.first.x,
                                  ),
                                TimeUnit.year =>
                                  widget.dayToText.derangeifyMonthsInYear(
                                    touchedSpots.first.x,
                                  ),
                              };

                              return [
                                LineTooltipItem(
                                  '${touchedSpots.first.y} on $dateString',
                                  TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
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
                                  meta: meta,
                                  child: Text(
                                    widget.dayToText.getRelevantTextByNumber(
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
                                // axisSide: meta.axisSide,
                                meta: meta,
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
                        maxX: setMaxX(
                            widget.dayToText.timeUnit, widget.startDate),
                        lineBarsData: [
                          LineChartBarData(
                            spots: snapshot.data!.reversed.toList(),
                            isCurved: true,
                            aboveBarData: BarAreaData(),
                            curveSmoothness: .2,
                            preventCurveOverShooting: true,
                            color: Theme.of(context).colorScheme.primary,
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
                                  color: Theme.of(context).colorScheme.primary,
                                  radius: 3,
                                  strokeWidth: 0,
                                );
                              },
                            ),
                            // belowBarData: BarAreaData(),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        }
      },
    );
  }
}

class _NoData extends StatelessWidget {
  const _NoData();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No Data'));
  }
}

double setMaxY(List<FlSpot> lists) {
  final item =
      lists.reduce((value, element) => value.y > element.y ? value : element);
  return (item.y + 2).roundToDouble();
}

double setMinY(List<FlSpot> lists) {
  final item =
      lists.reduce((value, element) => value.y < element.y ? value : element);
  return (item.y - 2).roundToDouble();
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
  required List<MeasurementEntity> list,
  required TimeUnit timeUnit,
  required MeasurementEntity? previousMeasurement,
  required MeasurementEntity? nextMeasurement,
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
