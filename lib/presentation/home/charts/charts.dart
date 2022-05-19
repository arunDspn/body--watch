import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/display_models/chart_display.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/size_config.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  static const routeName = '/charts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Charts',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: BlocBuilder<ChartdataBloc, ChartdataState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (value) {
              return _SucessBody(
                list: value.chartDisplayModel,
              );
            },
            failed: (value) {
              // return _FailedBody();
              return const Center(
                child: Text('Failed'),
              );
            },
          );
        },
      ),
    );
  }
}

class _SucessBody extends StatelessWidget {
  const _SucessBody({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<ChartDisplayModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ChartContainer(
          chartDisplayModel: list[index],
        );
      },
    );
  }
}

class ChartContainer extends StatelessWidget {
  const ChartContainer({
    Key? key,
    required this.chartDisplayModel,
  }) : super(key: key);

  final ChartDisplayModel chartDisplayModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: SizeConfig.screenHeight! * 0.3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${chartDisplayModel.measurementName} ${chartDisplayModel.lastMeasurement}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return AddDataModal.add(
                            tableName: chartDisplayModel.tableName,
                            measurementName: chartDisplayModel.measurementName,
                          );
                        },
                      );
                    },
                    child: const Text('Add')),
              ],
            ),
            Expanded(
              child: TimeSeriesLineAnnotationChart(
                chartDisplayModel.measurementList,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Time series chart with line annotation example
///
/// The example future range annotation extends beyond the range of the series
/// data, demonstrating the effect of the [Charts.RangeAnnotation.extendAxis]
/// flag. This can be set to false to disable range extension.
///
/// Additional annotations may be added simply by adding additional
/// [Charts.RangeAnnotationSegment] items to the list.

class TimeSeriesLineAnnotationChart extends StatelessWidget {
  const TimeSeriesLineAnnotationChart(
    this.seriesList, {
    required this.animate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _endDate = DateTime.now().subtract(const Duration(days: 60));
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      behaviors: [
        charts.RangeAnnotation(
          [
            charts.LineAnnotationSegment(
              DateTime.now(),
              charts.RangeAnnotationAxisType.domain,
              startLabel: '${DateTime.now().day}.${DateTime.now().month}',
            ),
            charts.LineAnnotationSegment(
              _endDate,
              charts.RangeAnnotationAxisType.domain,
              endLabel: '${_endDate.day}.${_endDate.month}',
            ),
          ],
        ),
      ],
    );
  }

  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;
}
