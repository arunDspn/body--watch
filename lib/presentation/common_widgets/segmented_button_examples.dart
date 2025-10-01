import 'package:flutter/material.dart';
import 'package:watcha_body/presentation/common_widgets/reusable_segmented_button.dart';

/// Example usage of the ReusableSegmentedButton widget

// For your LengthUnit enum - with nullable selection
class LengthChoiceChipExample extends StatelessWidget {
  const LengthChoiceChipExample({
    Key? key,
    required this.onSelected,
    this.selectedLengthUnit, // Can be null - no initial selection required
  }) : super(key: key);

  final void Function(LengthUnit? lengthUnit) onSelected;
  final LengthUnit? selectedLengthUnit;

  @override
  Widget build(BuildContext context) {
    return ReusableSegmentedButton<LengthUnit>(
      sectionName: 'Length Unit',
      items: LengthUnit.values,
      selectedItem:
          selectedLengthUnit, // null is allowed - starts with no selection
      onSelectionChanged: (selection) {
        // selection can be null when user deselects or starts with no selection
        onSelected(selection as LengthUnit?);
      },
    );
  }
}

// For your WeightUnit enum - with nullable selection
class WeightChoiceChipExample extends StatelessWidget {
  const WeightChoiceChipExample({
    Key? key,
    required this.onSelected,
    this.selectedWeightUnit, // Can be null - no initial selection required
  }) : super(key: key);

  final void Function(WeightUnit? weightUnit) onSelected;
  final WeightUnit? selectedWeightUnit;

  @override
  Widget build(BuildContext context) {
    return ReusableSegmentedButton<WeightUnit>(
      sectionName: 'Weight Unit',
      items: WeightUnit.values,
      selectedItem:
          selectedWeightUnit, // null is allowed - starts with no selection
      onSelectionChanged: (selection) {
        // selection can be null when user deselects or starts with no selection
        onSelected(selection as WeightUnit?);
      },
    );
  }
}

// Example with custom labels
class CustomLabelExample extends StatelessWidget {
  const CustomLabelExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableSegmentedButton<String>(
      sectionName: 'Options',
      items: const ['option1', 'option2', 'option3'],
      getLabel: (item) => item.toUpperCase(), // Custom label function
      onSelectionChanged: (selection) {
        print('Selected: $selection');
      },
    );
  }
}

// Example with multiple selection
class MultipleSelectionExample extends StatelessWidget {
  const MultipleSelectionExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableSegmentedButton<String>(
      sectionName: 'Multiple Choice',
      items: const ['A', 'B', 'C', 'D'],
      multipleSelection: true,
      onSelectionChanged: (selection) {
        Set<String> selectedSet = selection as Set<String>;
        print('Selected items: $selectedSet');
      },
    );
  }
}

// Example enum for demonstration
enum LengthUnit { meters, feet, inches }

enum WeightUnit { kg, pounds }
