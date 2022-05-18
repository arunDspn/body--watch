import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/overview/overview.dart';
import 'package:watcha_body/size_config.dart';

class AddDataModal extends StatefulWidget {
  const AddDataModal({
    Key? key,
    required this.tableName,
    required this.measurementName,
    this.add = false,
  }) : super(key: key);

  const AddDataModal.add({
    Key? key,
    required this.tableName,
    required this.measurementName,
    this.add = true,
  }) : super(key: key);

  final String tableName;
  final String measurementName;
  final bool add;

  @override
  State<AddDataModal> createState() => _AddDataModalState();
}

class _AddDataModalState extends State<AddDataModal> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  DateTime? selectedDate;

  // Controllers
  final _measurementController = TextEditingController();
  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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

              context
                  .read<GetallwidgetsdataBloc>()
                  .add(const GetallwidgetsdataEvent.fetchAllData());

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
          color: Theme.of(context).colorScheme.secondaryContainer,
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
                    widget.measurementName,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  TextButton(
                    onPressed: () {
                      if (widget.add) {
                        context.read<AdddataCubit>().insertData(
                              measurement: Measurement(
                                double.parse(_measurementController.text),
                                selectedDate ?? DateTime.now(),
                              ),
                              tableName: widget.tableName,
                            );

                        Navigator.pop(context);
                      } else {
                        context.read<AdddataCubit>().insertInitalData(
                              measurement: Measurement(
                                double.parse(_measurementController.text),
                                selectedDate ?? DateTime.now(),
                              ),
                              measurementWidget: MeasurementWidget(
                                widget.measurementName,
                                widget.tableName,
                              ),
                            );

                        Navigator.pop(context);
                      }
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Measurement'),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.5,
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
                                decoration: const InputDecoration(
                                  suffixText: 'inches',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Date'),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.5,
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
      lastDate: DateTime(2101),
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
