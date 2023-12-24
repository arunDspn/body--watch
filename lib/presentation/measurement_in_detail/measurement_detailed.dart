import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/delete_measurement_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/getallmeasurments_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_to_text.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/metrics_line_graph.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_range_filter/bloc/time_range_filter_bloc.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_range_filter/time_range_filter.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/timeunit_segemented_filter_view.dart';
import 'package:watcha_body/services/time_range_service/service.dart';
import 'package:watcha_body/size_config.dart';

class MeasurementInDetail extends StatelessWidget {
  const MeasurementInDetail({
    Key? key,
    required this.measurementType,
  }) : super(key: key);

  static const routeName = '/measurement_in_detail';

  final MeasurementType measurementType;

  @override
  Widget build(BuildContext context) {
    final appPref = context.read<ApppreferencesBloc>().state as SavedAndReady;
    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<DeleteMeasurementCubit, DeleteMeasurementState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  // loading: (_) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Deleting'),
                  //     ),
                  //   );
                  // },
                  error: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value.message),
                      ),
                    );
                  },
                  deleted: (value) {
                    context
                        .read<GetSingleMeasurmentsDetailsCubit>()
                        .reloadList(value.id);
                    // Deleted msg
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Deleted'),
                      ),
                    );
                  },
                );
              },
            ),
            BlocListener<AdddataCubit, AdddataState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  success: (_) {
                    context
                        .read<GetSingleMeasurmentsDetailsCubit>()
                        .fetchAllData(
                          type: measurementType.name,
                          appPreferences: appPref.appPreferences,
                          // durationsEnum: value.durationsEnum,
                        );
                  },
                );
              },
            ),
          ],
          child: BlocBuilder<GetSingleMeasurmentsDetailsCubit,
              GetSingleMeasurmentsDetailsState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const Text('No You Cant See Me');
                },
                loading: (_) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                failed: (value) {
                  return Text(value.cause);
                },
                //todo: Group all listners
                success: (value) {
                  return BlocListener<AdddataCubit, AdddataState>(
                    listener: (context, state) {
                      state.maybeMap(
                        orElse: () {},
                        success: (_) {
                          context
                              .read<GetSingleMeasurmentsDetailsCubit>()
                              .fetchAllData(
                                type: measurementType.name,
                                appPreferences: appPref.appPreferences,
                                // durationsEnum: value.durationsEnum,
                              );
                        },
                      );
                    },
                    child: Column(
                      children: [
                        // Appbar
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: SizeConfig.screenHeight! * 0.08,
                        //   child: Stack(
                        //     children: [
                        //       Align(
                        //         child: Text(
                        //           measurementType.name,
                        //           // style: Theme.of(context).textTheme.displaySmall,
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.centerLeft,
                        //         child: TextButton(
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //           child: const Text('Cancel'),
                        //         ),
                        //       ),
                        //       // Align(
                        //       //   alignment: Alignment.centerRight,
                        //       //   child: DropdownButton<DurationsEnum>(
                        //       //     //TODO: Better universal
                        //       //     borderRadius: BorderRadius.circular(20),
                        //       //     value: value.durationsEnum,
                        //       //     icon: Icon(
                        //       //       Icons.arrow_drop_down,
                        //       //       color:
                        //       //           Theme.of(context).colorScheme.secondary,
                        //       //     ),
                        //       //     underline: Container(),
                        //       //     onChanged: (value) {
                        //       //       if (value != null) {
                        //       //         context
                        //       //             .read<
                        //       //                 GetSingleMeasurmentsDetailsCubit>()
                        //       //             .fetchAllData(
                        //       //               type: measurementType.name,
                        //       //               appPreferences:
                        //       //                   appPref.appPreferences,
                        //       //               durationsEnum: value,
                        //       //             );
                        //       //       }
                        //       //     },
                        //       //     items: DurationsEnum.values.map((e) {
                        //       //       return DropdownMenuItem(
                        //       //         value: e,
                        //       //         child: Text(
                        //       //           EnumToString.convertToString(
                        //       //             e,
                        //       //             camelCase: true,
                        //       //           ),
                        //       //           style:
                        //       //               Theme.of(context).textTheme.bodyLarge,
                        //       //         ),
                        //       //       );
                        //       //     }).toList(),
                        //       //   ),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                        AppBar(
                          title: Text(measurementType.name),
                          centerTitle: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocProvider(
                          create: (context) => TimeUnitFilterCubit(),
                          child: Expanded(
                            child: _MeasurementList(
                              measurementList: value.list,
                              measurementType: measurementType,
                              // startDate: value.startDate,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MeasurementList extends StatelessWidget {
  const _MeasurementList({
    Key? key,
    required this.measurementList,
    required this.measurementType,
    // required this.startDate,
  }) : super(key: key);

  final List<Measurement> measurementList;
  final MeasurementType measurementType;
  // final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    late String unit;
    final appPre = (context.read<ApppreferencesBloc>().state as SavedAndReady)
        .appPreferences;
    if (measurementType is LengthMeasurementType) {
      unit = EnumToString.convertToString(
        appPre.lengthUnit,
      );
    } else if (measurementType is WeightMeasurementType) {
      unit = EnumToString.convertToString(
        appPre.lengthUnit,
      );
    } else {
      unit = '%';
    }

    final timeBasedViewsList = TimeUnit.values.map((e) {
      return DataView(
        key: Key(e.toString()),
        measurementList: measurementList,
        measurementType: measurementType,
        timeUnit: e,
      );
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Last Measurement · ${measurementList.first.value} $unit',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
            const SegmentedMainFilterButtons(),
            _ViewPresenter(
              timeBasedViewsList: timeBasedViewsList,
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewPresenter extends StatelessWidget {
  const _ViewPresenter({
    required this.timeBasedViewsList,
  });

  final List<DataView> timeBasedViewsList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeUnitFilterCubit, TimeUnitFilterState>(
      builder: (context, state) {
        return Column(
          children: timeBasedViewsList
              .map(
                (e) => Offstage(
                  offstage: e.timeUnit != state.timeUnit,
                  child: e,
                ),
              )
              .toList(),
        );
      },
    );
  }
}

// Generic Data View
class DataView extends StatelessWidget {
  const DataView({
    super.key,
    required this.measurementList,
    required this.measurementType,
    required this.timeUnit,
  });

  final List<Measurement> measurementList;
  final MeasurementType measurementType;
  final TimeUnit timeUnit;

  @override
  Widget build(BuildContext context) {
    print(timeUnit);
    return BlocProvider(
      lazy: false,
      create: (context) => TimeRangeFilterBloc(
        timeUnit,
        context.read<TimeRangeService>(),
        measurementList,
      )..add(
          const TimeRangeFilterEvent.currentRange(),
        ),
      child: BlocConsumer<GetSingleMeasurmentsDetailsCubit,
          GetSingleMeasurmentsDetailsState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (value) {
              context.read<TimeRangeFilterBloc>().add(
                    TimeRangeFilterEvent.updateData(
                      newMeasurementList: value.list,
                    ),
                  );
            },
          );
        },
        builder: (context, state) {
          return Builder(
            builder: (context) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18),
                    child: TimeRangeFilterInputStepper(),
                  ),
                  BlocBuilder<TimeRangeFilterBloc, TimeRangeFilterState>(
                    builder: (context, state) {
                      // Filter
                      return state.map(
                        state: (value) {
                          // final filteredMeasurements = measurementList
                          //     .where(
                          //       (element) =>
                          //           (element.date.isAfter(value.startDate) &&
                          //               element.date.isBefore(value.endDate)) ||
                          //           element.date
                          //               .isAtSameMomentAs(value.startDate) ||
                          //           element.date.isAtSameMomentAs(value.endDate),
                          //     )
                          //     .toList();

                          // Measurement? previousMeasurement;
                          // Measurement? nextMeasurement;

                          // previousMeasurement = measurementList.lastWhereOrNull(
                          //   (element) => element.date.isBefore(value.startDate),
                          // );
                          // nextMeasurement = measurementList.firstWhereOrNull(
                          //   (element) => element.date.isAfter(value.endDate),
                          // );

                          if (timeUnit == TimeUnit.year) {
                            print(value.filteredMeasurements.length);
                          }

                          return Column(
                            children: [
                              // Chart
                              MetricsLineGraph(
                                filteredMeasurements:
                                    value.filteredMeasurements,
                                endDate: value.endDate,
                                startDate: value.startDate,
                                previousMeasurement: value.previousMeasurement,
                                nextMeasurement: value.nextMeasurement,
                                dayToText: DayToText(
                                  timeUnit: timeUnit,
                                  endDate: value.endDate,
                                  startDate: value.startDate,
                                ),
                              ),

                              // Measure List
                              SizedBox(
                                width: SizeConfig.screenWidth! * 0.85,
                                // Head
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Measurement(s) ${value.filteredMeasurements.length}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (context) {
                                            return AddDataModal.add(
                                              type: measurementType,
                                            );
                                          },
                                        );
                                      },
                                      child: const Text(
                                        'Add',
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // List
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Container(
                                  // constraints: BoxConstraints(
                                  //   maxHeight: SizeConfig.screenHeight! * 0.4,
                                  // ),
                                  // padding: const EdgeInsets.only(top: 8),
                                  width: SizeConfig.screenWidth! * 0.85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: value.filteredMeasurements.isNotEmpty
                                        // ? ListView.builder(
                                        //     shrinkWrap: true,
                                        //     physics: const BouncingScrollPhysics(
                                        //       parent:
                                        //           AlwaysScrollableScrollPhysics(),
                                        //     ),
                                        //     itemCount: filteredMeasurements.length,
                                        //     itemBuilder: (context, index) {
                                        //       return _TableCell(
                                        //         date: filteredMeasurements[index]
                                        //             .date,
                                        //         measurement:
                                        //             filteredMeasurements[index]
                                        //                 .value,
                                        //       );
                                        //     },
                                        //   )
                                        ? Column(
                                            children: value.filteredMeasurements
                                                .map((e) {
                                              return _TableCell(
                                                measurement: e,
                                              );
                                            }).toList(),
                                          )
                                        : const Text(
                                            'No Data',
                                            textAlign: TextAlign.center,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        loading: (value) {
                          return const CircularProgressIndicator();
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  _TableCell({
    Key? key,
    required this.measurement,
  }) : super(key: key);

  final Measurement measurement;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            measurement.value.toStringAsFixed(2),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            formatter.format(measurement.date),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          // overflow menu
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              // Handle menu item selection here
              if (value == 'edit') {
                // Handle edit action

                print('Edit selected');

                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: AddDataModal.edit(
                        type: measurementTypeFromString(measurement.type)!,
                        addedDate: measurement.date,
                        addedValue: measurement.value,
                        addedId: measurement.id,
                      ),
                    );
                  },
                );
              } else if (value == 'delete') {
                context
                    .read<DeleteMeasurementCubit>()
                    .delete(id: measurement.id!);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
