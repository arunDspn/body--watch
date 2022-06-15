import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/size_config.dart';

class AddDataModal extends StatefulWidget {
  const AddDataModal({
    Key? key,
    required this.type,
    this.add = false,
  }) : super(key: key);

  const AddDataModal.add({
    Key? key,
    required this.type,
    this.add = true,
  }) : super(key: key);

  final MeasurementType type;
  final bool add;

  @override
  State<AddDataModal> createState() => _AddDataModalState();
}

class _AddDataModalState extends State<AddDataModal> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  late String measurementUnit;

  DateTime? selectedDate;

  // Controllers
  final _measurementController = TextEditingController();
  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appPrefState =
        context.read<ApppreferencesBloc>().state as SavedAndReady;
    // Getting current Unit
    if (widget.type is LengthMeasurementType) {
      measurementUnit = EnumToString.convertToString(
        appPrefState.appPreferences.lengthUnit,
      );
    } else if (widget.type is WeightMeasurementType) {
      measurementUnit = EnumToString.convertToString(
        appPrefState.appPreferences.weightUnit,
      );
    } else {
      measurementUnit = '%';
    }

    return SafeArea(
      // height: 400,
      child: BlocListener<AdddataCubit, AdddataState>(
        listener: (context, state) {
          state.maybeMap(
            failure: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed'),
                  backgroundColor: Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            success: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Success'),
                  backgroundColor: Colors.greenAccent,
                ),
              );

              // Refreshing Overview data
              context.read<GetallwidgetsdataBloc>().add(
                    GetallwidgetsdataEvent.fetchAllData(
                      appPreferences: appPrefState.appPreferences,
                    ),
                  );

              // Refreshing Chart data but with previous duration
              context.read<ChartdataBloc>().add(
                    ChartdataEvent.fetchData(
                      duration: DurationsEnum.month1,
                      appPreferences: appPrefState.appPreferences,
                    ),
                  );

              // Get.toNamed("/NextScreen");
              // Navigator.of(context).popUntil((route) {
              //   if (route.settings.name == OverView.routeName) {
              //     return true;
              //   } else {
              //     return false;
              //   }
              // });
            },
            orElse: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(
              //     content: Text('E:SE'),
              //     backgroundColor: Colors.amberAccent,
              //   ),
              // );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<AdddataCubit>().insertData(
                            measurement: Measurement(
                              date: selectedDate ?? DateTime.now(),
                              value: double.parse(_measurementController.text),
                              unit: measurementUnit,
                              type: widget.type.name,
                            ),
                          );

                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
              Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Text('Measurement'),
                            const Spacer(),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.1,
                              child: TextFormField(
                                // maxLength: 5,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'),
                                  ),
                                ],
                                controller: _measurementController,
                                keyboardType: TextInputType.number,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Text(
                              measurementUnit,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            const Text('Date'),
                            const Spacer(),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.3,
                              child: GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    controller: _dateController,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
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
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final formatted = formatter.format(selectedDate!);
        _dateController.text = formatted;
      });
    }
  }
}
