import 'dart:math';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/display_models/chart_display.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/presentation/home/charts/bloc/filter_chart_bloc/filterchart_bloc.dart';
import 'package:watcha_body/size_config.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  static const routeName = '/charts';

  @override
  Widget build(BuildContext context) {
    final _appPref = context.read<ApppreferencesBloc>().state as SavedAndReady;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Charts',
          style: Theme.of(context).textTheme.headline3,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        actions: [
          BlocConsumer<ChartdataBloc, ChartdataState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (state) {
                  context.read<FilterchartBloc>().add(
                        FilterchartEvent.initialData(
                          chartDisplayModelList: state.chartDisplayModelList,
                          durationsEnum: state.durationsEnum,
                          startDate: state.startDate,
                        ),
                      );
                },
              );
            },
            builder: (context, state) {
              return state.maybeMap(
                orElse: SizedBox.shrink,
                success: (state) {
                  context.read<FilterchartBloc>().add(
                        FilterchartEvent.initialData(
                          chartDisplayModelList: state.chartDisplayModelList,
                          durationsEnum: state.durationsEnum,
                          startDate: state.startDate,
                        ),
                      );
                  return DropdownButton<DurationsEnum>(
                    //TODO: Better universal
                    borderRadius: BorderRadius.circular(20),
                    value: state.durationsEnum,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    underline: Container(),
                    onChanged: (value) {
                      if (value != null) {
                        context.read<ChartdataBloc>().add(
                              ChartdataEvent.fetchData(
                                duration: value,
                                appPreferences: _appPref.appPreferences,
                              ),
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
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      );
                    }).toList(),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ChartdataBloc, ChartdataState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
            success: (value) {
              return _SucessBody(
                list: value.chartDisplayModelList,
                startDate: value.startDate,
              );
            },
            failed: (value) {
              // return _FailedBody();
              return Center(
                child: Text(
                  'Failed',
                  style: Theme.of(context).textTheme.headline6,
                ),
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
    required this.startDate,
  }) : super(key: key);

  final List<ChartDisplayModel> list;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: Text(
          'No data has been added yet',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    } else {
      return BlocBuilder<FilterchartBloc, FilterchartState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: CircularProgressIndicator.new,
            data: (filterState) {
              final filteredList = list
                  .where(
                    (element) => !filterState.filteredTypes
                        .contains(element.measurementName),
                  )
                  .toList();
              return Column(
                children: [
                  // Chips
                  SizedBox(
                    height: SizeConfig.screenHeight! * .1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (final e in list)
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: FilterChip(
                              selected: !filterState.filteredTypes
                                  .contains(e.type.name),
                              label: Text(
                                e.type.name,
                                // style: Theme.of(context).textTheme.bodyText1,
                              ),
                              onSelected: (selev) {
                                var list = [...filterState.filteredTypes];
                                if (selev) {
                                  list = list
                                      .where((ele) => ele != e.type.name)
                                      .toList();
                                  context.read<FilterchartBloc>().add(
                                        FilterchartEvent.filtering(
                                          chartDisplayModelList:
                                              filterState.chartDisplayModelList,
                                          durationsEnum:
                                              filterState.durationsEnum,
                                          startDate: filterState.startDate,
                                          filterString: list,
                                        ),
                                      );
                                } else {
                                  context.read<FilterchartBloc>().add(
                                        FilterchartEvent.filtering(
                                          chartDisplayModelList:
                                              filterState.chartDisplayModelList,
                                          durationsEnum:
                                              filterState.durationsEnum,
                                          startDate: filterState.startDate,
                                          filterString: list..add(e.type.name),
                                        ),
                                      );
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return ChartContainer(
                          chartDisplayModel: filteredList[index],
                          startDate: startDate,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }
  }
}

class ChartContainer extends StatelessWidget {
  const ChartContainer({
    Key? key,
    required this.chartDisplayModel,
    required this.startDate,
    this.withLimiter = false,
  }) : super(key: key);

  const ChartContainer.withDateLimiter({
    Key? key,
    required this.chartDisplayModel,
    required this.startDate,
    this.withLimiter = true,
  }) : super(key: key);

  final ChartDisplayModel chartDisplayModel;
  final DateTime startDate;
  final bool withLimiter;

  @override
  Widget build(BuildContext context) {
    final _appPref = context.read<ApppreferencesBloc>().state as SavedAndReady;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        height: SizeConfig.screenHeight! * 0.3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${chartDisplayModel.measurementName}  ${chartDisplayModel.lastMeasurement}',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                if (!withLimiter)
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return AddDataModal.add(
                            type: chartDisplayModel.type,
                          );
                        },
                      );
                    },
                    child: const Text('Add'),
                  )
                else
                  BlocBuilder<ChartdataBloc, ChartdataState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: SizedBox.shrink,
                        success: (state) {
                          return DropdownButton<DurationsEnum>(
                            value: state.durationsEnum,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            underline: Container(),
                            onChanged: (value) {
                              if (value != null) {
                                context.read<ChartdataBloc>().add(
                                      ChartdataEvent.fetchData(
                                        duration: value,
                                        appPreferences: _appPref.appPreferences,
                                      ),
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
                                ),
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  ),
              ],
            ),
            // Expanded(
            //   child: TimeSeriesLineAnnotationChart(
            //     chartDisplayModel.measurementList,
            //     animate: true,
            //     startDate: startDate,
            //   ),
            // ),
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

// class TimeSeriesLineAnnotationChart extends StatelessWidget {
//   const TimeSeriesLineAnnotationChart(
//     this.seriesList, {
//     required this.animate,
//     required this.startDate,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // State
//     // Now we have almost
//     // but those grids and end date start date at end of graph
//     // final _endDate = DateTime.now().subtract(const Duration(days: 60));
//     return charts.TimeSeriesChart(
//       seriesList,
//       animate: animate,

//       // this is how we can add annotations
//       // Date
//       domainAxis: charts.DateTimeAxisSpec(
//         renderSpec: charts.GridlineRendererSpec(
//           labelStyle: charts.TextStyleSpec(
//             // color: charts.MaterialPalette.white,
//             color: charts.ColorUtil.fromDartColor(
//               Theme.of(context).textTheme.bodyText1!.color!,
//             ),
//           ),
//           // 2 vertical lines
//           // Remove this

//           // use grey color for gridlines in white by using seconfry font color
//           lineStyle: charts.LineStyleSpec(
//             // color: charts.MaterialPalette.black,
//             color: charts.ColorUtil.fromDartColor(
//               Theme.of(context).textTheme.bodyText2!.color!,
//             ),
//             thickness: 0,
//           ),
//           // dont know what it si
//           axisLineStyle: charts.LineStyleSpec(
//             // color: charts.MaterialPalette.white,
//             color: charts.ColorUtil.fromDartColor(
//               Theme.of(context).textTheme.bodyText2!.color!,
//             ),
//           ),
//           tickLengthPx: 0,
//           labelCollisionRotation: 2,
//         ),
//         showAxisLine: false,
//         // How Months show at down
//         // recurrent
//         // tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
//         //   month: charts.TimeFormatterSpec(
//         //     format: 'M',
//         //     transitionFormat: 'mm',
//         //   ),
//         // ),
//       ),
//       // Measurements
//       primaryMeasureAxis: charts.NumericAxisSpec(
//         renderSpec: charts.GridlineRendererSpec(
//           axisLineStyle: charts.LineStyleSpec(
//             // color: charts.MaterialPalette.black,
//             // color: charts.ColorUtil.fromDartColor(
//             //   Theme.of(context).textTheme.bodyText1!.color!,
//             // ),
//             color: charts.ColorUtil.fromDartColor(
//               Colors.red,
//             ),
//           ),
//           labelStyle: charts.TextStyleSpec(
//             fontSize: 10,
//             // color: charts.MaterialPalette.white,
//             color: charts.ColorUtil.fromDartColor(
//               Theme.of(context).textTheme.bodyText1!.color!,
//             ),
//           ), //chnage white color as per your requirement.
//           tickLengthPx: 0,
//           // Horizontal lines
//           lineStyle: charts.LineStyleSpec(
//             color: charts.ColorUtil.fromDartColor(
//               Theme.of(context).textTheme.bodyText2!.color!,
//             ),
//             // color: charts.ColorUtil.fromDartColor(Colors.red),
//             thickness: 0,
//             dashPattern: const [10, 10],
//           ),
//         ),
//         showAxisLine: false,
//         // those divisons 2 4 6 8 9 22
//         tickProviderSpec: const charts.BasicNumericTickProviderSpec(
//           zeroBound: false,
//           dataIsInWholeNumbers: true,
//           desiredTickCount: 5,
//         ),
//       ),
//       defaultRenderer: charts.LineRendererConfig(
//         includeArea: false,
//         includePoints: true,
//         includeLine: true,
//         stacked: false,
//         roundEndCaps: false,
//       ),
//       selectionModels: [
//         SelectionModelConfig(
//           changedListener: (SelectionModel model) {
//             if (model.hasDatumSelection) {
//               final formatter = DateFormat('yyyy-MM-dd');
//               final date = formatter
//                   // ignore: avoid_dynamic_calls
//                   .format(model.selectedDatum[0].datum.date as DateTime);

//               CustomCircleSymbolRenderer.date = date;
//               // ignore: avoid_dynamic_calls
//               CustomCircleSymbolRenderer.measurement = model
//                   .selectedDatum[0].datum.value
//                   .toString(); // paints the tapped value
//             }
//           },
//         ),
//       ],
//       behaviors: [
//         charts.RangeAnnotation(
//           [
//             charts.LineAnnotationSegment(
//               startDate,
//               charts.RangeAnnotationAxisType.domain,
//               endLabel: '${startDate.day}-${startDate.month}',
//               labelPosition: charts.AnnotationLabelPosition.outside,
//               labelAnchor: charts.AnnotationLabelAnchor.middle,
//               // Start Small Label for end or last date
//               labelStyleSpec: charts.TextStyleSpec(
//                 fontSize: 8,
//                 // color: charts.MaterialPalette.white,
//                 color: charts.ColorUtil.fromDartColor(
//                   Theme.of(context).textTheme.bodyText1!.color!,
//                 ),
//               ),
//               // TODO(me): add end date
//               // color: charts.ColorUtil.fromDartColor(Colors.grey.shade900),
//               // color: charts.ColorUtil.fromDartColor(
//               //   Theme.of(context).textTheme.bodyText2!.color!,
//               // ),
//               color: charts.ColorUtil.fromDartColor(Colors.transparent),

//               // labelAnchor: charts.AnnotationLabelAnchor.end,
//             ),
//             charts.LineAnnotationSegment(
//               DateTime.now(), charts.RangeAnnotationAxisType.domain,
//               startLabel: '${DateTime.now().day}-${DateTime.now().month}',
//               // End Date SMall
//               labelStyleSpec: charts.TextStyleSpec(
//                 fontSize: 8,
//                 color: charts.ColorUtil.fromDartColor(
//                   Theme.of(context).textTheme.bodyText1!.color!,
//                 ),
//               ),
//               labelPosition: charts.AnnotationLabelPosition.outside,
//               labelAnchor: charts.AnnotationLabelAnchor.middle,
//               //TODO: Use custom
//               // color: charts.ColorUtil.fromDartColor(Colors.red.shade900),
//               // End Line
//               // color: charts.ColorUtil.fromDartColor(
//               //   Theme.of(context).textTheme.bodyText2!.color!,
//               // ),
//               color: charts.ColorUtil.fromDartColor(Colors.transparent),
//               // labelPosition: AnnotationLabelPosition.margin,
//             ),
//           ],
//         ),
//         LinePointHighlighter(
//           symbolRenderer: CustomCircleSymbolRenderer(),
//         )
//       ],
//     );
//   }

//   final List<charts.Series<dynamic, DateTime>> seriesList;
//   final bool animate;
//   final DateTime startDate;
// }

// class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
//   static String date = '';
//   static String measurement = '';
//   @override
//   void paint(
//     ChartCanvas canvas,
//     Rectangle<num> bounds, {
//     List<int>? dashPattern,
//     Color? fillColor,
//     FillPatternType? fillPattern,
//     Color? strokeColor,
//     double? strokeWidthPx,
//   }) {
//     super.paint(
//       canvas,
//       bounds,
//       dashPattern: dashPattern,
//       fillColor: fillColor,
//       strokeColor: strokeColor,
//       strokeWidthPx: strokeWidthPx,
//     );
//     canvas.drawRect(
//       Rectangle(
//         bounds.left - 5,
//         bounds.top - 30,
//         bounds.width + 80,
//         bounds.height + 40,
//       ),
//       fill: Color.fromHex(code: '#424545'),
//     );

//     final textStyle = style.TextStyle()
//       ..color = Color.white
//       ..fontSize = 14;

//     canvas
//       // Date
//       ..drawText(
//         charts_text.TextElement(
//           date,
//           style: textStyle,
//         ),
//         (bounds.left).round(),
//         (bounds.top - 28).round(),
//       )
//       // Measurement
//       ..drawText(
//         charts_text.TextElement(
//           measurement,
//           style: textStyle,
//         ),
//         (bounds.left).round(),
//         (bounds.top - 10).round(),
//       );
//   }
// }

// class ChartContainerForDetailed extends StatelessWidget {
//   const ChartContainerForDetailed({
//     Key? key,
//     required this.chartDisplayModel,
//     required this.startDate,
//     this.withLimiter = false,
//   }) : super(key: key);

//   final ChartDisplayModel chartDisplayModel;
//   final DateTime startDate;
//   final bool withLimiter;

//   @override
//   Widget build(BuildContext context) {
//     final _appPref = context.read<ApppreferencesBloc>().state as SavedAndReady;

//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Theme.of(context).colorScheme.secondaryContainer,
//       ),
//       height: SizeConfig.screenHeight! * 0.3,
//       child: Column(
//         children: [
//           Expanded(
//             child: TimeSeriesLineAnnotationChart(
//               chartDisplayModel.measurementList,
//               animate: true,
//               startDate: startDate,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
