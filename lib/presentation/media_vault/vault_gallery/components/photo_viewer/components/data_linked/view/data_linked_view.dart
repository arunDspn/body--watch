import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/components/data_linked/cubit/get_data_linked_cubit.dart';

class DataLinkedView extends StatelessWidget {
  const DataLinkedView({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDataLinkedCubit(
        context.read<MeasurementRepository>(),
      )..getData(
          date: date,
        ),
      child: Builder(
        builder: (context) {
          return Material(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(
                    'Linked Data',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Data Table with Measurement and Date
                  BlocBuilder<GetDataLinkedCubit, GetDataLinkedState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: state.map(
                          initial: (value) {
                            return const Text('Oh Nobody invoked me');
                          },
                          loading: (value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          loaded: (value) {
                            if (value.dataLinked.isEmpty) {
                              return const Center(child: Text('No data found'));
                            } else {
                              return Expanded(
                                child: SingleChildScrollView(
                                  child: DataTable(
                                    headingTextStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    columns: const [
                                      DataColumn(label: Text('Measurement')),
                                      DataColumn(label: Text('Value')),
                                    ],
                                    // rows: [],
                                    rows: value.dataLinked.map((e) {
                                      return DataRow(
                                        cells: [
                                          DataCell(Text(e.type)),
                                          DataCell(
                                            Text('${e.value} ${e.unit}'),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                    // rows: [
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Chest')),
                                    //   //   DataCell(const Text('100')),
                                    //   // ]),
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Waist')),
                                    //   //   DataCell(const Text('110')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Hips')),
                                    //   //   DataCell(const Text('120')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Height')),
                                    //   //   DataCell(const Text('180')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Weight')),
                                    //   //   DataCell(const Text('80')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('BMI')),
                                    //   //   DataCell(const Text('25')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Blood Pressure')),
                                    //   //   DataCell(const Text('120/80')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Blood Sugar')),
                                    //   //   DataCell(const Text('100')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Cholesterol')),
                                    //   //   DataCell(const Text('200')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('Triglycerides')),
                                    //   //   DataCell(const Text('150')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('HDL')),
                                    //   //   DataCell(const Text('50')),
                                    //   // ]),
                                    //   // // data
                                    //   // DataRow(cells: [
                                    //   //   DataCell(const Text('LDL')),
                                    //   //   DataCell(const Text('100')),
                                    //   // ]),
                                    // ],
                                  ),
                                ),
                              );
                            }
                          },
                          error: (value) {
                            return const Center(
                              child: Text('Error loading data'),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
