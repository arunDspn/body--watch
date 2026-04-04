# Chart 2 Baseline And Guardrails

This document defines the baseline behavior that must remain stable during the chart_2 refactor and Material 3 expressive polish.

## Scope

Applies to:
- ChartsView2 screen composition
- BodyMeasurementChart filter, navigation, rendering, labels, tooltip, and selection behavior
- DataPoint and ChartConfig usage contracts

Primary files:
- lib/presentation/chart_2/charts_view2.dart
- lib/presentation/chart_2/widgets/body_measurement_chart.dart
- lib/presentation/chart_2/models/chart_models.dart
- lib/presentation/chart_2/chart_features.md

## Current Behavior Baseline

### Filters
- Available filters: Week, Month, 3 Month, Year.
- Default filter is provided through BodyMeasurementChart.defaultFilter.
- Filter change recalculates current period and clears selected point.
- Filter change triggers transition animation.

### Period Navigation
- Previous and next controls navigate period based on active filter.
- Next navigation is blocked for future periods relative to today.
- Previous navigation is bounded to 10 years before latest data date.
- Navigation clears selected point and animates.

### Data Filtering
- Period windows are treated as [start, end) boundaries.
- Data is sorted chronologically after filtering.
- Empty periods render chart shell with axes and grid only.

### X Axis Labels
- Week: weekday short labels.
- Month: weekly cadence labels in month context.
- 3 Month: monthly labels across quarter.
- Year: alternating month emphasis style.

### Data Rendering
- Line chart with visible dot markers.
- Multiple same-day points are offset horizontally.
- Missing spans may be linearly interpolated.
- Current period region and points are visually emphasized.

### Interaction
- Tap on point shows tooltip with value and date.
- Tap outside clears selection.
- Interaction end clears selection state.

## Non Regression Acceptance Criteria

All items must pass before phase completion.

1. Filter switch updates:
- Visible period title changes correctly for each filter.
- Rendered dataset belongs to the selected period window.

2. Navigation bounds:
- Next cannot move into invalid future period.
- Previous cannot move beyond defined lower bound.
- Disabled navigation visual state matches actual availability.

3. Axis readability:
- Labels are visible and non-empty for representative sparse and dense datasets.
- Labels do not disappear due to fragile tolerance logic.

4. Tooltip safety:
- No crash for empty data, one-point data, same-day duplicates, or sparse data.
- Tooltip text follows value plus unit plus date format.

5. Data point stability:
- Same-day points preserve deterministic order and spacing.
- Highlight logic applies only to current viewed period.

6. Empty state:
- Empty chart remains visually stable and navigable.
- No no-data banner is shown unless design changes explicitly require it.

## Material 3 Expressive Guardrails

These are required in UI polish phases.

1. Color roles:
- Prefer theme colorScheme roles over hardcoded colors.
- Maintain sufficient contrast for labels, controls, and chart marks.

2. Shape and elevation:
- Use consistent rounded shape families for controls and chart containers.
- Use subtle elevation layering for hierarchy instead of heavy shadows.

3. Motion:
- Keep transitions meaningful and calm.
- Use easing that communicates hierarchy change, not decorative motion.

4. Typography:
- Preserve clear hierarchy for title, period label, controls, and axis labels.
- Avoid compressed text in touch targets and chips.

5. Touch and accessibility:
- Keep interactive targets comfortable for mobile.
- Ensure selected and disabled states are visually distinct.

## Test Matrix For Upcoming Phases

1. Date boundaries:
- End of month, start of month, leap year February.
- Year transition (Dec to Jan).

2. Density patterns:
- Empty dataset.
- Single point dataset.
- Multiple points on one day.
- Long gaps that trigger interpolation.

3. Interaction paths:
- Tap nearest point, tap empty area, rapid filter switch and navigation.

4. Period labels:
- Week with Sunday and Monday boundaries.
- Month with different month lengths.
- 3 month crossing year boundary.
- Year view month placement consistency.

## Step 1 Sign Off Checklist

- Baseline documented and reviewed.
- Acceptance criteria approved.
- Material 3 expressive guardrails agreed.
- Test matrix agreed for implementation in later phases.
