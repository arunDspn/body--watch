import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/data/repositories/goals_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/domain/measurement/models/goal_entity.dart';
import 'cubit/chart_detail_cubit.dart';
import 'models/chart_models.dart';
import 'widgets/body_measurement_chart.dart';

class ChartsView2 extends StatefulWidget {
  const ChartsView2({
    super.key,
    this.data,
    this.targetId,
    this.userId = 1,
    this.valueDivisor = 1,
    this.config,
    this.defaultFilter = ChartFilter.month,
  });

  final List<DataPoint>? data;
  final int? targetId;
  final int userId;
  final double valueDivisor;
  final ChartConfig? config;
  final ChartFilter defaultFilter;

  @override
  State<ChartsView2> createState() => _ChartsView2State();
}

class _ChartsView2State extends State<ChartsView2> {
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  final DateFormat _dayMonthFormatter = DateFormat('d MMM');
  ChartDetailCubit? _chartDetailCubit;

  double get _safeDivisor => widget.valueDivisor == 0 ? 1 : widget.valueDivisor;

  bool get _shouldLoadFromRepository =>
      widget.targetId != null && widget.data == null;

  @override
  void initState() {
    super.initState();
    if (_shouldLoadFromRepository) {
      _chartDetailCubit = ChartDetailCubit(
        context.read<MeasurementRepository>(),
        context.read<GoalsRepository>(),
      )..load(targetId: widget.targetId!, userId: widget.userId);
    }
  }

  @override
  void dispose() {
    _chartDetailCubit?.close();
    super.dispose();
  }

  // Mock data for testing
  List<DataPoint> get _mockWeightData {
    final now = DateTime.now();
    return [
      DataPoint(dateTime: now.subtract(const Duration(days: 30)), value: 70.5),
      DataPoint(dateTime: now.subtract(const Duration(days: 28)), value: 70.2),
      DataPoint(dateTime: now.subtract(const Duration(days: 25)), value: 70.0),
      DataPoint(dateTime: now.subtract(const Duration(days: 22)), value: 69.8),
      DataPoint(dateTime: now.subtract(const Duration(days: 20)), value: 69.5),
      DataPoint(dateTime: now.subtract(const Duration(days: 18)), value: 69.3),
      DataPoint(dateTime: now.subtract(const Duration(days: 15)), value: 69.0),
      // Multiple entries on the same day (12 days ago)
      DataPoint(
        dateTime: now.subtract(const Duration(days: 12, hours: 8)),
        value: 68.8,
      ),
      DataPoint(
        dateTime: now.subtract(const Duration(days: 12, hours: 20)),
        value: 68.6,
      ),
      DataPoint(dateTime: now.subtract(const Duration(days: 10)), value: 68.5),
      DataPoint(dateTime: now.subtract(const Duration(days: 8)), value: 68.2),
      // Multiple entries on the same day (5 days ago)
      DataPoint(
        dateTime: now.subtract(const Duration(days: 5, hours: 7)),
        value: 68.0,
      ),
      DataPoint(
        dateTime: now.subtract(const Duration(days: 5, hours: 19)),
        value: 67.9,
      ),
      DataPoint(dateTime: now.subtract(const Duration(days: 3)), value: 67.8),
      // Gap here to demonstrate interpolation (between day 3 and day 1)
      DataPoint(
        dateTime: now.subtract(const Duration(days: 1, hours: 12)),
        value: 67.5,
      ),
      DataPoint(dateTime: now, value: 67.3),
    ];
  }

  ChartConfig get _weightChartConfig {
    return const ChartConfig(
      unit: 'kg',
      title: 'Weight Progress',
      color: Colors.blue,
      backgroundColor: Colors.blue,
      showGridLines: true,
    );
  }

  ChartConfig get _chartConfig => widget.config ?? _weightChartConfig;

  List<DataPoint> _sortedData(List<DataPoint> source) {
    final copy = List<DataPoint>.from(source);
    copy.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return copy;
  }

  String _valueText(double value, ChartConfig config) {
    return '${value.toStringAsFixed(1)} ${config.unit}'.trim();
  }

  String _relativeDateText(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final diff = today.difference(target).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff > 1 && diff <= 7) return '$diff days ago';
    return _dayMonthFormatter.format(date);
  }

  double _displayGoalTarget(GoalEntity goal) {
    return goal.targetValue / _safeDivisor;
  }

  double _storageGoalTarget(double displayTarget) {
    return displayTarget * _safeDivisor;
  }

  bool _isGoalAchieved({
    required GoalEntity goal,
    required double latestValue,
  }) {
    final target = _displayGoalTarget(goal);
    return goal.direction == GoalDirection.increase
        ? latestValue >= target
        : latestValue <= target;
  }

  String _goalDirectionLabel(GoalDirection direction) {
    return direction == GoalDirection.increase ? 'Increase' : 'Decrease';
  }

  Future<void> _showGoalEditorSheet(
    BuildContext context, {
    required ChartConfig config,
    GoalEntity? activeGoal,
  }) async {
    if (!_shouldLoadFromRepository || _chartDetailCubit == null) {
      return;
    }

    final formData = await showModalBottomSheet<_GoalEditorFormData>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (sheetContext) {
        return _GoalEditorSheet(
          config: config,
          initialTargetValue: activeGoal == null
              ? null
              : _displayGoalTarget(activeGoal),
          initialDirection: activeGoal?.direction ?? GoalDirection.increase,
          initialDueDate: activeGoal?.dueDate,
          initialNote: activeGoal?.notes,
        );
      },
    );

    if (formData != null && mounted) {
      final goal = GoalEntity(
        id: activeGoal?.id,
        targetId: widget.targetId!,
        targetValue: _storageGoalTarget(formData.targetValue),
        startDate: DateTime.now(),
        dueDate: formData.dueDate,
        notes: formData.note,
        userId: widget.userId,
        direction: formData.direction,
      );

      final error = await _chartDetailCubit!.createOrReplaceGoal(goal: goal);

      if (!mounted) return;

      if (error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save goal: $error')));
        return;
      }

      await _chartDetailCubit!.load(
        targetId: widget.targetId!,
        userId: widget.userId,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(activeGoal == null ? 'Goal created' : 'Goal updated'),
        ),
      );
    }
  }

  Future<void> _completeGoal(
    BuildContext context, {
    required GoalEntity goal,
  }) async {
    if (!_shouldLoadFromRepository ||
        _chartDetailCubit == null ||
        goal.id == null) {
      return;
    }

    final shouldProceed = await _showGoalActionConfirmation(
      context,
      title: 'Complete Goal?',
      message:
          'This will mark the active goal as completed. You can still create a new goal later.',
      confirmLabel: 'Complete',
    );

    if (!shouldProceed) {
      return;
    }

    final error = await _chartDetailCubit!.completeGoal(goalId: goal.id!);
    if (!mounted) return;

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to complete goal: $error')),
      );
      return;
    }

    await _chartDetailCubit!.load(
      targetId: widget.targetId!,
      userId: widget.userId,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Goal marked as completed')));
  }

  Future<void> _cancelGoal(
    BuildContext context, {
    required GoalEntity goal,
  }) async {
    if (!_shouldLoadFromRepository ||
        _chartDetailCubit == null ||
        goal.id == null) {
      return;
    }

    final shouldProceed = await _showGoalActionConfirmation(
      context,
      title: 'Cancel Goal?',
      message:
          'This will close the active goal without marking it as achieved. You can set another goal anytime.',
      confirmLabel: 'Cancel Goal',
      isDestructive: true,
    );

    if (!shouldProceed) {
      return;
    }

    final error = await _chartDetailCubit!.cancelGoal(goalId: goal.id!);
    if (!mounted) return;

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to cancel goal: $error')));
      return;
    }

    await _chartDetailCubit!.load(
      targetId: widget.targetId!,
      userId: widget.userId,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Goal cancelled')));
  }

  Future<bool> _showGoalActionConfirmation(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    bool isDestructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final colorScheme = Theme.of(dialogContext).colorScheme;
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Keep Goal'),
            ),
            FilledButton(
              style: isDestructive
                  ? FilledButton.styleFrom(
                      backgroundColor: colorScheme.error,
                      foregroundColor: colorScheme.onError,
                    )
                  : null,
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(confirmLabel),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  Widget _buildGoalCard(
    BuildContext context, {
    required List<DataPoint> chartData,
    required ChartConfig config,
    GoalEntity? activeGoal,
  }) {
    if (!_shouldLoadFromRepository) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final measurements = _sortedData(chartData);
    final latestValue = measurements.isEmpty ? null : measurements.first.value;

    if (activeGoal == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.surfaceContainerHigh,
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Goal',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No active goal set yet.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.icon(
                onPressed: () => _showGoalEditorSheet(context, config: config),
                icon: const Icon(Icons.flag_rounded),
                label: const Text('Set Goal'),
              ),
            ),
          ],
        ),
      );
    }

    final target = _displayGoalTarget(activeGoal);
    final achieved = latestValue == null
        ? false
        : _isGoalAchieved(goal: activeGoal, latestValue: latestValue);
    final remaining = latestValue == null
        ? null
        : activeGoal.direction == GoalDirection.increase
        ? target - latestValue
        : latestValue - target;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.surfaceContainerHigh,
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Goal',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: achieved
                      ? colorScheme.tertiaryContainer
                      : colorScheme.primaryContainer,
                ),
                child: Text(
                  achieved ? 'Achieved' : 'Active',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: achieved
                        ? colorScheme.onTertiaryContainer
                        : colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Target: ${_valueText(target, config)}',
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            'Direction: ${_goalDirectionLabel(activeGoal.direction)}',
            style: textTheme.bodyMedium,
          ),
          if (activeGoal.dueDate != null)
            Text(
              'Due: ${_dateFormatter.format(activeGoal.dueDate!)}',
              style: textTheme.bodyMedium,
            ),
          if (latestValue != null)
            Text(
              achieved
                  ? 'Goal reached with latest value ${_valueText(latestValue, config)}'
                  : 'Remaining: ${remaining!.toStringAsFixed(1)} ${config.unit}',
              style: textTheme.bodyMedium?.copyWith(
                color: achieved
                    ? colorScheme.tertiary
                    : colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          if ((activeGoal.notes ?? '').isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              activeGoal.notes!,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.tonalIcon(
                onPressed: () => _showGoalEditorSheet(
                  context,
                  config: config,
                  activeGoal: activeGoal,
                ),
                icon: const Icon(Icons.edit_rounded),
                label: const Text('Edit'),
              ),
              FilledButton.tonalIcon(
                onPressed: activeGoal.id == null
                    ? null
                    : () => _completeGoal(context, goal: activeGoal),
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text('Complete'),
              ),
              OutlinedButton.icon(
                onPressed: activeGoal.id == null
                    ? null
                    : () => _cancelGoal(context, goal: activeGoal),
                icon: const Icon(Icons.cancel_outlined),
                label: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMeasurementElements(
    BuildContext context, {
    required List<DataPoint> chartData,
    required ChartConfig config,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final measurements = _sortedData(chartData);

    if (measurements.isEmpty) {
      return const SizedBox.shrink();
    }

    final latest = measurements.first;
    final recentRows = measurements.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Measurements',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                '${measurements.length}',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: colorScheme.primaryContainer,
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.45),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.bolt_rounded,
                  size: 20,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latest',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _valueText(latest.value, config),
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _relativeDateText(latest.dateTime),
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onPrimaryContainer.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colorScheme.surfaceContainerHigh,
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: recentRows.asMap().entries.map((entry) {
                final index = entry.key;
                final measurement = entry.value;
                final hasOlder = index + 1 < recentRows.length;
                final delta = hasOlder
                    ? measurement.value - recentRows[index + 1].value
                    : null;
                final isUp = delta != null && delta > 0;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 3,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colorScheme.surface,
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -1),
                      leading: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: colorScheme.secondaryContainer,
                        ),
                        child: Icon(
                          Icons.show_chart_rounded,
                          size: 16,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      title: Text(
                        _valueText(measurement.value, config),
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        _dateFormatter.format(measurement.dateTime),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      trailing: delta == null
                          ? Text(
                              _relativeDateText(measurement.dateTime),
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color:
                                    (isUp
                                            ? colorScheme.tertiaryContainer
                                            : colorScheme.errorContainer)
                                        .withValues(alpha: 0.85),
                              ),
                              child: Text(
                                '${isUp ? '+' : ''}${delta.toStringAsFixed(1)}',
                                style: textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isUp
                                      ? colorScheme.onTertiaryContainer
                                      : colorScheme.onErrorContainer,
                                ),
                              ),
                            ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required List<DataPoint> chartData,
    required ChartConfig config,
    required bool isUsingMockData,
    GoalEntity? activeGoal,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUsingMockData ? 'Body Measurement Charts' : config.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isUsingMockData) ...[
                Text(
                  'Phase 8: Animations & Polish Complete',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Smooth animations on filter changes and navigation (400ms fade/scale), enhanced filter tabs with InkWell ripple effects and shadows, polished navigation with animated opacity transitions, improved chart styling with rounded corners, subtle shadows, and dashed grid lines, gradient line styling with increased smoothness (0.35), and performance-optimized animations using SingleTickerProvider.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 24),
              ],

              BodyMeasurementChart(
                data: chartData,
                config: config,
                defaultFilter: widget.defaultFilter,
                goalValue: activeGoal == null
                    ? null
                    : _displayGoalTarget(activeGoal),
              ),

              const SizedBox(height: 24),

              _buildGoalCard(
                context,
                chartData: chartData,
                config: config,
                activeGoal: activeGoal,
              ),

              if (_shouldLoadFromRepository) const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.all(8),
                child: _buildMeasurementElements(
                  context,
                  chartData: chartData,
                  config: config,
                ),
              ),

              const SizedBox(height: 24),

              if (isUsingMockData)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mock Data Summary',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Total data points: ${chartData.length}'),
                        Text(
                          'Date range: ${chartData.first.dateTime.toString().split(' ')[0]} to ${chartData.last.dateTime.toString().split(' ')[0]}',
                        ),
                        Text(
                          '${config.title} range: ${chartData.map((e) => e.value).reduce((a, b) => a < b ? a : b)} ${config.unit} to ${chartData.map((e) => e.value).reduce((a, b) => a > b ? a : b)} ${config.unit}',
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = _chartConfig;
    final isUsingMockData = widget.data == null && widget.targetId == null;

    if (_shouldLoadFromRepository && _chartDetailCubit != null) {
      return BlocBuilder<ChartDetailCubit, ChartDetailState>(
        bloc: _chartDetailCubit,
        builder: (context, state) {
          switch (state) {
            case ChartDetailInitial():
            case ChartDetailLoading():
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    config.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
                body: const Center(child: CircularProgressIndicator()),
              );
            case ChartDetailFailure(:final message):
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    config.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline, size: 34),
                        const SizedBox(height: 12),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        FilledButton.icon(
                          onPressed: () {
                            _chartDetailCubit!.load(
                              targetId: widget.targetId!,
                              userId: widget.userId,
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            case ChartDetailLoaded(:final measurements, :final activeGoal):
              final chartData = measurements
                  .map(
                    (measurement) => DataPoint(
                      dateTime: measurement.date,
                      value: measurement.value / _safeDivisor,
                    ),
                  )
                  .toList();
              return _buildScaffold(
                context,
                chartData: chartData,
                config: config,
                isUsingMockData: false,
                activeGoal: activeGoal,
              );
            default:
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    config.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
                body: const Center(child: CircularProgressIndicator()),
              );
          }
        },
      );
    }

    final chartData = widget.data ?? _mockWeightData;

    return _buildScaffold(
      context,
      chartData: chartData,
      config: config,
      isUsingMockData: isUsingMockData,
    );
  }
}

class _GoalEditorFormData {
  const _GoalEditorFormData({
    required this.targetValue,
    required this.direction,
    this.dueDate,
    this.note,
  });

  final double targetValue;
  final GoalDirection direction;
  final DateTime? dueDate;
  final String? note;
}

class _GoalEditorSheet extends StatefulWidget {
  const _GoalEditorSheet({
    required this.config,
    required this.initialDirection,
    this.initialTargetValue,
    this.initialDueDate,
    this.initialNote,
  });

  final ChartConfig config;
  final double? initialTargetValue;
  final GoalDirection initialDirection;
  final DateTime? initialDueDate;
  final String? initialNote;

  @override
  State<_GoalEditorSheet> createState() => _GoalEditorSheetState();
}

class _GoalEditorSheetState extends State<_GoalEditorSheet> {
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  late final TextEditingController _targetController;
  late final TextEditingController _noteController;

  late GoalDirection _direction;
  DateTime? _dueDate;
  String? _inputError;

  @override
  void initState() {
    super.initState();
    _targetController = TextEditingController(
      text: widget.initialTargetValue == null
          ? ''
          : widget.initialTargetValue!.toStringAsFixed(1),
    );
    _noteController = TextEditingController(text: widget.initialNote ?? '');
    _direction = widget.initialDirection;
    _dueDate = widget.initialDueDate;
  }

  @override
  void dispose() {
    _targetController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      firstDate: now,
      initialDate: _dueDate ?? now,
      lastDate: DateTime(now.year + 10),
    );
    if (picked == null || !mounted) return;
    setState(() {
      _dueDate = DateTime(picked.year, picked.month, picked.day);
    });
  }

  void _submit() {
    final parsedTarget = double.tryParse(
      _targetController.text.trim().replaceAll(',', '.'),
    );
    if (parsedTarget == null || parsedTarget <= 0) {
      setState(() {
        _inputError = 'Enter a valid positive number';
      });
      return;
    }

    final note = _noteController.text.trim();
    Navigator.of(context).pop(
      _GoalEditorFormData(
        targetValue: parsedTarget,
        direction: _direction,
        dueDate: _dueDate,
        note: note.isEmpty ? null : note,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16,
          12,
          16,
          16 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.initialTargetValue == null ? 'Set New Goal' : 'Edit Goal',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _targetController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: 'Target Value (${widget.config.unit})',
                errorText: _inputError,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<GoalDirection>(
              value: _direction,
              items: const [
                DropdownMenuItem(
                  value: GoalDirection.increase,
                  child: Text('Increase'),
                ),
                DropdownMenuItem(
                  value: GoalDirection.decrease,
                  child: Text('Decrease'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _direction = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Direction'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: _pickDate,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Due Date (Optional)',
                      ),
                      child: Text(
                        _dueDate == null
                            ? 'Optional'
                            : _dateFormatter.format(_dueDate!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    if (_dueDate == null) {
                      _pickDate();
                      return;
                    }
                    setState(() {
                      _dueDate = null;
                    });
                  },
                  icon: Icon(
                    _dueDate == null
                        ? Icons.event_rounded
                        : Icons.close_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _noteController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Goal Note (Optional)',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check_rounded),
                label: const Text('Save Goal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
