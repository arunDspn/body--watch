Chart with filters using `fl_chart: ^1.1.1`

# Chart Widget Specification

## Overview
A reusable chart widget for visualizing body measurements (weight, height, BMI, body fat percentage, muscle mass, etc.) with time-based filtering capabilities.

## Widget API Design

### Data Structure
```dart
class DataPoint {
  final DateTime dateTime;
  final double value;
  
  DataPoint({required this.dateTime, required this.value});
}

class ChartConfig {
  final String unit;           // e.g., 'kg', 'cm', '%'
  final String title;          // e.g., 'Weight', 'Height'
  final Color color;           // Line and point color
  final Color? backgroundColor;
  final bool showGridLines;    // Default: true (horizontal only)
  
  ChartConfig({
    required this.unit,
    required this.title,
    required this.color,
    this.backgroundColor,
    this.showGridLines = true,
  });
}
```

### Widget Usage
```dart
BodyMeasurementChart(
  data: List<DataPoint>,
  config: ChartConfig,
  defaultFilter: ChartFilter.month, // Default: Month view
)
```

## Features

## Features

### Time Filters
- **Week**: Shows 7 days (Sun - Sat)
- **Month**: Shows weekly periods (Aug 3, Aug 10, Aug 17, Aug 24, Aug 31)
- **3 Month**: Shows monthly periods (Jul, Aug, Sep)
- **Year**: Shows bi-monthly periods (Jan, Mar, May, Jul, Sep, Nov)

### Filter UI
- **Layout**: Horizontally scrollable tabs
- **Default**: Month filter selected on initial load
- **Navigation**: Left/right arrow buttons with date range display
  - Week: "10-16 March 2025"
  - Month: "March 2025" 
  - 3 Month: "January-March 2025"
  - Year: "2025"

### Data Visualization

#### Data Plotting
- **Chart Type**: Line chart only
- **Multiple entries per day**: All values plotted, positioned slightly apart horizontally within that day's space based on timestamp
- **Data aggregation**: Plot all individual data points (no averaging or aggregation)
- **Missing data**: Linear interpolation between available points
- **Y-axis**: Auto-scaling based on data range (never starts from 0)
- **Grid lines**: Horizontal lines only
- **Data points**: Visible markers on the line with tap interaction

#### Data Point Distribution
- **Week view**: Points distributed across days based on actual date/time
- **Month view**: Points evenly distributed within weekly sections (all July points spread within "Jul" section)
- **3 Month view**: Points evenly distributed within monthly sections  
- **Year view**: Points evenly distributed within bi-monthly sections

#### Current Period Highlighting
- **X-axis labels**: Current period shown in bold text
- **Data points**: Current period points displayed larger/emphasized
- **Definition**:
  - Week: Current day (today)
  - Month: Current week
  - 3 Month: Current month
  - Year: Current year

### Interactions
- **Data point tap**: Shows tooltip with "Value + Date" format (e.g., "84 kg - Sep 16")
- **Navigation**: Previous/next arrow buttons for time period navigation
- **Navigation range**: Up to 10 years back from last data entry
- **Filter switching**: Smooth transitions between time period views
- **Animation**: Subtle animations on filter changes and data updates

### Empty States
- **No data periods**: Show axes with grid lines only (no "no data" message)
- **Chart bounds**: Navigate up to 10 years back from latest data entry, show empty chart beyond available data
- **Navigation**: Previous button remains active even when no data is available

### Technical Specifications
- **Date formats**: 
  - Week view: "10-16 March 2025"
  - Month view: "Aug 3" format for axis labels, "March 2025" for navigation
  - 3 Month view: "Jul, Aug, Sep" for axis, "January-March 2025" for navigation
  - Year view: "Jan, Mar, May..." for axis, "2025" for navigation
- **Units**: Displayed on Y-axis labels and in tooltips based on ChartConfig.unit
- **Performance**: No caching required (optimized for simple data sets)
- **Responsiveness**: Mobile-first design
- **Data handling**: Works with any body measurement type (weight, height, BMI, body fat %, muscle mass, etc.)

## Implementation Phases

### Phase 1: Core Structure & Data Models
**Goal**: Set up basic widget structure and data models
- [ ] Create `DataPoint` class
- [ ] Create `ChartConfig` class  
- [ ] Create `ChartFilter` enum (Week, Month, ThreeMonth, Year)
- [ ] Create basic `BodyMeasurementChart` StatefulWidget
- [ ] Set up initial state variables (currentFilter, currentPeriod, selectedPointIndex)
- [ ] Add basic scaffold with AppBar for testing

### Phase 2: Filter UI Implementation
**Goal**: Build the filter tabs and navigation
- [ ] Create horizontally scrollable filter tabs (Week, Month, 3 Month, Year)
- [ ] Implement filter selection with setState
- [ ] Add left/right arrow navigation buttons
- [ ] Implement date range display logic for each filter type
- [ ] Add period navigation logic (previous/next)
- [ ] Style the filter UI according to design

### Phase 3: Basic Chart Setup
**Goal**: Set up fl_chart with basic line chart
- [ ] Add fl_chart dependency
- [ ] Create basic LineChart widget
- [ ] Implement data filtering based on current period and filter
- [ ] Set up X-axis with proper labels for each filter type
- [ ] Set up Y-axis with auto-scaling
- [ ] Add horizontal grid lines

### Phase 4: Data Point Plotting
**Goal**: Plot data points correctly for each filter type
- [ ] Implement data point positioning for Week view (actual date/time)
- [ ] Implement data point positioning for Month view (weekly sections)
- [ ] Implement data point positioning for 3 Month view (monthly sections)
- [ ] Implement data point positioning for Year view (bi-monthly sections)
- [ ] Handle multiple entries per day (positioning slightly apart)
- [ ] Add linear interpolation for missing data

### Phase 5: Current Period Highlighting
**Goal**: Highlight current periods and data points
- [ ] Implement current period detection logic
- [ ] Bold current period labels on X-axis
- [ ] Emphasize current period data points (larger size)
- [ ] Add visual distinction for current vs non-current periods

### Phase 6: Interactions & Tooltips
**Goal**: Add tap interactions and tooltips
- [ ] Implement data point tap detection
- [ ] Create tooltip widget showing "Value + Date" format
- [ ] Handle tooltip positioning and display
- [ ] Add tap feedback and selection state

### Phase 7: Empty States & Edge Cases
**Goal**: Handle edge cases and empty data
- [ ] Implement empty chart display (axes with grid lines only)
- [ ] Handle navigation beyond available data (10-year range)
- [ ] Test with various data scenarios (no data, single point, etc.)
- [ ] Add proper error handling

### Phase 8: Animations & Polish
**Goal**: Add animations and final touches
- [ ] Add subtle animations for filter changes
- [ ] Add animations for data updates
- [ ] Polish styling and spacing
- [ ] Test performance with larger datasets
- [ ] Final testing and bug fixes

### Phase 9: Testing & Documentation
**Goal**: Ensure reliability and usability
- [ ] Create test data for all measurement types
- [ ] Test all filter combinations
- [ ] Test navigation edge cases
- [ ] Create usage examples
- [ ] Performance testing

## Questions for Clarification

Before starting implementation, please confirm:

1. **Project Structure**: Should the chart widget be in `lib/presentation/chart_2/` or a different location?

2. **Dependencies**: Do you want to add `fl_chart` to pubspec.yaml now, or should I include that in Phase 3?

3. **Styling**: Do you have a specific design system/theme colors to follow, or should I use Material Design defaults?

4. **Data Source**: For testing, should I create mock data, or do you have existing data structure I should use?

5. **Integration**: Should this be integrated into the existing `ChartsView2` widget, or created as a separate reusable component?

6. **Testing Approach**: Do you prefer to test each phase individually, or implement multiple phases before testing?

Which phase would you like to start with?







