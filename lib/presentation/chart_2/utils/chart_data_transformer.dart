import 'package:fl_chart/fl_chart.dart';
import 'package:watcha_body/presentation/chart_2/models/chart_models.dart';
import 'package:watcha_body/presentation/chart_2/utils/chart_date_utils.dart';

class ChartDataTransformer {
  static List<DataPoint> filterDataByPeriod(
    List<DataPoint> data,
    DateTime period,
    ChartFilter filter,
  ) {
    if (data.isEmpty) {
      return [];
    }

    final endDate = ChartDateUtils.getPeriodEndDate(period, filter);
    return data
        .where(
          (point) =>
              !point.dateTime.isBefore(period) &&
              point.dateTime.isBefore(endDate),
        )
        .toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  static double calculateXPosition(
    DateTime dateTime,
    DateTime startDate,
    DateTime endDate,
    ChartFilter filter,
  ) {
    switch (filter) {
      case ChartFilter.week:
        final diffInMillis = dateTime.difference(startDate).inMilliseconds;
        final weekDurationMillis = const Duration(days: 7).inMilliseconds;
        return (diffInMillis / weekDurationMillis) * 7.0;
      case ChartFilter.month:
        final diffDays = dateTime.difference(startDate).inDays.toDouble();
        final dayFraction =
            (dateTime.hour * 3600 + dateTime.minute * 60 + dateTime.second) /
            86400.0;
        return diffDays + dayFraction;
      case ChartFilter.threeMonth:
        final diffDays = dateTime.difference(startDate).inDays.toDouble();
        final dayFraction =
            (dateTime.hour * 3600 + dateTime.minute * 60 + dateTime.second) /
            86400.0 *
            0.5;
        return diffDays + dayFraction;
      case ChartFilter.year:
        return dateTime.difference(startDate).inDays.toDouble();
    }
  }

  static int findClosestDataPoint(
    FlSpot spot,
    List<DataPoint> filteredData,
    DateTime period,
    ChartFilter filter,
  ) {
    if (filteredData.isEmpty) {
      return -1;
    }

    final endDate = ChartDateUtils.getPeriodEndDate(period, filter);
    int closestIndex = -1;
    double minDistance = double.infinity;

    for (int i = 0; i < filteredData.length; i++) {
      final point = filteredData[i];
      final x = calculateXPosition(point.dateTime, period, endDate, filter);
      final distance =
          (x - spot.x) * (x - spot.x) +
          (point.value - spot.y) * (point.value - spot.y);
      if (distance < minDistance) {
        minDistance = distance;
        closestIndex = i;
      }
    }

    return closestIndex;
  }

  static List<FlSpot> generateSpots(
    List<DataPoint> filteredData,
    DateTime period,
    ChartFilter filter,
  ) {
    if (filteredData.isEmpty) {
      return [];
    }

    final sortedData = List<DataPoint>.of(filteredData)
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    final endDate = ChartDateUtils.getPeriodEndDate(period, filter);

    final groupedPoints = _groupPointsByDate(sortedData);
    final spots = <FlSpot>[];

    for (final dateEntry in groupedPoints.entries) {
      final pointsForDay = dateEntry.value;
      if (pointsForDay.length == 1) {
        final point = pointsForDay.first;
        final x = calculateXPosition(point.dateTime, period, endDate, filter);
        spots.add(FlSpot(x, point.value));
      } else {
        final baseX = calculateXPosition(
          dateEntry.key,
          period,
          endDate,
          filter,
        );
        const spacing = 0.08;
        for (int i = 0; i < pointsForDay.length; i++) {
          final offset = (i - (pointsForDay.length - 1) / 2) * spacing;
          spots.add(FlSpot(baseX + offset, pointsForDay[i].value));
        }
      }
    }

    spots.sort((a, b) => a.x.compareTo(b.x));
    if (spots.length <= 1) {
      return spots;
    }

    final interpolatedSpots = <FlSpot>[spots.first];
    final minGapForInterpolation = _getMinGapForInterpolation(filter);

    for (int i = 0; i < spots.length - 1; i++) {
      final current = spots[i];
      final next = spots[i + 1];
      final gap = next.x - current.x;

      if (gap > minGapForInterpolation) {
        final steps = (gap / minGapForInterpolation).ceil();
        final stepSize = gap / steps;
        for (int j = 1; j < steps; j++) {
          final ratio = j / steps;
          final x = current.x + stepSize * j;
          final y = current.y + (next.y - current.y) * ratio;
          interpolatedSpots.add(FlSpot(x, y));
        }
      }

      if (i < spots.length - 2) {
        interpolatedSpots.add(next);
      }
    }

    interpolatedSpots.add(spots.last);
    return interpolatedSpots;
  }

  static Map<DateTime, List<DataPoint>> _groupPointsByDate(
    List<DataPoint> points,
  ) {
    final groupedPoints = <DateTime, List<DataPoint>>{};

    for (final point in points) {
      final dateOnly = DateTime(
        point.dateTime.year,
        point.dateTime.month,
        point.dateTime.day,
      );
      groupedPoints.putIfAbsent(dateOnly, () => []).add(point);
    }

    return groupedPoints;
  }

  static double _getMinGapForInterpolation(ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        return 0.5;
      case ChartFilter.month:
        return 3.0;
      case ChartFilter.threeMonth:
        return 7.0;
      case ChartFilter.year:
        return 15.0;
    }
  }
}
