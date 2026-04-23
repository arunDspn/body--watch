import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/data/repositories/goals_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/services/body_composition_service.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/measurement/models/goal_entity.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';

class BodyCompositionEntryModal extends StatefulWidget {
  const BodyCompositionEntryModal({
    super.key,
    required this.type,
    this.measurementId,
    this.initialValue,
    this.initialDate,
    this.initialNotes,
    this.enableGoal = false,
    this.closeParentOnSuccess = false,
  });

  final MeasurementTargetModel type;
  final int? measurementId;
  final double? initialValue;
  final DateTime? initialDate;
  final String? initialNotes;
  final bool enableGoal;
  final bool closeParentOnSuccess;

  @override
  State<BodyCompositionEntryModal> createState() =>
      _BodyCompositionEntryModalState();
}

class _BodyCompositionEntryModalState extends State<BodyCompositionEntryModal> {
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  final _decimalInputFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d{0,2}'),
  );
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _measurementController;
  late final TextEditingController _weightController;
  late final TextEditingController _dateController;
  late final TextEditingController _notesController;
  late final TextEditingController _goalController;
  late final TextEditingController _goalNoteController;
  late final TextEditingController _goalDueDateController;

  late final MeasurementRepository _measurementRepository;
  late final GoalsRepository _goalsRepository;
  late final BodyCompositionService _bodyCompositionService;

  DateTime? _selectedDate;
  DateTime? _goalDueDate;
  GoalDirection _goalDirection = GoalDirection.increase;
  String _measurementUnit = '%';
  String _weightUnit = 'kg';
  bool _didLoadPreferences = false;
  bool _didSeedInitialValue = false;
  bool _isGoalEnabled = false;
  bool _isSaving = false;
  double? _sameDayWeightKg;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _measurementController = TextEditingController();
    _weightController = TextEditingController();
    _dateController = TextEditingController(
      text: _dateFormatter.format(_selectedDate!),
    );
    _notesController = TextEditingController(text: widget.initialNotes ?? '');
    _goalController = TextEditingController();
    _goalNoteController = TextEditingController();
    _goalDueDateController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_didLoadPreferences) {
      return;
    }

    _measurementRepository = context.read<MeasurementRepository>();
    _goalsRepository = context.read<GoalsRepository>();
    _bodyCompositionService = BodyCompositionService(
      databaseService: DatabaseService(),
      measurementRepository: _measurementRepository,
    );

    final preferenceState = context.read<UserPreferencesCubit>().state;
    if (preferenceState is UserPreferencesLoaded) {
      final preferredMeasurementUnit = preferenceState.preferences
          .firstWhereOrNull(
            (element) => element.metricCode == widget.type.metricCode,
          )
          ?.preferredUnit;
      if (preferredMeasurementUnit != null &&
          BodyCompositionService.supportedUnits.contains(
            preferredMeasurementUnit,
          )) {
        _measurementUnit = preferredMeasurementUnit;
      }

      final preferredWeightUnit = preferenceState.preferences
          .firstWhereOrNull((element) => element.metricCode == 'weight')
          ?.preferredUnit;
      if (preferredWeightUnit == 'kg' || preferredWeightUnit == 'lbs') {
        _weightUnit = preferredWeightUnit!;
      }
    }

    _didLoadPreferences = true;
    _refreshDateContext(seedInitialValue: true);
  }

  @override
  void dispose() {
    _measurementController.dispose();
    _weightController.dispose();
    _dateController.dispose();
    _notesController.dispose();
    _goalController.dispose();
    _goalNoteController.dispose();
    _goalDueDateController.dispose();
    super.dispose();
  }

  bool get _weightIsRequired =>
      _sameDayWeightKg == null && _measurementUnit != '%';

  Future<void> _refreshDateContext({bool seedInitialValue = false}) async {
    final selectedDate = _selectedDate;
    if (selectedDate == null) {
      return;
    }

    final dateContext = await _bodyCompositionService.getDateContext(
      date: selectedDate,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _sameDayWeightKg = dateContext.sameDayWeightKg;
    });

    if (seedInitialValue) {
      _seedInitialMeasurementValue();
    }
  }

  void _seedInitialMeasurementValue() {
    if (_didSeedInitialValue || widget.initialValue == null) {
      return;
    }

    final displayValue = _bodyCompositionService
        .convertCanonicalPercentToDisplayValue(
          canonicalPercent: widget.initialValue!,
          outputUnit: _measurementUnit,
          bodyWeightKg: _sameDayWeightKg,
        );

    if (displayValue != null) {
      _measurementController.text = _formatNumber(displayValue);
    }
    _didSeedInitialValue = true;
  }

  void _refreshDisplayedInitialValue() {
    if (widget.initialValue == null) {
      _measurementController.clear();
      return;
    }

    final displayValue = _bodyCompositionService
        .convertCanonicalPercentToDisplayValue(
          canonicalPercent: widget.initialValue!,
          outputUnit: _measurementUnit,
          bodyWeightKg: _sameDayWeightKg,
        );

    _measurementController.text = displayValue == null
        ? ''
        : _formatNumber(displayValue);
  }

  String _formatNumber(double value) {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
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

  String? _validateWeightValue(String? value) {
    if (!_weightIsRequired && (value == null || value.trim().isEmpty)) {
      return null;
    }
    return _validatePositiveNumber(value);
  }

  Future<void> _onSavePressed() async {
    if (!_formKey.currentState!.validate() || _isSaving) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final measurementValue = double.parse(_measurementController.text.trim());
      final enteredWeightValue = _weightController.text.trim().isEmpty
          ? null
          : double.parse(_weightController.text.trim());

      final payload = await _bodyCompositionService.buildManualSavePayload(
        target: widget.type,
        date: _selectedDate ?? DateTime.now(),
        inputValue: measurementValue,
        inputUnit: _measurementUnit,
        notes: _notesController.text.trim(),
        enteredWeightValue: enteredWeightValue,
        weightUnit: _weightUnit,
        measurementId: widget.measurementId,
      );

      final saveResult = await _bodyCompositionService.saveManualEntry(
        payload: payload,
      );

      final saveSucceeded = await saveResult.fold((failure) async {
        _showSnackBar(message: failure, isError: true);
        return false;
      }, (_) async => true);

      if (!saveSucceeded) {
        return;
      }

      if (_isGoalEnabled) {
        final resolvedWeightKg =
            payload.weightMeasurement?.value ?? _sameDayWeightKg;
        final goalValue = _bodyCompositionService
            .convertInputToCanonicalPercent(
              inputValue: double.parse(_goalController.text.trim()),
              inputUnit: _measurementUnit,
              bodyWeightKg: resolvedWeightKg,
            );

        final goal = GoalEntity(
          targetId: widget.type.id,
          targetValue: goalValue,
          startDate: _selectedDate ?? DateTime.now(),
          dueDate: _goalDueDate,
          notes: _goalNoteController.text.trim().isEmpty
              ? null
              : _goalNoteController.text.trim(),
          userId: 1,
          direction: _goalDirection,
        );

        final goalResult = await _goalsRepository.createOrReplaceActiveGoal(
          goal: goal,
        );

        final goalSucceeded = await goalResult.fold((failure) async {
          _showSnackBar(
            message: failure.isEmpty
                ? 'Measurement saved, but failed to save goal'
                : 'Measurement saved, but failed to save goal: $failure',
            isError: true,
          );
          return false;
        }, (_) async => true);

        if (!goalSucceeded) {
          return;
        }
      }

      if (!mounted) {
        return;
      }

      context.read<GetallwidgetsdataBloc>().add(
        const GetallwidgetsdataEvent.fetchAllData(),
      );

      Navigator.pop(context);
      if (widget.closeParentOnSuccess && Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }
    } catch (error) {
      _showSnackBar(message: error.toString(), isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  void _showSnackBar({required String message, required bool isError}) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
      ),
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
      if (widget.measurementId == null) {
        _measurementController.clear();
      }
      _weightController.clear();
    });

    await _refreshDateContext();
    if (widget.measurementId != null) {
      _refreshDisplayedInitialValue();
    }
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

  @override
  Widget build(BuildContext context) {
    final maxModalHeight = MediaQuery.of(context).size.height * 0.84;

    return SafeArea(
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
                      onPressed: _isSaving
                          ? null
                          : () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    Text(
                      widget.type.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: _isSaving ? null : _onSavePressed,
                      child: Text(_isSaving ? 'Saving...' : 'Save'),
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
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.enableGoal ? 'Initial Value' : 'Value',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: TextFormField(
                                    controller: _measurementController,
                                    textAlign: TextAlign.end,
                                    validator: _validatePositiveNumber,
                                    inputFormatters: [_decimalInputFormatter],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    textInputAction: TextInputAction.next,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
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
                                      if (widget.measurementId == null) {
                                        _measurementController.clear();
                                      }
                                    });
                                    if (widget.measurementId != null) {
                                      _refreshDisplayedInitialValue();
                                    }
                                  },
                                  items: BodyCompositionService.supportedUnits
                                      .map(
                                        (unit) => DropdownMenuItem<String>(
                                          value: unit,
                                          child: Text(
                                            unit,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Text(
                                  'Date',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: TextFormField(
                                    readOnly: true,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    controller: _dateController,
                                    onTap: _selectMeasurementDate,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Icon(Icons.calendar_today_rounded),
                              ],
                            ),
                            const Divider(),
                            if (_sameDayWeightKg != null)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Same-day body weight found',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                  ),
                                  Text(
                                    '${_formatNumber(_sameDayWeightKg!)} kg',
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            else
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _weightIsRequired
                                              ? 'Body Weight Required'
                                              : 'Body Weight',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _weightIsRequired
                                              ? 'Body weight required for kg/lbs conversion'
                                              : 'Optional now, but needed later for kg/lbs conversion',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.24,
                                    child: TextFormField(
                                      controller: _weightController,
                                      textAlign: TextAlign.end,
                                      validator: _validateWeightValue,
                                      inputFormatters: [_decimalInputFormatter],
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
                                    value: _weightUnit,
                                    onChanged: (newValue) {
                                      if (newValue == null) {
                                        return;
                                      }
                                      setState(() {
                                        _weightUnit = newValue;
                                      });
                                    },
                                    items: const ['kg', 'lbs']
                                        .map(
                                          (unit) => DropdownMenuItem<String>(
                                            value: unit,
                                            child: Text(unit),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            if (widget.enableGoal) ...[
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
                                        if (!value) {
                                          _goalController.clear();
                                          _goalNoteController.clear();
                                          _goalDueDate = null;
                                          _goalDueDateController.clear();
                                          _goalDirection =
                                              GoalDirection.increase;
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
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextFormField(
                                        controller: _goalController,
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
                                    Text(_measurementUnit),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Goal Direction',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                    const Spacer(),
                                    DropdownButton<GoalDirection>(
                                      value: _goalDirection,
                                      onChanged: (newValue) {
                                        if (newValue == null) {
                                          return;
                                        }
                                        setState(() {
                                          _goalDirection = newValue;
                                        });
                                      },
                                      items: const [
                                        DropdownMenuItem(
                                          value: GoalDirection.increase,
                                          child: Text('Increase'),
                                        ),
                                        DropdownMenuItem(
                                          value: GoalDirection.decrease,
                                          child: Text('Decrease'),
                                        ),
                                      ],
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
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextFormField(
                                        readOnly: true,
                                        showCursor: false,
                                        enableInteractiveSelection: false,
                                        controller: _goalDueDateController,
                                        onTap: _selectGoalDueDate,
                                        decoration: const InputDecoration(
                                          hintText: 'Optional',
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
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
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.3,
                                      child: TextFormField(
                                        controller: _goalNoteController,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          hintText: 'Optional goal note',
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
                            ],
                            const Divider(),
                            Row(
                              children: [
                                Text(
                                  'Notes',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: TextFormField(
                                    controller: _notesController,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      hintText: 'Optional notes',
                                    ),
                                    maxLines: 2,
                                    minLines: 1,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }
}
