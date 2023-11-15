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
import 'package:watcha_body/presentation/measurement_in_detail/cubit/getallmeasurments_cubit.dart';
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
                              durationsEnum: value.durationsEnum,
                            );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: SizeConfig.screenHeight! * 0.08,
                        child: Stack(
                          children: [
                            Align(
                              child: Text(
                                measurementType.name,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: DropdownButton<DurationsEnum>(
                                //TODO: Better universal
                                borderRadius: BorderRadius.circular(20),
                                value: value.durationsEnum,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                underline: Container(),
                                onChanged: (value) {
                                  if (value != null) {
                                    context
                                        .read<
                                            GetSingleMeasurmentsDetailsCubit>()
                                        .fetchAllData(
                                          type: measurementType.name,
                                          appPreferences:
                                              appPref.appPreferences,
                                          durationsEnum: value,
                                        );
                                  }
                                },
                                items: DurationsEnum.values.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      EnumToString.convertToString(
                                        e,
                                        camelCase: true,
                                      ),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: _MeasurementList(
                          measurementList: value.list,
                          measurementType: measurementType,
                          startDate: value.startDate,
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
    );
  }
}

class _MeasurementList extends StatelessWidget {
  _MeasurementList({
    Key? key,
    required this.measurementList,
    required this.measurementType,
    required this.startDate,
  }) : super(key: key);

  final List<Measurement> measurementList;
  final MeasurementType measurementType;
  final DateTime startDate;

  late String unit;

  @override
  Widget build(BuildContext context) {
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
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Current Measurement · ${measurementList.first.value} $unit',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        // ChartContainerForDetailed(
        //   startDate: startDate,
        //   chartDisplayModel: ChartDisplayModel.fromMeasurementList(
        //     measurement: measurementList,
        //     name: measurementType.name,
        //   ),
        // ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Measurement(${measurementList.length})',
                style: Theme.of(context).textTheme.titleLarge,
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
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: SizeConfig.screenHeight! * 0.4,
            ),
            // padding: const EdgeInsets.only(top: 8),
            width: SizeConfig.screenWidth! * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: measurementList.length,
                itemBuilder: (context, index) {
                  return _TableCell(
                    date: measurementList[index].date,
                    measurement: measurementList[index].value,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TableCell extends StatelessWidget {
  _TableCell({
    Key? key,
    required this.measurement,
    required this.date,
  }) : super(key: key);

  final double measurement;
  final DateTime date;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            measurement.toStringAsFixed(2),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            formatter.format(date),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
