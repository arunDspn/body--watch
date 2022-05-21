import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/display_models/chart_display.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/size_config.dart';
import 'package:charts_flutter/src/text_style.dart' as style;
import 'package:charts_flutter/src/text_element.dart' as charts_text;

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
    final _endDate = DateTime.now().subtract(const Duration(days: 30));
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
        includeArea: false,
        includePoints: true,
        includeLine: true,
        stacked: true,
        roundEndCaps: true,
      ),
      selectionModels: [
        SelectionModelConfig(
          changedListener: (SelectionModel model) {
            if (model.hasDatumSelection) {
              final formatter = DateFormat('yyyy-MM-dd');
              final date = formatter
                  // ignore: avoid_dynamic_calls
                  .format(model.selectedDatum[0].datum.date as DateTime);

              CustomCircleSymbolRenderer.date = date;
              // ignore: avoid_dynamic_calls
              CustomCircleSymbolRenderer.measurement = model
                  .selectedDatum[0].datum.measurement
                  .toString(); // paints the tapped value
            }
          },
        ),
      ],
      behaviors: [
        charts.RangeAnnotation(
          [
            charts.LineAnnotationSegment(
              _endDate,
              charts.RangeAnnotationAxisType.domain,
              endLabel: '${_endDate.day}-${_endDate.month}',
            ),
            charts.LineAnnotationSegment(
              DateTime.now(),
              charts.RangeAnnotationAxisType.domain,
              startLabel: '${DateTime.now().day}-${DateTime.now().month}',
            ),
          ],
        ),
        LinePointHighlighter(
          symbolRenderer: CustomCircleSymbolRenderer(),
        )
      ],
    );
  }

  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  static String date = '';
  static String measurement = '';
  @override
  void paint(
    ChartCanvas canvas,
    Rectangle<num> bounds, {
    List<int>? dashPattern,
    Color? fillColor,
    FillPatternType? fillPattern,
    Color? strokeColor,
    double? strokeWidthPx,
  }) {
    super.paint(
      canvas,
      bounds,
      dashPattern: dashPattern,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidthPx: strokeWidthPx,
    );
    canvas.drawRect(
      Rectangle(
        bounds.left - 5,
        bounds.top - 30,
        bounds.width + 80,
        bounds.height + 40,
      ),
      fill: Color.fromHex(code: '#424545'),
    );

    final textStyle = style.TextStyle()
      ..color = Color.white
      ..fontSize = 14;

    canvas
      // Date
      ..drawText(
        charts_text.TextElement(
          date,
          style: textStyle,
        ),
        (bounds.left).round(),
        (bounds.top - 28).round(),
      )
      // Measurement
      ..drawText(
        charts_text.TextElement(
          measurement,
          style: textStyle,
        ),
        (bounds.left).round(),
        (bounds.top - 10).round(),
      );
  }
}
