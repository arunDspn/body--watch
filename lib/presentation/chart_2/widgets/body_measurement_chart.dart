import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/chart_models.dart';

/// A reusable chart widget for visualizing body measurements
class BodyMeasurementChart extends StatefulWidget {
  final List<DataPoint> data;
  final ChartConfig config;
  final ChartFilter defaultFilter;

  const BodyMeasurementChart({
    super.key,
    required this.data,
    required this.config,
    this.defaultFilter = ChartFilter.month,
  });

  @override
  State<BodyMeasurementChart> createState() => _BodyMeasurementChartState();
}

class _BodyMeasurementChartState extends State<BodyMeasurementChart> {
  // State variables for chart management
  late ChartFilter _currentFilter;
  late DateTime _currentPeriod;
  int? _selectedPointIndex;

  @override
  void initState() {
    super.initState();
    _currentFilter = widget.defaultFilter;
    _currentPeriod = _calculateCurrentPeriod();
    _selectedPointIndex = null;
  }

  @override
  void didUpdateWidget(BodyMeasurementChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset period if data changed
    if (oldWidget.data != widget.data) {
      _currentPeriod = _calculateCurrentPeriod();
      _selectedPointIndex = null;
    }
  }

  /// Calculate the current period based on the selected filter and current date
  DateTime _calculateCurrentPeriod() {
    final now = DateTime.now();

    switch (_currentFilter) {
      case ChartFilter.week:
        // Start of current week (Sunday)
        return now.subtract(Duration(days: now.weekday % 7));
      case ChartFilter.month:
        // Start of current month
        return DateTime(now.year, now.month, 1);
      case ChartFilter.threeMonth:
        // Start of current quarter
        final quarterMonth = ((now.month - 1) ~/ 3) * 3 + 1;
        return DateTime(now.year, quarterMonth, 1);
      case ChartFilter.year:
        // Start of current year
        return DateTime(now.year, 1, 1);
    }
  }

  /// Change the current filter and recalculate period
  void _changeFilter(ChartFilter filter) {
    setState(() {
      _currentFilter = filter;
      _currentPeriod = _calculateCurrentPeriod();
      _selectedPointIndex = null; // Clear selection when changing filters
    });
  }

  /// Navigate to previous or next period
  void _navigatePeriod(bool isNext) {
    setState(() {
      _currentPeriod = isNext
          ? _getNextPeriod(_currentPeriod, _currentFilter)
          : _getPreviousPeriod(_currentPeriod, _currentFilter);
      _selectedPointIndex = null; // Clear selection when navigating
    });
  }

  /// Get the next period based on current filter
  DateTime _getNextPeriod(DateTime current, ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        return current.add(const Duration(days: 7));
      case ChartFilter.month:
        return DateTime(current.year, current.month + 1, 1);
      case ChartFilter.threeMonth:
        return DateTime(current.year, current.month + 3, 1);
      case ChartFilter.year:
        return DateTime(current.year + 1, 1, 1);
    }
  }

  /// Get the previous period based on current filter
  DateTime _getPreviousPeriod(DateTime current, ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        return current.subtract(const Duration(days: 7));
      case ChartFilter.month:
        return DateTime(current.year, current.month - 1, 1);
      case ChartFilter.threeMonth:
        return DateTime(current.year, current.month - 3, 1);
      case ChartFilter.year:
        return DateTime(current.year - 1, 1, 1);
    }
  }

  /// Select a data point for tooltip display
  void _selectDataPoint(int? index) {
    setState(() {
      _selectedPointIndex = index;
    });
  }

  /// Get data points filtered by the current period and filter
  List<DataPoint> _getFilteredData() {
    if (widget.data.isEmpty) return [];

    DateTime startDate;
    DateTime endDate;

    // Calculate date range based on filter type and current period
    switch (_currentFilter) {
      case ChartFilter.week:
        startDate = _currentPeriod;
        endDate = _currentPeriod.add(const Duration(days: 7));
        break;
      case ChartFilter.month:
        startDate = _currentPeriod;
        // Last day of the month
        final nextMonth =
            DateTime(_currentPeriod.year, _currentPeriod.month + 1, 1);
        endDate = nextMonth;
        break;
      case ChartFilter.threeMonth:
        startDate = _currentPeriod;
        endDate = DateTime(_currentPeriod.year, _currentPeriod.month + 3, 1);
        break;
      case ChartFilter.year:
        startDate = _currentPeriod;
        endDate = DateTime(_currentPeriod.year + 1, 1, 1);
        break;
    }

    // Filter data points within the selected period
    return widget.data
        .where((point) =>
            point.dateTime
                .isAfter(startDate.subtract(const Duration(seconds: 1))) &&
            point.dateTime.isBefore(endDate))
        .toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  /// Calculate appropriate interval for grid lines and Y-axis labels
  double _calculateInterval(double min, double max) {
    final range = max - min;

    // Aim for 4-6 intervals
    if (range <= 1) return 0.2;
    if (range <= 5) return 1;
    if (range <= 10) return 2;
    if (range <= 20) return 5;
    if (range <= 50) return 10;
    if (range <= 100) return 20;

    return range / 5;
  }

  /// Format date for tooltip display
  String _formatDate(DateTime date) {
    final day = date.day.toString();
    final month = _getShortMonthName(date.month);
    return '$day $month';
  }

  /// Get short month name (3 letters)
  String _getShortMonthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month];
  }

  /// Build bottom (X-axis) title widgets
  Widget _buildBottomTitleWidgets(
      double value, TitleMeta meta, List<DataPoint> filteredData) {
    String label;
    bool isCurrentPeriod = false;
    final now = DateTime.now();

    // Check if we're viewing the current period
    final bool isCurrentViewPeriod = _isCurrentViewPeriod();

    switch (_currentFilter) {
      case ChartFilter.week:
        // For week view, show day labels (Mon, Tue, Wed, etc.)
        final dayIndex = value.toInt();
        if (dayIndex < 0 || dayIndex > 6) {
          return const SizedBox.shrink();
        }

        final date = _currentPeriod.add(Duration(days: dayIndex));
        label = _getShortWeekdayName(date.weekday);

        // Check if this is today
        isCurrentPeriod = isCurrentViewPeriod &&
            date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;
        break;

      case ChartFilter.month:
        // For month view, show week markers or specific dates
        // Only show a few labels to avoid crowding
        if (value % 7 != 0 && value < 28) {
          return const SizedBox.shrink();
        }

        final daysIntoMonth = value.toInt();
        final date = DateTime(
            _currentPeriod.year, _currentPeriod.month, 1 + daysIntoMonth);

        if (daysIntoMonth == 0) {
          // First day of month
          label = '${date.day} ${_getShortMonthName(date.month)}';
        } else {
          // Other week markers
          label = '${date.day}';
        }

        // Check if this is the current week
        if (isCurrentViewPeriod) {
          final weekStart = now.subtract(Duration(days: now.weekday % 7));
          final weekEnd = weekStart.add(const Duration(days: 7));
          isCurrentPeriod =
              date.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
                  date.isBefore(weekEnd);
        }
        break;

      case ChartFilter.threeMonth:
        // For 3-month view, show month labels
        final monthOffset = (value / 30).floor(); // Approximate month positions
        if (monthOffset < 0 || monthOffset > 2) {
          return const SizedBox.shrink();
        }

        final month = _currentPeriod.month + monthOffset;
        final adjustedMonth = month > 12 ? month - 12 : month;
        label = _getShortMonthName(adjustedMonth);

        // Check if this is the current month
        isCurrentPeriod = isCurrentViewPeriod &&
            now.year == _currentPeriod.year &&
            now.month == adjustedMonth;
        break;

      case ChartFilter.year:
        // For year view, show bi-monthly labels
        final monthOffset = (value / 30).floor(); // Approximate month positions
        if (monthOffset < 0 || monthOffset > 11 || monthOffset % 2 != 0) {
          return const SizedBox.shrink();
        }

        final month = _currentPeriod.month + monthOffset;
        final adjustedMonth = month > 12 ? month - 12 : month;
        label = _getShortMonthName(adjustedMonth);

        // Check if this is the current month or the next one (bi-monthly grouping)
        isCurrentPeriod = isCurrentViewPeriod &&
            now.year == _currentPeriod.year &&
            (now.month == adjustedMonth || now.month == adjustedMonth + 1);
        break;
    }

    return SideTitleWidget(
      meta: meta,
      space: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: isCurrentPeriod
            ? BoxDecoration(
                color: widget.config.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.config.color.withOpacity(0.3),
                  width: 1,
                ),
              )
            : null,
        child: Text(
          label,
          style: TextStyle(
            color: isCurrentPeriod ? widget.config.color : Colors.grey.shade700,
            fontWeight: isCurrentPeriod ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  /// Get short weekday name
  String _getShortWeekdayName(int weekday) {
    const days = ['', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday];
  }

  /// Build left (Y-axis) title widgets
  Widget _buildLeftTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      // axisSide: meta.axisSide,
      space: 8,
      child: Text(
        '${value.toStringAsFixed(1)}${widget.config.unit}',
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 12,
        ),
      ),
    );
  }

  /// Calculate the X-coordinate for a data point based on its date/time and the current filter
  double _calculateXPosition(
      DateTime dateTime, DateTime startDate, DateTime endDate) {
    final double totalRange;
    final double pointPosition;

    switch (_currentFilter) {
      case ChartFilter.week:
        // For week view, position based on exact days and time within the week
        totalRange = 7.0; // 7 days in a week
        final diffInMillis = dateTime.difference(startDate).inMilliseconds;
        final weekDurationMillis = const Duration(days: 7).inMilliseconds;
        pointPosition = (diffInMillis / weekDurationMillis) * totalRange;
        break;

      case ChartFilter.month:
        // For month view, position based on days within the month
        totalRange = endDate.difference(startDate).inDays.toDouble();
        final diffDays = dateTime.difference(startDate).inDays.toDouble();
        // Add time component for sub-day positioning
        final dayFraction =
            (dateTime.hour * 3600 + dateTime.minute * 60 + dateTime.second) /
                86400.0;
        pointPosition = diffDays + dayFraction;
        break;

      case ChartFilter.threeMonth:
        // For 3-month view, position based on days within the quarter
        totalRange = endDate.difference(startDate).inDays.toDouble();
        final diffDays = dateTime.difference(startDate).inDays.toDouble();
        // Add time component with less weight for quarterly view
        final dayFraction =
            (dateTime.hour * 3600 + dateTime.minute * 60 + dateTime.second) /
                86400.0 *
                0.5;
        pointPosition = diffDays + dayFraction;
        break;

      case ChartFilter.year:
        // For year view, position based on days within the year
        totalRange = endDate.difference(startDate).inDays.toDouble();
        final diffDays = dateTime.difference(startDate).inDays.toDouble();
        pointPosition = diffDays;
        break;
    }

    return pointPosition;
  }

  /// Group data points by date for handling multiple entries per day
  Map<DateTime, List<DataPoint>> _groupPointsByDate(List<DataPoint> points) {
    final groupedPoints = <DateTime, List<DataPoint>>{};

    for (final point in points) {
      // Normalize to just the date part
      final dateOnly = DateTime(
          point.dateTime.year, point.dateTime.month, point.dateTime.day);

      if (!groupedPoints.containsKey(dateOnly)) {
        groupedPoints[dateOnly] = [];
      }
      groupedPoints[dateOnly]!.add(point);
    }

    return groupedPoints;
  }

  /// Check if a date is in the current period based on the current filter
  bool _isInCurrentPeriod(DateTime dateTime) {
    // Get the current date/time
    final now = DateTime.now();

    // Normalize the current period based on the viewed period
    // This ensures highlighting works even when viewing past/future periods
    final bool isCurrentViewPeriod = _isCurrentViewPeriod();
    if (!isCurrentViewPeriod) {
      // If we're not looking at the current period, nothing should be highlighted
      return false;
    }

    switch (_currentFilter) {
      case ChartFilter.week:
        // Current day - highlight today
        return dateTime.year == now.year &&
            dateTime.month == now.month &&
            dateTime.day == now.day;

      case ChartFilter.month:
        // Current week - highlight points within the current week
        // Get start of current week (Sunday)
        final weekStart = now.subtract(Duration(days: now.weekday % 7));
        final weekEnd = weekStart.add(const Duration(days: 7));

        return dateTime
                .isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
            dateTime.isBefore(weekEnd);

      case ChartFilter.threeMonth:
        // Current month - highlight points within the current month
        return dateTime.year == now.year && dateTime.month == now.month;

      case ChartFilter.year:
        // Current quarter - highlight points within the current quarter
        final currentQuarter = (now.month - 1) ~/ 3;
        final dateQuarter = (dateTime.month - 1) ~/ 3;
        return dateTime.year == now.year && dateQuarter == currentQuarter;
    }
  }

  /// Check if the currently viewed period is the current period (today, this month, etc.)
  bool _isCurrentViewPeriod() {
    final now = DateTime.now();

    switch (_currentFilter) {
      case ChartFilter.week:
        // Check if current week is being viewed
        final currentWeekStart = now.subtract(Duration(days: now.weekday % 7));
        final viewWeekStart = _currentPeriod;
        return viewWeekStart.year == currentWeekStart.year &&
            viewWeekStart.month == currentWeekStart.month &&
            viewWeekStart.day == currentWeekStart.day;

      case ChartFilter.month:
        // Check if current month is being viewed
        return _currentPeriod.year == now.year &&
            _currentPeriod.month == now.month;

      case ChartFilter.threeMonth:
        // Check if current quarter is being viewed
        final currentQuarterStart =
            DateTime(now.year, ((now.month - 1) ~/ 3) * 3 + 1, 1);
        return _currentPeriod.year == currentQuarterStart.year &&
            _currentPeriod.month == currentQuarterStart.month;

      case ChartFilter.year:
        // Check if current year is being viewed
        return _currentPeriod.year == now.year;
    }
  }

  /// Find the closest data point to a given spot
  int _findClosestDataPoint(FlSpot spot, List<DataPoint> filteredData) {
    if (filteredData.isEmpty) return -1;

    // Get all spots
    final spots = _generateSpots(filteredData);

    // Find the closest spot
    int closestIndex = -1;
    double minDistance = double.infinity;

    for (int i = 0; i < spots.length; i++) {
      final distance = (spots[i].x - spot.x) * (spots[i].x - spot.x) +
          (spots[i].y - spot.y) * (spots[i].y - spot.y);
      if (distance < minDistance) {
        minDistance = distance;
        closestIndex = i;
      }
    }

    return closestIndex < filteredData.length ? closestIndex : -1;
  }

  /// Generate spots for chart with proper positioning
  List<FlSpot> _generateSpots(List<DataPoint> filteredData) {
    if (filteredData.isEmpty) return [];

    // Sort by date
    filteredData.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    // Calculate period start and end dates
    DateTime startDate;
    DateTime endDate;

    switch (_currentFilter) {
      case ChartFilter.week:
        startDate = _currentPeriod;
        endDate = _currentPeriod.add(const Duration(days: 7));
        break;
      case ChartFilter.month:
        startDate = _currentPeriod;
        endDate = DateTime(_currentPeriod.year, _currentPeriod.month + 1, 1);
        break;
      case ChartFilter.threeMonth:
        startDate = _currentPeriod;
        endDate = DateTime(_currentPeriod.year, _currentPeriod.month + 3, 1);
        break;
      case ChartFilter.year:
        startDate = _currentPeriod;
        endDate = DateTime(_currentPeriod.year + 1, 1, 1);
        break;
    }

    // Group points by date to handle multiple entries per day
    final groupedPoints = _groupPointsByDate(filteredData);
    final spots = <FlSpot>[];

    // Process each group and generate spots
    for (final dateEntry in groupedPoints.entries) {
      final pointsForDay = dateEntry.value;

      // If only one point on this day, position it normally
      if (pointsForDay.length == 1) {
        final point = pointsForDay.first;
        final x = _calculateXPosition(point.dateTime, startDate, endDate);
        spots.add(FlSpot(x, point.value));
      }
      // If multiple points on the same day, space them slightly apart
      else {
        final baseX = _calculateXPosition(dateEntry.key, startDate, endDate);
        final spacing = 0.08; // Slight spacing between points on the same day

        for (int i = 0; i < pointsForDay.length; i++) {
          final offset = (i - (pointsForDay.length - 1) / 2) * spacing;
          spots.add(FlSpot(baseX + offset, pointsForDay[i].value));
        }
      }
    }

    // Sort by X position
    spots.sort((a, b) => a.x.compareTo(b.x));

    // Add linear interpolation for missing data points
    if (spots.length > 1) {
      // If we have gaps in our data (e.g., missing days), we need to interpolate
      final interpolatedSpots = <FlSpot>[];

      // Set the minimum gap size that requires interpolation
      // based on the current filter
      double minGapForInterpolation;
      switch (_currentFilter) {
        case ChartFilter.week:
          minGapForInterpolation = 0.5; // Half a day
          break;
        case ChartFilter.month:
          minGapForInterpolation = 3.0; // 3 days
          break;
        case ChartFilter.threeMonth:
          minGapForInterpolation = 7.0; // 7 days
          break;
        case ChartFilter.year:
          minGapForInterpolation = 15.0; // 15 days
          break;
      }

      interpolatedSpots.add(spots.first);

      for (int i = 0; i < spots.length - 1; i++) {
        final current = spots[i];
        final next = spots[i + 1];
        final gap = next.x - current.x;

        // If the gap is large enough, add interpolated points
        if (gap > minGapForInterpolation) {
          final steps = (gap / minGapForInterpolation).ceil();
          final stepSize = gap / steps;

          for (int j = 1; j < steps; j++) {
            final ratio = j / steps;
            final x = current.x + stepSize * j;
            // Linear interpolation formula: y = y1 + (y2-y1) * (x-x1) / (x2-x1)
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

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            widget.config.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),

          // Filter tabs (placeholder)
          _buildFilterTabs(),
          const SizedBox(height: 16),

          // Navigation and date display (placeholder)
          _buildNavigationRow(),
          const SizedBox(height: 16),

          // Chart area (placeholder)
          _buildChartArea(),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: ChartFilter.values.map((filter) {
          final isSelected = filter == _currentFilter;
          return Expanded(
            child: GestureDetector(
              onTap: () => _changeFilter(filter),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? widget.config.color : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    filter.displayName,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => _navigatePeriod(false),
          icon: const Icon(Icons.chevron_left),
        ),
        Text(
          _getPeriodDisplayText(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        IconButton(
          onPressed: () => _navigatePeriod(true),
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  String _getPeriodDisplayText() {
    // Placeholder implementation - will be enhanced later
    switch (_currentFilter) {
      case ChartFilter.week:
        return '${_currentPeriod.day}-${_currentPeriod.add(const Duration(days: 6)).day} ${_getMonthName(_currentPeriod.month)} ${_currentPeriod.year}';
      case ChartFilter.month:
        return '${_getMonthName(_currentPeriod.month)} ${_currentPeriod.year}';
      case ChartFilter.threeMonth:
        final endMonth = _currentPeriod.month + 2;
        return '${_getMonthName(_currentPeriod.month)}-${_getMonthName(endMonth)} ${_currentPeriod.year}';
      case ChartFilter.year:
        return '${_currentPeriod.year}';
    }
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month];
  }

  /// Get the maximum X value for the chart based on the current filter
  double _getMaxXValue() {
    switch (_currentFilter) {
      case ChartFilter.week:
        return 7.0; // 7 days
      case ChartFilter.month:
        // Get days in the current month
        final year = _currentPeriod.year;
        final month = _currentPeriod.month;
        final daysInMonth = DateTime(year, month + 1, 0).day;
        return daysInMonth.toDouble();
      case ChartFilter.threeMonth:
        return 90.0; // Approximately 3 months
      case ChartFilter.year:
        return 365.0; // Approximately 1 year
    }
  }

  /// Build a highlight for the current period section in the chart
  ExtraLinesData _buildCurrentPeriodHighlight(
      List<DataPoint> filteredData, double minY, double maxY) {
    // Only add highlight if we're viewing the current period
    if (!_isCurrentViewPeriod()) {
      return ExtraLinesData(
          extraLinesOnTop: true, horizontalLines: [], verticalLines: []);
    }

    final now = DateTime.now();
    double startX = 0;
    double endX = 0;

    // Calculate period start and end dates for positioning
    DateTime periodStartDate = _currentPeriod;

    switch (_currentFilter) {
      case ChartFilter.week:
        // Highlight today
        startX = now.difference(periodStartDate).inHours / 24;
        endX = startX + 1.0; // One day
        break;

      case ChartFilter.month:
        // Highlight current week
        final weekStart = now.subtract(Duration(days: now.weekday % 7));
        final weekEnd = weekStart.add(const Duration(days: 7));

        // Convert to X coordinates
        startX = weekStart.difference(periodStartDate).inDays.toDouble();
        if (startX < 0) startX = 0;

        endX = weekEnd.difference(periodStartDate).inDays.toDouble();
        if (endX > _getMaxXValue()) endX = _getMaxXValue();
        break;

      case ChartFilter.threeMonth:
        // Highlight current month
        final monthStart = DateTime(now.year, now.month, 1);
        final monthEnd = DateTime(now.year, now.month + 1, 1);

        // Convert to X coordinates (approximate)
        startX = monthStart.difference(periodStartDate).inDays.toDouble();
        if (startX < 0) startX = 0;

        endX = monthEnd.difference(periodStartDate).inDays.toDouble();
        if (endX > _getMaxXValue()) endX = _getMaxXValue();
        break;

      case ChartFilter.year:
        // Highlight current quarter
        final quarterStart =
            DateTime(now.year, ((now.month - 1) ~/ 3) * 3 + 1, 1);
        final quarterEnd =
            DateTime(now.year, ((now.month - 1) ~/ 3) * 3 + 4, 1);

        // Convert to X coordinates
        startX = quarterStart.difference(periodStartDate).inDays.toDouble();
        if (startX < 0) startX = 0;

        endX = quarterEnd.difference(periodStartDate).inDays.toDouble();
        if (endX > _getMaxXValue()) endX = _getMaxXValue();
        break;
    }

    // Create vertical lines for the current period boundaries
    final List<VerticalLine> verticalLines = [
      VerticalLine(
        x: startX,
        color: widget.config.color.withOpacity(0.3),
        strokeWidth: 1,
        dashArray: [5, 5],
      ),
      VerticalLine(
        x: endX,
        color: widget.config.color.withOpacity(0.3),
        strokeWidth: 1,
        dashArray: [5, 5],
      ),
    ];

    // For the background color, we'll use a series of thin vertical lines
    // to create the appearance of a shaded area
    final double step = 0.5; // Space between vertical lines
    for (double x = startX; x <= endX; x += step) {
      verticalLines.add(
        VerticalLine(
          x: x,
          color: widget.config.color.withOpacity(0.03), // Very light color
          strokeWidth: step * 0.9, // Almost fills the space between lines
        ),
      );
    }

    return ExtraLinesData(
      extraLinesOnTop: false,
      horizontalLines: [],
      verticalLines: verticalLines,
    );
  }

  Widget _buildChartArea() {
    final filteredData = _getFilteredData();

    // If no data, show empty state
    if (filteredData.isEmpty) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'No data available for this period',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    // Get min and max values for Y-axis scaling
    final yValues = filteredData.map((point) => point.value).toList();
    final minY = yValues.reduce((a, b) => a < b ? a : b);
    final maxY = yValues.reduce((a, b) => a > b ? a : b);

    // Add a small padding to the top and bottom
    final yRange = maxY - minY;
    final paddedMinY = minY - (yRange * 0.1);
    final paddedMaxY = maxY + (yRange * 0.1);

    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: widget.config.showGridLines,
            drawVerticalLine: false,
            horizontalInterval: _calculateInterval(paddedMinY, paddedMaxY),
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) =>
                    _buildBottomTitleWidgets(value, meta, filteredData),
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) =>
                    _buildLeftTitleWidgets(value, meta),
                reservedSize: 45,
                interval: _calculateInterval(paddedMinY, paddedMaxY),
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
              left: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          minX: 0,
          maxX: _getMaxXValue(),
          minY: paddedMinY,
          maxY: paddedMaxY,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  // Find the closest data point to this spot
                  final closestPointIndex =
                      _findClosestDataPoint(spot, filteredData);
                  if (closestPointIndex != -1) {
                    final dataPoint = filteredData[closestPointIndex];
                    return LineTooltipItem(
                      '${dataPoint.value} ${widget.config.unit}\n${_formatDate(dataPoint.dateTime)}',
                      TextStyle(
                        color: widget.config.color,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return null;
                }).toList();
              },
            ),
            touchCallback: (event, touchResponse) {
              if (event is FlTapUpEvent) {
                if (touchResponse?.lineBarSpots != null &&
                    touchResponse!.lineBarSpots!.isNotEmpty) {
                  final spot = touchResponse.lineBarSpots!.first;
                  final closestPointIndex =
                      _findClosestDataPoint(spot, filteredData);
                  _selectDataPoint(closestPointIndex);
                } else {
                  _selectDataPoint(null);
                }
              }
            },
            handleBuiltInTouches: true,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: _generateSpots(filteredData),
              isCurved: true,
              curveSmoothness: 0.2,
              color: widget.config.color,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  // Get the original datapoint for this index
                  final isCurrentPoint = index < filteredData.length
                      ? _isInCurrentPeriod(filteredData[index].dateTime)
                      : false;

                  // Emphasize points in current period
                  final isSelected = _selectedPointIndex == index;

                  return FlDotCirclePainter(
                    radius: isSelected ? 6 : (isCurrentPoint ? 5 : 3),
                    color: isCurrentPoint
                        ? widget.config.color
                        : widget.config.color.withOpacity(0.8),
                    strokeWidth: isCurrentPoint ? 2.5 : 2,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: widget.config.backgroundColor != null,
                color: widget.config.backgroundColor?.withOpacity(0.2),
              ),
            ),
          ],
          extraLinesData: _buildCurrentPeriodHighlight(
              filteredData, paddedMinY, paddedMaxY),
        ),
      ),
    );
  }
}
