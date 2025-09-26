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

  Widget _buildChartArea() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.show_chart,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 8),
            Text(
              'Chart will be implemented in Phase 3',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Current Filter: ${_currentFilter.displayName}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
            Text(
              'Data Points: ${widget.data.length}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
