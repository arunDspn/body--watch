import 'package:flutter/material.dart';

class CustomTargetEditorFormData {
  const CustomTargetEditorFormData({
    required this.name,
    required this.metricType,
    required this.category,
  });

  final String name;
  final String metricType; // 'length' or 'body_composition'
  final String category;
}

class CustomTargetEditorSheet extends StatefulWidget {
  const CustomTargetEditorSheet({
    Key? key,
    this.initialName,
    this.initialMetricType,
    this.initialCategory,
    this.isEditMode = false,
  }) : super(key: key);

  final String? initialName;
  final String? initialMetricType;
  final String? initialCategory;
  final bool isEditMode;

  @override
  State<CustomTargetEditorSheet> createState() =>
      _CustomTargetEditorSheetState();
}

class _CustomTargetEditorSheetState extends State<CustomTargetEditorSheet> {
  late final TextEditingController _nameController;
  late String _metricType;
  late String _category;
  String? _nameError;

  static const List<String> _metricTypes = ['length', 'body_composition'];

  static const List<String> _categories = [
    'upper_body',
    'lower_body',
    'core',
    'arms',
    'legs',
    'vitals',
    'composition',
    'other',
  ];

  static const Map<String, String> _metricTypeLabels = {
    'length': 'Length (Circumference)',
    'body_composition': 'Body Composition',
  };

  static const Map<String, String> _categoryLabels = {
    'upper_body': 'Upper Body',
    'lower_body': 'Lower Body',
    'core': 'Core',
    'arms': 'Arms',
    'legs': 'Legs',
    'vitals': 'Vitals',
    'composition': 'Composition',
    'other': 'Other',
  };

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _metricType = widget.initialMetricType ?? 'length';
    _category = widget.initialCategory ?? 'other';
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();

    // Validation
    if (name.isEmpty) {
      setState(() {
        _nameError = 'Target name is required';
      });
      return;
    }

    if (name.length > 50) {
      setState(() {
        _nameError = 'Target name must be 50 characters or less';
      });
      return;
    }

    // Clear error on successful validation
    setState(() {
      _nameError = null;
    });

    Navigator.of(context).pop(
      CustomTargetEditorFormData(
        name: name,
        metricType: _metricType,
        category: _category,
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
            // Title
            Text(
              widget.isEditMode ? 'Edit Custom Target' : 'Create Custom Target',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),

            // Target Name Input
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Target Name',
                hintText: 'e.g., Forearm Circumference',
                errorText: _nameError,
                counterText: '${_nameController.text.length}/50',
              ),
              maxLength: 50,
              onChanged: (_) {
                setState(() {}); // Update character counter
              },
            ),
            const SizedBox(height: 12),

            // Metric Type Dropdown
            DropdownButtonFormField<String>(
              value: _metricType,
              items: _metricTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(_metricTypeLabels[type] ?? type),
                );
              }).toList(),
              onChanged: widget.isEditMode
                  ? null // Disable in edit mode
                  : (value) {
                      if (value == null) return;
                      setState(() {
                        _metricType = value;
                      });
                    },
              decoration: InputDecoration(
                labelText: 'Metric Type',
                hintText: 'Select measurement type',
                suffixIcon: widget.isEditMode ? const Icon(Icons.lock) : null,
              ),
            ),
            if (widget.isEditMode)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  'Metric type cannot be changed after creation',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            const SizedBox(height: 12),

            // Category Dropdown
            DropdownButtonFormField<String>(
              value: _category,
              items: _categories.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(_categoryLabels[cat] ?? cat),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _category = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Category',
                hintText: 'Select category for organization',
              ),
            ),
            const SizedBox(height: 16),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check_rounded),
                label: Text(
                  widget.isEditMode ? 'Update Target' : 'Create Target',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
