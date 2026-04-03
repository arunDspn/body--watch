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
import 'package:watcha_body/size_config.dart';

class AddorEditMeasurementTargetModal extends StatefulWidget {
  // const AddorEditMeasurementTargetModal._({
  //   required this.type,
  // })  : addedDate = null,
  //       addedId = null,
  //       addedValue = null,
  //       notes = null,
  //       super(key: null);

  const AddorEditMeasurementTargetModal.add({
    Key? key,
    required this.type,
  })  : addedId = null,
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
  late String measurementUnit;

  DateTime? selectedDate;

  // Controllers
  late final TextEditingController _measurementController;
  late final TextEditingController _goalController;
  late final TextEditingController _dateController;
  late final TextEditingController _notesController;

  // Key for form
  final _formKey = GlobalKey<FormState>();

  // Local state
  bool _didSetPreferredUnit = false;
  bool _didSetInitialValue = false;

  @override
  void initState() {
    _measurementController = TextEditingController();
    //Todo: Use preferred unit as initial value
    measurementUnit = widget.type.units.first.unit;
    _dateController = TextEditingController();
    if (widget.addedDate != null && widget.addedValue != null) {
      selectedDate = widget.addedDate;
      _measurementController.text = widget.addedValue.toString();
      _dateController.text = formatter.format(selectedDate!);
      _notesController = TextEditingController();
      _goalController = TextEditingController();
      // _notesController.text = widget.a ?? '';
    } else {
      selectedDate = DateTime.now();
      // _measurementController.text = '';
      _dateController.text = formatter.format(selectedDate!);
      _notesController = TextEditingController();
      _goalController = TextEditingController();
    }

    super.initState();
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
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        _measurementController.text = valueInPrefrerredUnit.toStringAsFixed(1);
        // });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                      ),
                    ),
                    Text(
                      widget.type.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        // Validate form
                        if (_formKey.currentState!.validate()) {
                          final value =
                              double.parse(_measurementController.text);
                          final toBaseFactor = widget.addedDate != null
                              ? widget.type.units
                                  .firstWhere(
                                    (element) =>
                                        element.unit == measurementUnit,
                                  )
                                  .toBaseFactor
                              : widget.type.units
                                  .firstWhere(
                                    (element) =>
                                        element.unit == measurementUnit,
                                  )
                                  .toBaseFactor;

                          final convertedValue = value * toBaseFactor;
                          context.read<AdddataCubit>().insertData(
                                measurement: MeasurementEntity.createNew(
                                  date: selectedDate ?? DateTime.now(),
                                  value: convertedValue,
                                  notes: _notesController.text,
                                  targetId: widget.type.id,
                                  goalValue: _goalController.text.isNotEmpty
                                      ? double.parse(_goalController.text) *
                                          toBaseFactor
                                      : null,
                                ),
                              );
                        }

                        // Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),

                // Form
                Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: const InputDecorationTheme(
                      border: InputBorder.none,
                      // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      //       fontWeight: FontWeight.w600,
                      //     ),
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
                            Row(
                              children: [
                                Text(
                                  'Value',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                //

                                const Spacer(),
                                SizedBox(
                                  width: SizeConfig.screenWidth! * 0.3,
                                  child: TextFormField(
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    // maxLength: 5,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[0-9.]'),
                                      ),
                                    ],
                                    controller: _measurementController,
                                    keyboardType: TextInputType.number,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                DropdownButton<String>(
                                  value: measurementUnit,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        measurementUnit = newValue;
                                      });
                                    }
                                  },
                                  items: widget.type.units
                                      .map<DropdownMenuItem<String>>(
                                          (MetricUnitsModel value) {
                                    return DropdownMenuItem<String>(
                                      value: value.unit,
                                      child: Text(
                                        value.unit,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                // Text(
                                //   measurementUnit,
                                //   style: Theme.of(context).textTheme.bodyLarge,
                                // ),
                              ],
                            ),
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
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        controller: _dateController,
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: getProportionateScreenWidth(20),
                                // ),
                              ],
                            ),
                            const Divider(),
                            // Goal
                            Row(
                              children: [
                                //

                                Text(
                                  'Goal',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: SizeConfig.screenWidth! * 0.3,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value != null && value.isNotEmpty) {
                                      final number = double.tryParse(value);
                                      if (number == null) {
                                        return 'Please enter a valid number';
                                      }
                                      if (number <= 0) {
                                        return 'Please enter a number greater than zero';
                                      }
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        fontSize: 23,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    // maxLength: 5,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[0-9.]'),
                                      ),
                                    ],
                                    controller: _goalController,
                                    keyboardType: TextInputType.number,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                // Text(
                                //   measurementUnit,
                                //   style: Theme.of(context).textTheme.bodyLarge,
                                // ),
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
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.019,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
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
