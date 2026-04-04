import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';
import 'package:watcha_body/presentation/add_initial_measurement_data/cubit/add_initial_measurement_data_cubit.dart';
import 'package:watcha_body/size_config.dart';

class AddInitialMeasurementDataModal extends StatefulWidget {
  const AddInitialMeasurementDataModal({super.key, required this.type});

  final MeasurementTargetModel type;

  @override
  State<AddInitialMeasurementDataModal> createState() =>
      _AddInitialMeasurementDataModalState();
}

class _AddInitialMeasurementDataModalState
    extends State<AddInitialMeasurementDataModal> {
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  final _decimalInputFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d{0,2}'),
  );

  late String _measurementUnit;
  DateTime? _selectedDate;
  DateTime? _goalDueDate;

  late final TextEditingController _measurementController;
  late final TextEditingController _dateController;
  late final TextEditingController _goalController;
  late final TextEditingController _goalNoteController;
  late final TextEditingController _goalDueDateController;
  late final TextEditingController _notesController;

  final _formKey = GlobalKey<FormState>();
  bool _didSetPreferredUnit = false;
  bool _isGoalEnabled = false;

  @override
  void initState() {
    super.initState();
    _measurementUnit = widget.type.units.first.unit;
    _selectedDate = DateTime.now();

    _measurementController = TextEditingController();
    _dateController = TextEditingController(
      text: _dateFormatter.format(_selectedDate!),
    );
    _goalController = TextEditingController();
    _goalNoteController = TextEditingController();
    _goalDueDateController = TextEditingController();
    _notesController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_didSetPreferredUnit) {
      return;
    }

    final appPrefState =
        context.read<UserPreferencesCubit>().state as UserPreferencesLoaded;

    final preferredUnit = appPrefState.preferences
        .firstWhereOrNull(
          (element) => element.metricCode == widget.type.metricCode,
        )
        ?.preferredUnit;

    if (preferredUnit != null &&
        widget.type.units.any((unit) => unit.unit == preferredUnit)) {
      setState(() {
        _measurementUnit = preferredUnit;
      });
    }

    _didSetPreferredUnit = true;
  }

  @override
  void dispose() {
    _measurementController.dispose();
    _dateController.dispose();
    _goalController.dispose();
    _goalNoteController.dispose();
    _goalDueDateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxModalHeight = MediaQuery.of(context).size.height * 0.82;

    return SafeArea(
      child: BlocListener<AddInitialMeasurementDataCubit, AddInitialMeasurementDataState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message.isEmpty ? 'Failed' : message),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            success: () {
              // Dismiss pop-up first to ensure the success message is visible
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Success'),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.pop(context);
            },
            orElse: () {},
          );
        },
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxModalHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      Text(
                        widget.type.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: _onSavePressed,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Flexible(
                  fit: FlexFit.loose,
                  child: SingleChildScrollView(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: const InputDecorationTheme(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.94,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Initial Value',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: SizeConfig.screenWidth! * 0.3,
                                    child: TextFormField(
                                      textAlign: TextAlign.end,
                                      validator: _validatePositiveNumber,
                                      inputFormatters: [_decimalInputFormatter],
                                      controller: _measurementController,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                            decimal: true,
                                          ),
                                      textInputAction: TextInputAction.next,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  DropdownButton<String>(
                                    value: _measurementUnit,
                                    onChanged: (newValue) {
                                      if (newValue == null) {
                                        return;
                                      }
                                      setState(() {
                                        _measurementUnit = newValue;
                                      });
                                    },
                                    items: widget.type.units
                                        .map<DropdownMenuItem<String>>((
                                          MetricUnitsModel value,
                                        ) {
                                          return DropdownMenuItem<String>(
                                            value: value.unit,
                                            child: Text(
                                              value.unit,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyLarge,
                                            ),
                                          );
                                        })
                                        .toList(),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Date',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: SizeConfig.screenWidth! * 0.3,
                                    child: TextFormField(
                                      readOnly: true,
                                      showCursor: false,
                                      enableInteractiveSelection: false,
                                      onTap: _selectMeasurementDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                      controller: _dateController,
                                    ),
                                  ),
                                  const Icon(Icons.calendar_today_rounded),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Set Goal',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const Spacer(),
                                  Switch.adaptive(
                                    value: _isGoalEnabled,
                                    onChanged: (value) {
                                      setState(() {
                                        _isGoalEnabled = value;
                                        if (!_isGoalEnabled) {
                                          _goalController.clear();
                                          _goalNoteController.clear();
                                          _goalDueDate = null;
                                          _goalDueDateController.clear();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              if (_isGoalEnabled) ...[
                                const Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Goal Value',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: SizeConfig.screenWidth! * 0.3,
                                      child: TextFormField(
                                        textAlign: TextAlign.end,
                                        validator: (value) {
                                          if (!_isGoalEnabled) {
                                            return null;
                                          }
                                          return _validatePositiveNumber(value);
                                        },
                                        inputFormatters: [
                                          _decimalInputFormatter,
                                        ],
                                        controller: _goalController,
                                        keyboardType:
                                            const TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                        textInputAction: TextInputAction.next,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _measurementUnit,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Goal Due Date',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: SizeConfig.screenWidth! * 0.3,
                                      child: TextFormField(
                                        readOnly: true,
                                        showCursor: false,
                                        enableInteractiveSelection: false,
                                        onTap: _selectGoalDueDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        controller: _goalDueDateController,
                                        decoration: const InputDecoration(
                                          hintText: 'Optional',
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: _goalDueDate == null
                                          ? _selectGoalDueDate
                                          : () {
                                              setState(() {
                                                _goalDueDate = null;
                                                _goalDueDateController.clear();
                                              });
                                            },
                                      icon: Icon(
                                        _goalDueDate == null
                                            ? Icons.event_rounded
                                            : Icons.close_rounded,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Goal Note',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: SizeConfig.screenWidth! * 0.3,
                                      child: TextFormField(
                                        controller: _goalNoteController,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          hintText: 'Optional goal note',
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                        maxLines: 2,
                                        minLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              const Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Notes',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: SizeConfig.screenWidth! * 0.3,
                                    child: TextFormField(
                                      controller: _notesController,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                        hintText: 'Optional notes',
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                      maxLines: 2,
                                      minLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.012),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validatePositiveNumber(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) {
      return 'Please enter some value';
    }
    final number = double.tryParse(input);
    if (number == null) {
      return 'Please enter a valid number';
    }
    if (number <= 0) {
      return 'Please enter a number greater than zero';
    }
    return null;
  }

  Future<void> _onSavePressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final value = double.parse(_measurementController.text.trim());
    final toBaseFactor = widget.type.units
        .firstWhere((element) => element.unit == _measurementUnit)
        .toBaseFactor;
    final convertedValue = value * toBaseFactor;
    final measurement = MeasurementEntity.createNew(
      date: _selectedDate ?? DateTime.now(),
      value: convertedValue,
      notes: _notesController.text.trim(),
      targetId: widget.type.id,
    );

    if (!_isGoalEnabled) {
      await context.read<AddInitialMeasurementDataCubit>().insertDataOnly(
        measurement: measurement,
      );
      return;
    }

    final goalValue = double.parse(_goalController.text.trim()) * toBaseFactor;
    await context.read<AddInitialMeasurementDataCubit>().insertDataWithGoal(
      measurement: measurement,
      targetValue: goalValue,
      dueDate: _goalDueDate,
      goalNote: _goalNoteController.text.trim().isEmpty
          ? null
          : _goalNoteController.text.trim(),
    );
  }

  Future<void> _selectMeasurementDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(2021);
    final initialDate = _selectedDate == null
        ? now
        : _selectedDate!.isBefore(firstDate)
        ? firstDate
        : _selectedDate!.isAfter(now)
        ? now
        : _selectedDate!;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: now,
    );

    if (picked == null || picked == _selectedDate) {
      return;
    }

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );

    if (pickedTime == null) {
      return;
    }

    setState(() {
      _selectedDate = DateTime(
        picked.year,
        picked.month,
        picked.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      _dateController.text = _dateFormatter.format(_selectedDate!);
    });
  }

  Future<void> _selectGoalDueDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(2021);
    final initialDate = _goalDueDate ?? _selectedDate ?? now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(firstDate)
          ? firstDate
          : initialDate.isAfter(now)
          ? now
          : initialDate,
      firstDate: firstDate,
      lastDate: DateTime(now.year + 20),
    );

    if (picked == null) {
      return;
    }

    setState(() {
      _goalDueDate = DateTime(picked.year, picked.month, picked.day);
      _goalDueDateController.text = _dateFormatter.format(_goalDueDate!);
    });
  }
}
