import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:watcha_body/presentation/chart_2/models/chart_models.dart';
import 'package:watcha_body/presentation/chart_2/utils/chart_data_transformer.dart';
import 'package:watcha_body/presentation/chart_2/utils/chart_date_utils.dart';
import 'package:watcha_body/presentation/chart_2/widgets/chart_filter_tabs.dart';
import 'package:watcha_body/presentation/chart_2/widgets/chart_navigation_row.dart';

/// A reusable chart widget for visualizing body measurements
class BodyMeasurementChart extends StatefulWidget {
  final List<DataPoint> data;
  final ChartConfig config;
  final ChartFilter defaultFilter;
  final double? goalValue;

  const BodyMeasurementChart({
    super.key,
    required this.data,
    required this.config,
    this.defaultFilter = ChartFilter.month,
    this.goalValue,
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

    if (oldWidget.defaultFilter != widget.defaultFilter) {
      _currentFilter = widget.defaultFilter;
      _currentPeriod = _calculateCurrentPeriod();
      _selectedPointIndex = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Calculate the current period based on the selected filter and current date
  DateTime _calculateCurrentPeriod() {
    return ChartDateUtils.calculateCurrentPeriod(
      _currentFilter,
      DateTime.now(),
    );
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
    // Check if navigation is allowed
    if (isNext && !_canNavigateNext()) {
      return; // Can't navigate to future
    }
    if (!isNext && !_canNavigatePrevious()) {
      return; // Can't navigate beyond 10 years back
    }

    setState(() {
      _currentPeriod = isNext
          ? _getNextPeriod(_currentPeriod, _currentFilter)
          : _getPreviousPeriod(_currentPeriod, _currentFilter);
      _selectedPointIndex = null; // Clear selection when navigating
    });
  }

  /// Get the next period based on current filter
  DateTime _getNextPeriod(DateTime current, ChartFilter filter) {
    return ChartDateUtils.getNextPeriod(current, filter);
  }

  /// Get the previous period based on current filter
  DateTime _getPreviousPeriod(DateTime current, ChartFilter filter) {
    return ChartDateUtils.getPreviousPeriod(current, filter);
  }

  /// Select a data point for tooltip display
  void _selectDataPoint(int? index) {
    setState(() {
      _selectedPointIndex = index;
    });
  }

  /// Get the latest data entry date, or current date if no data
  DateTime _getLatestDataDate() {
    if (widget.data.isEmpty) {
      return DateTime.now();
    }
    return widget.data
        .map((point) => point.dateTime)
        .reduce((a, b) => a.isAfter(b) ? a : b);
  }

  /// Check if we can navigate to the next period
  /// Navigation is limited to current date (can't navigate to future)
  bool _canNavigateNext() {
    final now = DateTime.now();
    final nextPeriod = _getNextPeriod(_currentPeriod, _currentFilter);

    switch (_currentFilter) {
      case ChartFilter.week:
        // Can navigate if next week start is before or equal to today
        return !nextPeriod.isAfter(now);
      case ChartFilter.month:
        // Can navigate if next month is before or equal to current month
        return nextPeriod.year < now.year ||
            (nextPeriod.year == now.year && nextPeriod.month <= now.month);
      case ChartFilter.threeMonth:
        // Can navigate if next quarter start is before or equal to now
        return nextPeriod.year < now.year ||
            (nextPeriod.year == now.year && nextPeriod.month <= now.month);
      case ChartFilter.year:
        // Can navigate if next year is before or equal to current year
        return nextPeriod.year <= now.year;
    }
  }

  /// Check if we can navigate to the previous period
  /// Navigation is limited to 10 years back from latest data entry
  bool _canNavigatePrevious() {
    final latestDate = _getLatestDataDate();
    final tenYearsAgo = DateTime(
      latestDate.year - 10,
      latestDate.month,
      latestDate.day,
    );
    final prevPeriod = _getPreviousPeriod(_currentPeriod, _currentFilter);

    // Check if previous period would be before 10 years ago
    return !prevPeriod.isBefore(tenYearsAgo);
  }

  /// Get data points filtered by the current period and filter
  List<DataPoint> _getFilteredData() {
    return ChartDataTransformer.filterDataByPeriod(
      widget.data,
      _currentPeriod,
      _currentFilter,
    );
  }

  DateTime _getPeriodEndDate(DateTime period, ChartFilter filter) {
    return ChartDateUtils.getPeriodEndDate(period, filter);
  }

  DateTime _startOfWeek(DateTime date) {
    return ChartDateUtils.startOfWeek(date);
  }

  DateTime _endOfWeekExclusive(DateTime date) {
    return ChartDateUtils.endOfWeekExclusive(date);
  }

  List<int> _getMonthLabelDays() {
    return ChartDateUtils.getMonthLabelDays(_currentPeriod);
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

  /// Format date for tooltip display in 'Sep 16' format
  String _formatDate(DateTime date) {
    return ChartDateUtils.formatDate(date);
  }

  /// Get short month name (3 letters)
  String _getShortMonthName(int month) {
    return ChartDateUtils.shortMonthName(month);
  }

  /// Build bottom (X-axis) title widgets
  Widget _buildBottomTitleWidgets(
    double value,
    TitleMeta meta,
    List<DataPoint> filteredData,
  ) {
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
        isCurrentPeriod =
            isCurrentViewPeriod &&
            date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;
        break;

      case ChartFilter.month:
        final labelDays = _getMonthLabelDays();
        final nearestDay = labelDays.reduce((a, b) {
          final distanceToA = (value - (a - 1)).abs();
          final distanceToB = (value - (b - 1)).abs();
          return distanceToA <= distanceToB ? a : b;
        });

        if ((value - (nearestDay - 1)).abs() > 0.75) {
          return const SizedBox.shrink();
        }

        // Get the short month name
        final shortMonth = _getShortMonthName(_currentPeriod.month);

        // Format as "7 Sep", "14 Sep", "21 Sep", "28 Sep"
        label = '$nearestDay $shortMonth';

        // Check if this is the current week
        if (isCurrentViewPeriod) {
          final weekStart = _startOfWeek(now);
          final weekEnd = _endOfWeekExclusive(now);

          final date = DateTime(
            _currentPeriod.year,
            _currentPeriod.month,
            nearestDay,
          );

          isCurrentPeriod =
              date.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
              date.isBefore(weekEnd);
        }
        break;
      case ChartFilter.threeMonth:
        // For 3-month view, show month labels more precisely
        final totalDays = _getMaxXValue();
        final daysPerMonth = totalDays / 3;
        final monthPosition = value / daysPerMonth;
        final monthIndex = monthPosition.floor();

        // Only show labels near the start of each month bucket
        if ((value - (monthIndex * daysPerMonth)).abs() > 2 ||
            monthIndex < 0 ||
            monthIndex > 2) {
          return const SizedBox.shrink();
        }

        final labelDate = DateTime(
          _currentPeriod.year,
          _currentPeriod.month + monthIndex,
          1,
        );
        label = _getShortMonthName(labelDate.month);

        // Check if this is the current month
        isCurrentPeriod =
            isCurrentViewPeriod &&
            now.year == labelDate.year &&
            now.month == labelDate.month;
        break;

      case ChartFilter.year:
        // For year view, show odd months as labels and even months as dividers.
        final daysPerMonth = _getMaxXValue() / 12;
        final monthIndex = (value / daysPerMonth).round();
        final expectedPosition = monthIndex * daysPerMonth;
        final distance = (value - expectedPosition).abs();

        if (distance > daysPerMonth / 2 || monthIndex < 0 || monthIndex > 11) {
          return const SizedBox.shrink();
        }

        final labelDate = DateTime(_currentPeriod.year, monthIndex + 1, 1);
        final calendarMonth = labelDate.month;

        if (calendarMonth.isOdd) {
          label = _getShortMonthName(calendarMonth);
        } else {
          label = '-';
        }

        // Check if this is the current quarter.
        final currentQuarter = (now.month - 1) ~/ 3;
        final labelQuarter = (calendarMonth - 1) ~/ 3;
        isCurrentPeriod =
            isCurrentViewPeriod &&
            now.year == labelDate.year &&
            currentQuarter == labelQuarter;
        break;
    }

    return SideTitleWidget(
      meta: meta,
      space: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: isCurrentPeriod
            ? BoxDecoration(
                color: widget.config.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.config.color.withValues(alpha: 0.35),
                  width: 1,
                ),
              )
            : null,
        child: Text(
          label,
          style: TextStyle(
            color: isCurrentPeriod
                ? widget.config.color
                : Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: isCurrentPeriod ? FontWeight.w700 : FontWeight.normal,
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
        _formatYAxisValue(value),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 12,
        ),
      ),
    );
  }

  String _formatYAxisValue(double value) {
    // Keep axis labels compact and readable on small screens.
    if (value % 1 == 0) {
      return value.toStringAsFixed(0);
    }
    return value.toStringAsFixed(1);
  }

  double _leftAxisReservedSize(BuildContext context) {
    final textScale = MediaQuery.textScalerOf(context).scale(1.0);
    return textScale > 1.15 ? 52 : 46;
  }

  double _roundDownToStep(double value, double step) {
    return (value / step).floorToDouble() * step;
  }

  double _roundUpToStep(double value, double step) {
    return (value / step).ceilToDouble() * step;
  }

  double _niceYAxisInterval(double minY, double maxY) {
    final range = maxY - minY;
    if (range <= 4) return 1;
    if (range <= 8) return 2;
    if (range <= 16) return 4;
    return _calculateInterval(minY, maxY);
  }

  /// Calculate the X-coordinate for a data point based on its date/time and the current filter
  double _calculateXPosition(
    DateTime dateTime,
    DateTime startDate,
    DateTime endDate,
  ) {
    return ChartDataTransformer.calculateXPosition(
      dateTime,
      startDate,
      endDate,
      _currentFilter,
    );
  }

  /// Check if a date is in the current period based on the current filter
  bool _isInCurrentPeriod(DateTime dateTime) {
    return ChartDateUtils.isInCurrentPeriod(
      _currentFilter,
      dateTime,
      _currentPeriod,
      DateTime.now(),
    );
  }

  /// Check if the currently viewed period is the current period (today, this month, etc.)
  bool _isCurrentViewPeriod() {
    return ChartDateUtils.isCurrentViewPeriod(
      _currentFilter,
      _currentPeriod,
      DateTime.now(),
    );
  }

  /// Find the closest data point to a given spot
  int _findClosestDataPoint(FlSpot spot, List<DataPoint> filteredData) {
    return ChartDataTransformer.findClosestDataPoint(
      spot,
      filteredData,
      _currentPeriod,
      _currentFilter,
    );
  }

  /// Generate spots for chart with proper positioning
  List<FlSpot> _generateSpots(List<DataPoint> filteredData) {
    return ChartDataTransformer.generateSpots(
      filteredData,
      _currentPeriod,
      _currentFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          // Text(
          //   widget.config.title,
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //     color: Theme.of(context).colorScheme.onSurface,
          //     fontWeight: FontWeight.w700,
          //     letterSpacing: 0.2,
          //   ),
          // ),
          // const SizedBox(height: 16),

          // Filter tabs
          ChartFilterTabs(
            currentFilter: _currentFilter,
            onFilterChanged: _changeFilter,
          ),
          if (widget.goalValue != null) ...[
            const SizedBox(height: 10),
            _buildGoalLegend(context),
          ],
          const SizedBox(height: 16),

          // Navigation and date display
          ChartNavigationRow(
            canGoPrevious: _canNavigatePrevious(),
            canGoNext: _canNavigateNext(),
            periodText: _getPeriodDisplayText(),
            onPrevious: () => _navigatePeriod(false),
            onNext: () => _navigatePeriod(true),
          ),
          const SizedBox(height: 16),

          // Keep chart updates direct so filter/period changes feel adaptive.
          _buildChartArea(),
        ],
      ),
    );
  }

  String _getPeriodDisplayText() {
    return ChartDateUtils.getPeriodDisplayText(_currentPeriod, _currentFilter);
  }

  /// Get the maximum X value for the chart based on the current filter
  double _getMaxXValue() {
    return ChartDateUtils.getMaxXValue(_currentPeriod, _currentFilter);
  }

  Color _chartGridColor(BuildContext context) {
    return Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.6);
  }

  Widget _buildGoalLegend(BuildContext context) {
    if (widget.goalValue == null) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colorScheme.tertiary.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 34,
            height: 2,
            child: CustomPaint(
              painter: _DashedLegendLinePainter(colorScheme.tertiary),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Goal ${_formatYAxisValue(widget.goalValue!)} ${widget.config.unit}',
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  HorizontalLine? _buildGoalReferenceLine() {
    if (widget.goalValue == null) {
      return null;
    }

    final colorScheme = Theme.of(context).colorScheme;
    return HorizontalLine(
      y: widget.goalValue!,
      color: colorScheme.tertiary,
      strokeWidth: 1.8,
      dashArray: [8, 5],
    );
  }

  ExtraLinesData _buildExtraLinesData(
    List<DataPoint> filteredData,
    double minY,
    double maxY,
  ) {
    final currentPeriodLines = _buildCurrentPeriodHighlight(
      filteredData,
      minY,
      maxY,
    );

    final horizontalLines = List<HorizontalLine>.from(
      currentPeriodLines.horizontalLines,
    );
    final goalLine = _buildGoalReferenceLine();
    if (goalLine != null) {
      horizontalLines.add(goalLine);
    }

    return ExtraLinesData(
      extraLinesOnTop: false,
      horizontalLines: horizontalLines,
      verticalLines: currentPeriodLines.verticalLines,
    );
  }

  /// Build empty chart showing only axes and grid lines (no data message)
  Widget _buildEmptyChart() {
    final colorScheme = Theme.of(context).colorScheme;
    var minY = 0.0;
    var maxY = 100.0;
    if (widget.goalValue != null) {
      minY = (widget.goalValue! - 10).clamp(0.0, double.infinity);
      maxY = widget.goalValue! + 10;
    }
    final yAxisInterval = _niceYAxisInterval(minY, maxY);

    return SizedBox(
      height: 340,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: widget.config.showGridLines,
            drawVerticalLine: false,
            horizontalInterval: yAxisInterval,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: _chartGridColor(context),
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) =>
                    _buildBottomTitleWidgets(value, meta, []),
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) =>
                    _buildLeftTitleWidgets(value, meta),
                reservedSize: _leftAxisReservedSize(context),
                interval: yAxisInterval,
                minIncluded: false,
                maxIncluded: false,
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
              bottom: BorderSide(color: colorScheme.outlineVariant),
              left: BorderSide(color: colorScheme.outlineVariant),
            ),
          ),
          minX: 0,
          maxX: _getMaxXValue(),
          minY: minY,
          maxY: maxY,
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: [], // No data to display
          extraLinesData: _buildExtraLinesData([], minY, maxY),
        ),
      ),
    );
  }

  /// Build chart for single data point with special handling
  Widget _buildSinglePointChart(List<DataPoint> filteredData) {
    final colorScheme = Theme.of(context).colorScheme;
    final dataPoint = filteredData.first;

    // Create a small range around the single point for better visualization
    final value = dataPoint.value;
    final dynamicPadding = value.abs() * 0.015;
    final padding = dynamicPadding < 0.8
        ? 0.8
        : (dynamicPadding > 2.0 ? 2.0 : dynamicPadding);
    final goalValue = widget.goalValue;
    final rawMinY = goalValue == null
        ? value - padding
        : (value < goalValue ? value : goalValue) - padding;
    final rawMaxY = goalValue == null
        ? value + padding
        : (value > goalValue ? value : goalValue) + padding;
    final yAxisInterval = (rawMaxY - rawMinY) <= 2.0 ? 0.5 : 1.0;
    final minY = _roundDownToStep(rawMinY, yAxisInterval);
    final maxY = _roundUpToStep(rawMaxY, yAxisInterval);

    // Calculate position for the single point
    final startDate = _currentPeriod;
    final endDate = _getPeriodEndDate(_currentPeriod, _currentFilter);

    final x = _calculateXPosition(dataPoint.dateTime, startDate, endDate);

    return SizedBox(
      height: 340,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: widget.config.showGridLines,
            drawVerticalLine: false,
            horizontalInterval: yAxisInterval,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: _chartGridColor(context), strokeWidth: 1);
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
                reservedSize: _leftAxisReservedSize(context),
                interval: yAxisInterval,
                minIncluded: false,
                maxIncluded: false,
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
              bottom: BorderSide(color: colorScheme.outlineVariant),
              left: BorderSide(color: colorScheme.outlineVariant),
            ),
          ),
          minX: 0,
          maxX: _getMaxXValue(),
          minY: minY,
          maxY: maxY,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => colorScheme.surfaceContainerLow,
              tooltipPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              tooltipMargin: 12,
              tooltipBorder: BorderSide(
                color: widget.config.color.withValues(alpha: 0.35),
                width: 1.5,
              ),
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  final valueText = '${dataPoint.value} ${widget.config.unit}';
                  final dateText = _formatDate(dataPoint.dateTime);

                  return LineTooltipItem(
                    '$valueText - $dateText',
                    TextStyle(
                      color: widget.config.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.center,
                  );
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
            touchSpotThreshold: 20,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [FlSpot(x, value)],
              isCurved: false,
              color: widget.config.color,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: widget.config.color,
                    strokeWidth: 2.5,
                    strokeColor: Colors.white,
                  );
                },
              ),
            ),
          ],
          extraLinesData: _buildExtraLinesData(filteredData, minY, maxY),
        ),
      ),
    );
  }

  /// Build a highlight for the current period section in the chart
  ExtraLinesData _buildCurrentPeriodHighlight(
    List<DataPoint> filteredData,
    double minY,
    double maxY,
  ) {
    // Only add highlight if we're viewing the current period
    if (!_isCurrentViewPeriod()) {
      return ExtraLinesData(
        extraLinesOnTop: true,
        horizontalLines: [],
        verticalLines: [],
      );
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
        final weekStart = _startOfWeek(now);
        final weekEnd = _endOfWeekExclusive(now);

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
        final quarterStart = DateTime(
          now.year,
          ((now.month - 1) ~/ 3) * 3 + 1,
          1,
        );
        final quarterEnd = DateTime(
          now.year,
          ((now.month - 1) ~/ 3) * 3 + 4,
          1,
        );

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
        color: widget.config.color.withValues(alpha: 0.3),
        strokeWidth: 1,
        dashArray: [5, 5],
      ),
      VerticalLine(
        x: endX,
        color: widget.config.color.withValues(alpha: 0.3),
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
          color: widget.config.color.withValues(
            alpha: 0.03,
          ), // Very light color
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

    // If no data, show empty chart with axes and grid lines (no message)
    if (filteredData.isEmpty) {
      return _buildEmptyChart();
    }

    // Handle single data point edge case
    if (filteredData.length == 1) {
      return _buildSinglePointChart(filteredData);
    }

    // Get min and max values for Y-axis scaling
    final yValues = filteredData.map((point) => point.value).toList();
    if (widget.goalValue != null) {
      yValues.add(widget.goalValue!);
    }
    final minY = yValues.reduce((a, b) => a < b ? a : b);
    final maxY = yValues.reduce((a, b) => a > b ? a : b);

    // Add a small padding to the top and bottom
    final yRange = maxY - minY;
    final rawPaddedMinY = minY - (yRange * 0.1);
    final rawPaddedMaxY = maxY + (yRange * 0.1);
    final yAxisInterval = _niceYAxisInterval(rawPaddedMinY, rawPaddedMaxY);
    final paddedMinY = _roundDownToStep(rawPaddedMinY, yAxisInterval);
    final paddedMaxY = _roundUpToStep(rawPaddedMaxY, yAxisInterval);

    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 340,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: widget.config.showGridLines,
            drawVerticalLine: false,
            horizontalInterval: yAxisInterval,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: _chartGridColor(context),
                strokeWidth: 1,
                dashArray: [5, 5],
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
                reservedSize: _leftAxisReservedSize(context),
                interval: yAxisInterval,
                minIncluded: false,
                maxIncluded: false,
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
              bottom: BorderSide(color: colorScheme.outlineVariant),
              left: BorderSide(color: colorScheme.outlineVariant),
            ),
          ),
          minX: 0,
          maxX: _getMaxXValue(),
          minY: paddedMinY,
          maxY: paddedMaxY,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => colorScheme.surfaceContainerLow,
              tooltipPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              tooltipMargin: 12,
              tooltipBorder: BorderSide(
                color: widget.config.color.withValues(alpha: 0.35),
                width: 1.5,
              ),
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  // Find the closest data point to this spot
                  final closestPointIndex = _findClosestDataPoint(
                    spot,
                    filteredData,
                  );
                  if (closestPointIndex != -1) {
                    final dataPoint = filteredData[closestPointIndex];
                    // Format as "84 kg - Sep 16" according to spec
                    final valueText =
                        '${dataPoint.value} ${widget.config.unit}';
                    final dateText = _formatDate(dataPoint.dateTime);

                    return LineTooltipItem(
                      '$valueText - $dateText',
                      TextStyle(
                        color: widget.config.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }
                  return null;
                }).toList();
              },
            ),
            touchCallback: (event, touchResponse) {
              if (event is FlTapUpEvent) {
                // Handle tap on data point
                if (touchResponse?.lineBarSpots != null &&
                    touchResponse!.lineBarSpots!.isNotEmpty) {
                  final spot = touchResponse.lineBarSpots!.first;
                  final closestPointIndex = _findClosestDataPoint(
                    spot,
                    filteredData,
                  );
                  _selectDataPoint(closestPointIndex);
                } else {
                  // Tap outside - deselect
                  _selectDataPoint(null);
                }
              } else if (event is FlLongPressEnd || event is FlPanEndEvent) {
                // Clear selection when user stops interacting
                setState(() {
                  _selectedPointIndex = null;
                });
              }
            },
            handleBuiltInTouches: true,
            // Enable touch threshold for better tap detection
            touchSpotThreshold: 20,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: _generateSpots(filteredData),
              isCurved: true,
              curveSmoothness: 0.35,
              color: widget.config.color,
              barWidth: 2.5,
              isStrokeCapRound: true,
              gradient: LinearGradient(
                colors: [
                  widget.config.color.withValues(alpha: 0.8),
                  widget.config.color,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  // Get the original datapoint for this index
                  final isCurrentPoint = index < filteredData.length
                      ? _isInCurrentPeriod(filteredData[index].dateTime)
                      : false;

                  // Check if this point is selected
                  final isSelected = _selectedPointIndex == index;

                  // Determine dot appearance based on state
                  double radius;
                  Color dotColor;
                  double strokeWidth;

                  if (isSelected) {
                    // Selected point - largest and most prominent
                    radius = 7;
                    dotColor = widget.config.color;
                    strokeWidth = 3;
                  } else if (isCurrentPoint) {
                    // Current period point - emphasized
                    radius = 5;
                    dotColor = widget.config.color;
                    strokeWidth = 2.5;
                  } else {
                    // Regular point - smaller and slightly transparent
                    radius = 3.5;
                    dotColor = widget.config.color.withValues(alpha: 0.85);
                    strokeWidth = 2;
                  }

                  return FlDotCirclePainter(
                    radius: radius,
                    color: dotColor,
                    strokeWidth: strokeWidth,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: widget.config.backgroundColor != null,
                color: widget.config.backgroundColor?.withValues(alpha: 0.2),
              ),
            ),
          ],
          extraLinesData: _buildExtraLinesData(
            filteredData,
            paddedMinY,
            paddedMaxY,
          ),
        ),
      ),
    );
  }
}

class _DashedLegendLinePainter extends CustomPainter {
  const _DashedLegendLinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const dashWidth = 7.0;
    const gapWidth = 4.0;
    var startX = 0.0;
    final centerY = size.height / 2;

    while (startX < size.width) {
      final endX = startX + dashWidth > size.width
          ? size.width
          : startX + dashWidth;
      canvas.drawLine(Offset(startX, centerY), Offset(endX, centerY), paint);
      startX += dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLegendLinePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
