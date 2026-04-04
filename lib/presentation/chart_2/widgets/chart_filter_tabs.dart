import 'package:flutter/material.dart';
import 'package:watcha_body/presentation/chart_2/models/chart_models.dart';

/// Material 3 expressive filter tab bar for selecting chart time range.
///
/// Renders a pill-track with animated sliding selection indicator.
class ChartFilterTabs extends StatelessWidget {
  const ChartFilterTabs({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  final ChartFilter currentFilter;
  final ValueChanged<ChartFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.55),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.45),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: ChartFilter.values.map((filter) {
          final isSelected = filter == currentFilter;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onFilterChanged(filter),
                  borderRadius: BorderRadius.circular(14),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOutCubic,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colorScheme.primaryContainer
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: isSelected
                          ? Border.all(
                              color: colorScheme.primary.withValues(
                                alpha: 0.35,
                              ),
                            )
                          : null,
                    ),
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 240),
                        curve: Curves.easeOutCubic,
                        style: TextStyle(
                          color: isSelected
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSurfaceVariant,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontSize: 13,
                          letterSpacing: isSelected ? 0.1 : 0,
                        ),
                        child: Text(filter.displayName),
                      ),
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
}
