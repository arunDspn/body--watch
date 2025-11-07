import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/components/data_linked/cubit/get_data_linked_cubit.dart';
import 'package:watcha_body/utils/value_to_pref_value.dart';

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
                        child: switch (state) {
                          GetDataLinkedStateInitial() =>
                            const Text('Oh Nobody invoked me'),
                          GetDataLinkedStateLoading() =>
                            const Center(child: CircularProgressIndicator()),
                          GetDataLinkedStateLoaded(:final dataLinked)
                              when dataLinked.isEmpty =>
                            const Center(child: Text('No data found')),
                          GetDataLinkedStateLoaded(:final dataLinked) =>
                            Builder(
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: DataTable(
                                    headingTextStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    columns: const [
                                      DataColumn(
                                        label: Text('Measurement'),
                                      ),
                                      DataColumn(label: Text('Value')),
                                    ],
                                    // rows: [],
                                    rows: dataLinked.map((e) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Text(e.targetName),
                                          ),
                                          DataCell(
                                            Text(
                                              UserMetricHelper
                                                  .convertToUserPref(
                                                value: e.value,
                                                metricCode: e.metricCode,
                                                context: context,
                                                decimalPlaces: 1,
                                                showUnit: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                );
                              },
                            ),
                          GetDataLinkedStateError() => const Center(
                              child: Text('Error loading data'),
                            ),
                        },

                        //  state.map(
                        //   initial: (value) {
                        //     return ;
                        //   },
                        //   loading: (value) {
                        //     return ;
                        //   },
                        //   loaded: (value) {
                        //   },
                        //   error: (value) {
                        //     return ;
                        //   },
                        // ),
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
