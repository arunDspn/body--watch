import 'package:flutter/material.dart';

/// A generic dropdown widget with search and dynamic item creation capabilities.
///
/// This widget follows Material Design 3 guidelines and provides:
/// - Real-time search with case-insensitive substring matching
/// - Dynamic item creation when no results are found
/// - Loading states for async operations
/// - Auto-selection of newly created items
///
/// Type parameter [T] represents the type of items in the dropdown.
class CustomDropDown<T> extends StatefulWidget {
  /// List of dropdown items
  final List<T> items;

  /// Function to convert item [T] to display string
  final String Function(T) displayBuilder;

  /// Callback when an item is selected
  final Function(T) onItemSelected;

  /// Callback when creating a new item (receives the search string)
  final Function(String) onAddNewItem;

  /// Currently selected item
  final T? selectedItem;

  /// Label displayed above the dropdown
  final String? labelText;

  /// Placeholder text when no item is selected
  final String? hintText;

  /// Template for "add new" suggestion. Use {query} as placeholder
  final String addNewItemLabel;

  /// Shows loading indicator when true
  final bool isLoading;

  const CustomDropDown({
    required this.items,
    required this.displayBuilder,
    required this.onItemSelected,
    required this.onAddNewItem,
    this.selectedItem,
    this.labelText,
    this.hintText,
    this.addNewItemLabel = 'Add "{query}" as new tag',
    this.isLoading = false,
    super.key,
  });

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<T> _filteredItems = [];
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isDropdownOpen = false;
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update filtered items when items list changes
    if (oldWidget.items != widget.items) {
      _filterItems(_searchController.text);
    }

    // Update display when selected item changes
    if (oldWidget.selectedItem != widget.selectedItem) {
      _updateDisplayText();
    }
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    _filterItems(query);

    // Open dropdown when user starts typing
    if (query.isNotEmpty && !_isDropdownOpen) {
      _openDropdown();
    }
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus && !_isDropdownOpen) {
      _openDropdown();
    }
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items.where((item) {
          final displayText = widget.displayBuilder(item).toLowerCase();
          return displayText.contains(query.toLowerCase());
        }).toList();
      }
    });

    // Update overlay if it's open
    if (_isDropdownOpen) {
      _overlayEntry?.markNeedsBuild();
    }
  }

  void _updateDisplayText() {
    if (widget.selectedItem != null) {
      final displayText = widget.displayBuilder(widget.selectedItem as T);
      _searchController.text = displayText;
    } else {
      _searchController.clear();
    }
  }

  void _openDropdown() {
    if (_isDropdownOpen) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (!mounted) {
      _isDropdownOpen = false;
      return;
    }
    setState(() {
      _isDropdownOpen = false;
    });
  }

  void _onItemTapped(T item) {
    widget.onItemSelected(item);
    _searchController.text = widget.displayBuilder(item);
    _closeDropdown();
    _focusNode.unfocus();
  }

  void _onAddNewItemTapped() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      widget.onAddNewItem(query);
      _closeDropdown();
      _focusNode.unfocus();
    }
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 4.0,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 4.0),
          child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300.0),
              child: _buildDropdownContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownContent() {
    if (widget.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final query = _searchController.text.trim();
    final hasResults = _filteredItems.isNotEmpty;
    final showAddNew = query.isNotEmpty && !hasResults;

    if (!hasResults && query.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Start typing to search...',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        // Filtered items
        ..._filteredItems.map((item) {
          final isSelected = widget.selectedItem == item;
          return ListTile(
            title: Text(widget.displayBuilder(item)),
            selected: isSelected,
            trailing: isSelected ? const Icon(Icons.check) : null,
            onTap: () => _onItemTapped(item),
          );
        }),

        // Add new item option
        if (showAddNew)
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: Text(
              widget.addNewItemLabel.replaceAll('{query}', query),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: _onAddNewItemTapped,
          ),

        // No results message (when not showing add new)
        if (!hasResults && !showAddNew)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'No results found',
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _filterItems('');
                  },
                ),
              Icon(
                _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              ),
            ],
          ),
        ),
        onTap: () {
          if (!_isDropdownOpen) {
            _openDropdown();
          }
        },
      ),
    );
  }
}
