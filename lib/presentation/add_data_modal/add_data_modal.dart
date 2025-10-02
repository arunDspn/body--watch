import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/data/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/data/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/data/domain/metrics_units/models/metric_units_model.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/size_config.dart';

class AddorEditMeasurementTargetModal extends StatefulWidget {
  const AddorEditMeasurementTargetModal({
    Key? key,
    required this.type,
    this.isAdd = false,
  })  : addedId = null,
        addedDate = null,
        addedValue = null,
        super(key: key);

  const AddorEditMeasurementTargetModal.isAdd({
    Key? key,
    required this.type,
    this.isAdd = true,
  })  : addedId = null,
        addedDate = null,
        addedValue = null,
        super(key: key);

  const AddorEditMeasurementTargetModal.edit({
    Key? key,
    required this.type,
    required this.addedDate,
    required this.addedValue,
    required this.addedId,
    this.isAdd = true,
  }) : super(key: key);

  final MeasurementTargetModel type;
  final bool isAdd;
  final DateTime? addedDate;
  final double? addedValue;
  final String? addedId;

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
  late final TextEditingController _dateController;

  // Key for form
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _measurementController = TextEditingController();
    measurementUnit = widget.type.units.first.unit;
    _dateController = TextEditingController();
    if (widget.addedDate != null && widget.addedValue != null) {
      selectedDate = widget.addedDate;
      _measurementController.text = widget.addedValue.toString();
      _dateController.text = formatter.format(selectedDate!);
    } else {
      selectedDate = DateTime.now();
      // _measurementController.text = '';
      _dateController.text = formatter.format(selectedDate!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appPrefState =
        // context.read<ApppreferencesBloc>().state as SavedAndReady;
        context.read<UserPreferencesCubit>().state as UserPreferencesLoaded;
    // Getting current Unit
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
                          context.read<AdddataCubit>().insertData(
                                measurement: MeasurementEntity.createNew(
                                  date: selectedDate ?? DateTime.now(),
                                  value:
                                      double.parse(_measurementController.text),
                                  notes: '',
                                  targetId: widget.type.id,
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
                            Row(
                              children: [
                                //
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
                                // Text(
                                //   measurementUnit,
                                //   style: Theme.of(context).textTheme.bodyLarge,
                                // ),
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
