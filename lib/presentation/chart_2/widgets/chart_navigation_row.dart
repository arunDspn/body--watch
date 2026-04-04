import 'package:flutter/material.dart';

/// Material 3 expressive period navigation row for chart date browsing.
///
/// Renders prev/next tonal icon buttons with an animated period label pill
/// between them.
class ChartNavigationRow extends StatelessWidget {
  const ChartNavigationRow({
    super.key,
    required this.canGoPrevious,
    required this.canGoNext,
    required this.periodText,
    required this.onPrevious,
    required this.onNext,
  });

  final bool canGoPrevious;
  final bool canGoNext;
  final String periodText;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        IconButton.filledTonal(
          onPressed: canGoPrevious ? onPrevious : null,
          icon: const Icon(Icons.chevron_left),
          style: IconButton.styleFrom(
            minimumSize: const Size(44, 44),
            backgroundColor: colorScheme.secondaryContainer.withValues(
              alpha: canGoPrevious ? 1 : 0.4,
            ),
            foregroundColor: colorScheme.onSecondaryContainer,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 260),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.08),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: Container(
              key: ValueKey<String>(periodText),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
              ),
              child: Text(
                periodText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton.filledTonal(
          onPressed: canGoNext ? onNext : null,
          icon: const Icon(Icons.chevron_right),
          style: IconButton.styleFrom(
            minimumSize: const Size(44, 44),
            backgroundColor: colorScheme.secondaryContainer.withValues(
              alpha: canGoNext ? 1 : 0.4,
            ),
            foregroundColor: colorScheme.onSecondaryContainer,
          ),
        ),
      ],
    );
  }
}
