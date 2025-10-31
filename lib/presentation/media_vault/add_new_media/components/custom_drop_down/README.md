# Custom DropDown Widget

A generic, reusable dropdown widget with search and dynamic item creation capabilities. Follows Material Design 3 guidelines.

## Features
- 🔍 **Search functionality** - Real-time filtering with case-insensitive substring matching
- ➕ **Dynamic item creation** - Add new items when search yields no results
- 🎨 **Material Design 3** - Follows Material guidelines for styling and behavior
- 🔧 **Generic type support** - Works with any data type via `displayBuilder`
- ⚡ **Loading states** - Shows loading indicator during async operations
- 🎯 **Auto-selection** - Newly created items are automatically selected

## API Reference

### Constructor Parameters

```dart
CustomDropDown<T>({
  required List<T> items,
  required String Function(T) displayBuilder,
  required Function(T) onItemSelected,
  required Function(String) onAddNewItem,
  T? selectedItem,
  String? labelText,
  String? hintText,
  String addNewItemLabel = 'Add "{query}" as new tag',
  bool isLoading = false,
})
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `items` | `List<T>` | ✅ | List of dropdown items |
| `displayBuilder` | `String Function(T)` | ✅ | Function to convert item to display string |
| `onItemSelected` | `Function(T)` | ✅ | Callback when an item is selected |
| `onAddNewItem` | `Function(String)` | ✅ | Callback when creating a new item (receives the search string) |
| `selectedItem` | `T?` | ❌ | Currently selected item |
| `labelText` | `String?` | ❌ | Label displayed above the dropdown |
| `hintText` | `String?` | ❌ | Placeholder text when no item is selected |
| `addNewItemLabel` | `String` | ❌ | Template for "add new" suggestion. Use `{query}` placeholder |
| `isLoading` | `bool` | ❌ | Shows loading indicator when true (default: false) |

## Behavior

### Search
- Dropdown opens automatically when user starts typing
- Case-insensitive substring matching
- Activates from the first character
- Filters items in real-time

### No Results Found
- Shows clickable suggestion: "Add '{searchText}' as new tag"
- Tapping suggestion calls `onAddNewItem(String name)`
- Parent (Bloc) handles adding the item
- Shows loading state during addition
- Newly added item is automatically selected
- Dropdown closes after selection

### Item Selection
- Dropdown closes immediately after selecting an item
- Calls `onItemSelected(T item)`
- Parent updates `selectedItem` prop to reflect selection

## Usage Examples

### Example 1: With ImageTagModel

```dart
// In your widget (managed by Bloc)
CustomDropDown<ImageTagModel>(
  items: state.availableTags,
  displayBuilder: (tag) => tag.tag,
  selectedItem: state.selectedTag,
  onItemSelected: (tag) {
    context.read<MediaBloc>().add(TagSelected(tag));
  },
  onAddNewItem: (tagName) {
    context.read<MediaBloc>().add(CreateNewTag(tagName));
  },
  labelText: 'Select Tag',
  hintText: 'Choose or create a tag',
  isLoading: state.isAddingTag,
)
```

### Example 2: With String

```dart
CustomDropDown<String>(
  items: ['Biceps', 'Triceps', 'Chest', 'Back'],
  displayBuilder: (item) => item,
  selectedItem: selectedMuscleGroup,
  onItemSelected: (item) {
    setState(() => selectedMuscleGroup = item);
  },
  onAddNewItem: (name) {
    // Add to list and select
    setState(() {
      muscleGroups.add(name);
      selectedMuscleGroup = name;
    });
  },
  labelText: 'Muscle Group',
)
```

### Example 3: With Custom Model

```dart
class Category {
  final int id;
  final String name;
  final IconData icon;
}

CustomDropDown<Category>(
  items: categories,
  displayBuilder: (cat) => cat.name,
  selectedItem: currentCategory,
  onItemSelected: (cat) {
    updateCategory(cat);
  },
  onAddNewItem: (categoryName) {
    createCategory(categoryName);
  },
  labelText: 'Category',
  addNewItemLabel: 'Create category "{query}"',
)
```

## Data Flow (with Bloc)

```
User Action → Widget Callback → Bloc Event → Bloc State Update → Widget Rebuild
```

### Typical Flow for Adding New Item:

1. User types "Shoulders" in search
2. No matching items found
3. User taps "Add 'Shoulders' as new tag"
4. Widget calls `onAddNewItem("Shoulders")`
5. Parent calls `bloc.add(CreateNewTag("Shoulders"))`
6. Bloc creates tag via repository
7. Bloc emits new state with:
   - Updated items list (includes new tag)
   - `selectedItem` set to new tag
   - `isLoading = false`
8. Widget rebuilds with new state
9. Dropdown shows selection and closes

## Implementation Notes

- **Stateless widget** - All state managed by parent (Bloc/Provider/setState)
- **No built-in validation** - Parent handles duplicate checking, length limits, etc.
- **Theme-aware** - Respects Material theme colors, typography, and spacing
- **Accessible** - Follows Material accessibility guidelines
- **Performance** - Efficient filtering and rendering for large lists

## Material Design Guidelines

This widget follows Material Design 3 specifications:
- Uses `DropdownMenu` or similar Material components
- Proper elevation and shadows
- Ripple effects on interactions
- Theme-based colors (primary, surface, etc.)
- Standard spacing and sizing
- Dropdown arrow icon
- Focus states and keyboard navigation

## Technical Architecture

```
CustomDropDown<T> (Stateless)
├── Search TextField
├── Dropdown Overlay
│   ├── Filtered Items List
│   └── "Add New" Option (when no results)
└── Loading Indicator
```

## Dependencies

- `flutter/material.dart` - Material Design components
- No external packages required

## Testing Considerations

When testing this widget:
- Mock the `onItemSelected` and `onAddNewItem` callbacks
- Test filtering with various search strings
- Verify "add new" appears when no results found
- Test loading state display
- Verify selection and dropdown closing behavior
- Test with empty items list
- Test keyboard navigation and accessibility