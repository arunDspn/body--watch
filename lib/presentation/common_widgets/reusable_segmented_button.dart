import 'package:flutter/material.dart';
import 'package:watcha_body/presentation/settings/settings_view.dart';

/// A reusable widget that displays a section with segmented buttons
///
/// [T] is the type of items in the list (e.g., enum values, strings, etc.)
class ReusableSegmentedButton<T> extends StatefulWidget {
  const ReusableSegmentedButton({
    Key? key,
    required this.sectionName,
    required this.items,
    required this.onSelectionChanged,
    this.selectedItem,
    this.getLabel,
    this.multipleSelection = false,
  }) : super(key: key);

  /// The title/name of the section
  final String sectionName;

  /// List of items to display as segments
  final List<T> items;

  /// Callback when selection changes
  /// For single selection: passes the selected item (can be null)
  /// For multiple selection: passes the set of selected items
  final void Function(T? selection) onSelectionChanged;

  /// Initially selected item (for single selection)
  final T? selectedItem;

  /// Function to get display label for each item
  /// If null, will use item.toString() or item.name for enums
  final String Function(T item)? getLabel;

  /// Whether to allow multiple selection (defaults to false)
  final bool multipleSelection;

  @override
  State<ReusableSegmentedButton<T>> createState() =>
      _ReusableSegmentedButtonState<T>();
}

class _ReusableSegmentedButtonState<T>
    extends State<ReusableSegmentedButton<T>> {
  late Set<T> _selectedItems;

  @override
  void initState() {
    super.initState();
    // Always start with empty selection to allow nullable/no initial selection
    _selectedItems =
        widget.selectedItem != null ? {widget.selectedItem!} : <T>{};
  }

  @override
  void didUpdateWidget(ReusableSegmentedButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.multipleSelection &&
        widget.selectedItem != oldWidget.selectedItem) {
      _selectedItems =
          widget.selectedItem != null ? {widget.selectedItem!} : <T>{};
    }
  }

  String _getItemLabel(T item) {
    if (widget.getLabel != null) {
      return widget.getLabel!(item);
    }

    // Handle enum types by using .name property
    if (item is Enum) {
      return (item as dynamic).name;
    }

    return item.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sectionName,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Center(
              child: SegmentedButton<T>(
                segments: widget.items
                    .map(
                      (item) => ButtonSegment<T>(
                        value: item,
                        label: Text(_getItemLabel(item)),
                      ),
                    )
                    .toList(),
                emptySelectionAllowed: true,
                selected: _selectedItems,
                multiSelectionEnabled: widget.multipleSelection,
                onSelectionChanged: (Set<T> selection) {
                  setState(() {
                    _selectedItems = selection;
                  });

                  if (widget.multipleSelection) {
                    widget.onSelectionChanged(selection.first);
                  } else {
                    widget.onSelectionChanged(
                        selection.isNotEmpty ? selection.first : null);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// /// Container widget for settings sections (if not already defined elsewhere)
// class SettingsChildContainer extends StatelessWidget {
//   const SettingsChildContainer({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Theme.of(context).colorScheme.onPrimaryContainer,
//         ),
//         width: double.infinity,
//         child: child,
//       ),
//     );
//   }
// }
