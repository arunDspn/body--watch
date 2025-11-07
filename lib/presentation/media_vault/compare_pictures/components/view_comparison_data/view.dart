import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/components/view_comparison_data/cubit/comparison_data_cubit.dart';
import 'package:watcha_body/utils/value_to_pref_value.dart';

class ViewComparisonDataModalView extends StatelessWidget {
  const ViewComparisonDataModalView({
    super.key,
    required this.firstDate,
    required this.secondDate,
  });

  final DateTime firstDate;
  final DateTime secondDate;

  // Date formatter 12 may 2022 using intl package
  String formatDate(DateTime date) {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              'Comparison Data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // data table of comparison data1 then comparison name then comparsion data2
            BlocBuilder<ComparisonDataCubit, ComparisonDataState>(
              builder: (context, state) {
                return switch (state) {
                  ComparisonDataStateInitial() =>
                    const Text('Nobody invoked the cubit yet'),
                  ComparisonDataStateLoading() =>
                    const Center(child: CircularProgressIndicator()),
                  ComparisonDataStateSuccess(:final records)
                      when records.isEmpty =>
                    const Text('No Data'),
                  ComparisonDataStateSuccess(:final records) =>
                    SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          headingTextStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          columns: [
                            DataColumn(label: Text(formatDate(firstDate))),
                            const DataColumn(
                              label: Text('Tag'),
                            ),
                            DataColumn(label: Text(formatDate(secondDate))),
                          ],
                          showBottomBorder: true,
                          rows: records.map((e) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    e.data1 == null
                                        ? ''
                                        : UserMetricHelper.convertToUserPref(
                                            value: e.data1!,
                                            metricCode: e.metricCode1!,
                                            context: context,
                                          ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.data2 == null
                                        ? ''
                                        : UserMetricHelper.convertToUserPref(
                                            value: e.data2!,
                                            metricCode: e.metricCode2!,
                                            context: context,
                                          ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ComparisonDataStateFailure() =>
                    const Center(child: Text('Something went wrong')),
                };

                // return state.map(
                //   initial: (value) {
                //     return
                //   },
                //   loading: (value) {
                //     return
                //   },
                //   failure: (value) {
                //     return
                //   },
                //   success: (value) {
                //     if (value.records.isEmpty) {
                //       return
                //     }
                //     return ;
                //   },
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}
