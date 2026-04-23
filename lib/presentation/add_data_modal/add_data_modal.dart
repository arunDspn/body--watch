import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/body_composition/body_composition_entry_modal.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/size_config.dart';

class AddorEditMeasurementTargetModal extends StatefulWidget {
  // const AddorEditMeasurementTargetModal._({
  //   required this.type,
  // })  : addedDate = null,
  //       addedId = null,
  //       addedValue = null,
  //       notes = null,
  //       super(key: null);

  const AddorEditMeasurementTargetModal.add({Key? key, required this.type})
    : addedId = null,
      addedDate = null,
      addedValue = null,
      notes = null,
      super(key: key);

  const AddorEditMeasurementTargetModal.edit({
    Key? key,
    required this.type,
    required this.addedId,
    required this.addedValue,
    required this.addedDate,
    this.notes,
  }) : super(key: key);

  final MeasurementTargetModel type;
  final int? addedId;
  final double? addedValue;
  final DateTime? addedDate;
  final String? notes;

  @override
  State<AddorEditMeasurementTargetModal> createState() =>
      _AddorEditMeasurementTargetModalState();
}

class _AddorEditMeasurementTargetModalState
    extends State<AddorEditMeasurementTargetModal> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final _decimalInputFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d{0,2}'),
  );
  final _intInputFormatter = FilteringTextInputFormatter.allow(RegExp(r'^\d+'));
  late String measurementUnit;

  DateTime? selectedDate;

  // Controllers
  late final TextEditingController _measurementController;
  late final TextEditingController _goalController;
  late final TextEditingController _dateController;
  late final TextEditingController _notesController;
  late final TextEditingController _feetController;
  late final TextEditingController _inchesController;

  // Key for form
  final _formKey = GlobalKey<FormState>();

  // Local state
  bool _didSetPreferredUnit = false;
  bool _didSetInitialValue = false;

  @override
  void initState() {
    _measurementController = TextEditingController();
    _feetController = TextEditingController();
    _inchesController = TextEditingController();
    //Todo: Use preferred unit as initial value
    measurementUnit = widget.type.units.first.unit;
    _dateController = TextEditingController();
    _notesController = TextEditingController(text: widget.notes ?? '');
    _goalController = TextEditingController();

    if (widget.addedDate != null && widget.addedValue != null) {
      selectedDate = widget.addedDate;
      _measurementController.text = widget.addedValue.toString();
      _dateController.text = formatter.format(selectedDate!);
    } else {
      selectedDate = DateTime.now();
      _dateController.text = formatter.format(selectedDate!);
    }

    super.initState();
  }

  @override
  void dispose() {
    _measurementController.dispose();
    _goalController.dispose();
    _dateController.dispose();
    _notesController.dispose();
    _feetController.dispose();
    _inchesController.dispose();
    super.dispose();
  }

  /// Decompose cm value to feet and inches
  void _decomposeCmToFeetInches(double cm) {
    final totalInches = cm / 2.54;
    final feet = totalInches ~/ 12;
    final inches = (totalInches % 12).round();
    _feetController.text = feet.toString();
    _inchesController.text = inches.toString();
  }

  /// Convert feet and inches to cm
  double _composeFeetInchesToCm() {
    final feet = int.tryParse(_feetController.text.trim()) ?? 0;
    final inches = int.tryParse(_inchesController.text.trim()) ?? 0;
    return (feet * 12 + inches) * 2.54;
  }

  /// Build input row for normal units
  Widget _buildNormalUnitInput() {
    return Row(
      children: [
        Text('Value', style: Theme.of(context).textTheme.bodyLarge),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.3,
          child: TextFormField(
            textAlign: TextAlign.end,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some value';
              }
              final number = double.tryParse(value);
              if (number == null) {
                return 'Please enter a valid number';
              }
              if (number <= 0) {
                return 'Please enter a number greater than zero';
              }
              return null;
            },
            decoration: InputDecoration(
              labelStyle: TextStyle(
                fontSize: 23,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            inputFormatters: [_decimalInputFormatter],
            controller: _measurementController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 8),
        _buildUnitDropdown(),
      ],
    );
  }

  /// Build input row for feet+inches compound format
  Widget _buildFeetInchesInput() {
    return Row(
      children: [
        Text('Value', style: Theme.of(context).textTheme.bodyLarge),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.15,
          child: TextFormField(
            textAlign: TextAlign.end,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter ft';
              if (int.tryParse(value) == null) return 'Invalid';
              return null;
            },
            inputFormatters: [_intInputFormatter],
            controller: _feetController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 4),
        Text("'", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: 4),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.12,
          child: TextFormField(
            textAlign: TextAlign.end,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter in';
              final num = int.tryParse(value);
              if (num == null || num > 11) return 'Invalid';
              return null;
            },
            inputFormatters: [_intInputFormatter],
            controller: _inchesController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 2),
        Text('\"', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: 8),
        _buildUnitDropdown(),
      ],
    );
  }

  /// Build unit dropdown
  Widget _buildUnitDropdown() {
    return DropdownButton<String>(
      value: measurementUnit,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            measurementUnit = newValue;
            _feetController.clear();
            _inchesController.clear();
            _measurementController.clear();
          });
        }
      },
      items: widget.type.units
          .map<DropdownMenuItem<String>>(
            (MetricUnitsModel value) => DropdownMenuItem<String>(
              value: value.unit,
              child: Text(
                value.unit,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_didSetPreferredUnit) {
      final appPrefState =
          context.read<UserPreferencesCubit>().state as UserPreferencesLoaded;

      // Getting current Unit by user preference
      final preferredUnit = appPrefState.preferences
          .firstWhereOrNull(
            (element) => element.metricCode == widget.type.metricCode,
          )
          ?.preferredUnit;

      if (preferredUnit != null &&
          widget.type.units.any((unit) => unit.unit == preferredUnit)) {
        setState(() {
          measurementUnit = preferredUnit;
        });
      }
      _didSetPreferredUnit = true;
    }

    if (!_didSetInitialValue && widget.addedValue != null) {
      final valueInPrefrerredUnit = widget.addedValue != null
          ? widget.addedValue! /
                widget.type.units
                    .firstWhere(
                      (element) => element.unit == measurementUnit,
                      orElse: () => widget.type.units.first,
                    )
                    .toBaseFactor
          : null;

      if (valueInPrefrerredUnit != null) {
        if (measurementUnit == 'ft') {
          _decomposeCmToFeetInches(valueInPrefrerredUnit);
        } else {
          _measurementController.text = valueInPrefrerredUnit.toStringAsFixed(
            1,
          );
        }
      }
      _didSetInitialValue = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type.code == 'body_fat_percentage' ||
        widget.type.code == 'skeletal_muscle_mass') {
      return BodyCompositionEntryModal(
        type: widget.type,
        measurementId: widget.addedId,
        initialValue: widget.addedValue,
        initialDate: widget.addedDate,
        initialNotes: widget.notes,
      );
    }

    // final appPrefState =
    //     // context.read<ApppreferencesBloc>().state as SavedAndReady;
    //     context.read<UserPreferencesCubit>().state as UserPreferencesLoaded;

    // // Getting current Unit by user preference
    // final preferredUnit = appPrefState.preferences
    //     .firstWhereOrNull(
    //       (element) => element.metricCode == widget.type.metricCode,
    //     )
    //     ?.preferredUnit;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (preferredUnit != null &&
    //       widget.type.units.any((unit) => unit.unit == preferredUnit)) {
    //     setState(() {
    //       measurementUnit = preferredUnit;
    //     });
    //   }
    // });

    // final valueInPrefrerredUnit = widget.addedValue != null
    //     ? widget.addedValue! /
    //         widget.type.units
    //             .firstWhere(
    //               (element) => element.unit == measurementUnit,
    //               orElse: () => widget.type.units.first,
    //             )
    //             .toBaseFactor
    //     : null;

    // if (valueInPrefrerredUnit != null) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     _measurementController.text = valueInPrefrerredUnit.toStringAsFixed(1);
    //   });
    // }

    // if (widget.type is LengthMeasurementType) {
    //   measurementUnit = EnumToString.convertToString(
    //     appPrefState.appPreferences.lengthUnit,
    //   );
    // } else if (widget.type is WeightMeasurementType) {
    //   measurementUnit = EnumToString.convertToString(
    //     appPrefState.appPreferences.weightUnit,
    //   );
    // } else {
    //   measurementUnit = '%';
    // }

    return SafeArea(
      // height: 400,
      child: BlocListener<AdddataCubit, AdddataState>(
        listener: (context, state) {
          switch (state) {
            case AddDataFailure():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Failed'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
              break;
            case AddDataSuccess():
              // Dismiss Modal
              Navigator.pop(context);

              // Refresh Overview Screen Data - GetallwidgetsdataBloc

              context.read<GetallwidgetsdataBloc>().add(
                const GetallwidgetsdataEvent.fetchAllData(),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Success'),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  behavior: SnackBarBehavior.floating,
                ),
              );

              // Refreshing Overview data
              // context.read<GetallwidgetsdataBloc>().add(
              //       GetallwidgetsdataEvent.fetchAllData(
              //         appPreferences: appPrefState.appPreferences,
              //       ),
              // );

              // Refreshing Chart data but with previous duration
              // context.read<ChartdataBloc>().add(
              //       ChartdataEvent.fetchData(
              //         duration: DurationsEnum.month1,
              //         appPreferences: appPrefState.appPreferences,
              //       ),
              //     );

              // Get.toNamed("/NextScreen");
              // Navigator.of(context).popUntil((route) {
              //   if (route.settings.name == OverView.routeName) {
              //     return true;
              //   } else {
              //     return false;
              //   }
              // });
              break;

            default:
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      Text(
                        widget.type.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          double convertedValue;
                          if (measurementUnit == 'ft') {
                            convertedValue = _composeFeetInchesToCm();
                          } else {
                            final value = double.parse(
                              _measurementController.text.trim(),
                            );
                            final toBaseFactor = widget.type.units
                                .firstWhere(
                                  (element) => element.unit == measurementUnit,
                                )
                                .toBaseFactor;
                            convertedValue = value * toBaseFactor;
                          }
                          context.read<AdddataCubit>().insertData(
                            measurement: MeasurementEntity.createNew(
                              date: selectedDate ?? DateTime.now(),
                              value: convertedValue,
                              notes: _notesController.text.trim(),
                              targetId: widget.type.id,
                            ),
                          );
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),

                // Form
                Theme(
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
                  child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Value Input
                            if (measurementUnit == 'ft')
                              _buildFeetInchesInput()
                            else
                              _buildNormalUnitInput(),
                            const Divider(),
                            // Date Input
                            Row(
                              children: [
                                Text(
                                  'Date',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: SizeConfig.screenWidth! * 0.3,
                                  child: TextFormField(
                                    readOnly: true,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    controller: _dateController,
                                  ),
                                ),
                                const SizedBox(
                                  child: Icon(Icons.calendar_today_rounded),
                                ),
                              ],
                            ),
                            const Divider(),

                            // Notes Input
                            Row(
                              children: [
                                Text(
                                  'Notes',
                                  style: Theme.of(context).textTheme.bodyLarge,
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
                SizedBox(height: SizeConfig.screenHeight! * 0.019),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) {
    final now = DateTime.now();
    final firstDate = DateTime(2021);
    final initialDate = selectedDate == null
        ? now
        : selectedDate!.isBefore(firstDate)
        ? firstDate
        : selectedDate!.isAfter(now)
        ? now
        : selectedDate!;

    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: now,
    ).then((picked) {
      if (picked != null && picked != selectedDate) {
        // time picker
        showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 0, minute: 0),
        ).then((pickedTime) {
          setState(() {
            if (pickedTime != null) {
              selectedDate = DateTime(
                picked.year,
                picked.month,
                picked.day,
                pickedTime.hour,
                pickedTime.minute,
              );
              final formatted = formatter.format(selectedDate!);
              _dateController.text = formatted;
            }
          });
        });
      }
    });
  }
}
