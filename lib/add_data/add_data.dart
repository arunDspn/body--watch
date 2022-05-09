import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/add_data/cubit/adddata_cubit.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  DateTime? selectedDate;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  // Controllers
  final _measurementController = TextEditingController();
  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                controller: _measurementController,
                decoration: const InputDecoration(
                  labelText: 'Measurement',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Choose a Date',
                    ),
                  ),
                ),
              ),
              const Spacer(),
              LongPrimaryButton(
                onPressed: () {
                  context.read<AdddataCubit>().insertData(
                        Chest(
                          int.parse(_measurementController.text),
                          selectedDate ?? DateTime.now(),
                        ),
                      );
                },
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
      firstDate: DateTime.now(),
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

class LongPrimaryButton extends StatelessWidget {
  const LongPrimaryButton({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: const Text('Add'),
      height: 48,
      minWidth: double.infinity,
      color: const Color(0xFF13B9FF),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      highlightColor: Colors.green,
      elevation: 0,
      highlightElevation: 1,
      splashColor: Colors.greenAccent,
    );
  }
}
