import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/display_models/chart_display.dart';
import 'package:watcha_body/presentation/home/charts/charts.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/getallmeasurments_cubit.dart';
import 'package:watcha_body/size_config.dart';

class MeasurementInDetail extends StatelessWidget {
  const MeasurementInDetail({
    Key? key,
    required this.measurementWidget,
  }) : super(key: key);

  static const routeName = '/measurement_in_detail';

  final MeasurementWidget measurementWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: SizeConfig.screenHeight! * 0.08,
              child: Stack(
                children: [
                  Align(
                    child: Text(
                      measurementWidget.name,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocListener<AdddataCubit, AdddataState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  success: (_) {
                    context.read<GetallmeasurmentsCubit>().fetchAllData(
                          tableName: measurementWidget.tableName,
                        );
                  },
                );
              },
              child:
                  BlocBuilder<GetallmeasurmentsCubit, GetallmeasurmentsState>(
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
                      return Expanded(
                        child: _MeasurementList(
                          measurementList: value.list,
                          measurementWidget: measurementWidget,
                          startDate:
                              DateTime.now().subtract(const Duration(days: 30)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MeasurementList extends StatelessWidget {
  const _MeasurementList({
    Key? key,
    required this.measurementList,
    required this.measurementWidget,
    required this.startDate,
  }) : super(key: key);

  final List<Measurement> measurementList;
  final MeasurementWidget measurementWidget;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartContainerForDetailed(
          startDate: startDate,
          chartDisplayModel: ChartDisplayModel.fromMeasurementList(
            measurement: measurementList,
            name: measurementWidget.name,
            tableName: measurementWidget.tableName,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Measurement(${measurementList.length})',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) {
                      return AddDataModal.add(
                        tableName: measurementWidget.tableName,
                        measurementName: measurementWidget.name,
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
                    measurement: measurementList[index].measurement,
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
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            formatter.format(date),
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
