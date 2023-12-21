import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/l10n/l10n.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/add_widget/add_widget.dart';
import 'package:watcha_body/presentation/display_models/measurement_display.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_to_text.dart';
import 'package:watcha_body/presentation/measurement_in_detail/measurement_detailed.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/sampleman.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/overview/widgets/overview_chart.dart';
import 'package:watcha_body/size_config.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).overViewTitle,
          // style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AddWidget.routeName);
            },
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.add,
          //     color: Theme.of(context).colorScheme.secondary,
          //   ),
          //   onPressed: () {
          //     Navigator.push<void>(context, MaterialPageRoute(
          //       builder: (context) {
          //         return SamplerMan();
          //       },
          //     ));
          //   },
          // ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<GetallwidgetsdataBloc, GetallwidgetsdataState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Icon(
                            Icons.error,
                            color: Theme.of(context).colorScheme.error,
                            size: 45,
                          ),
                        ),
                        Text(
                          'No You Cant See Me',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
                loading: (value) =>
                    const Center(child: CircularProgressIndicator()),
                success: (list) {
                  if (list.widgets.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.grey.shade300,
                              size: 45,
                            ),
                          ),
                          const Text('No Widgets Added'),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Add a widget by clicking + at top right \nto get started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: list.widgets.length,
                      itemBuilder: (context, index) {
                        return _WidgetBox(data: list.widgets[index]);
                      },
                    );
                    // return Column(
                    //   children:
                    //       list.widgets.map((e) => _WidgetBox(data: e)).toList(),
                    // );
                  }
                },
                failure: (cause) {
                  return Text(cause.cause);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _WidgetBox extends StatefulWidget {
  _WidgetBox({
    Key? key,
    required this.data,
  }) : super(key: key);

  final LatestMeasurementDisplayModel data;

  @override
  State<_WidgetBox> createState() => _WidgetBoxState();
}

class _WidgetBoxState extends State<_WidgetBox> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  final DateFormat lastMeasurementDayFormatter = DateFormat('d MMM');

  bool isExpanded = false;

  String formatDate(DateTime date) {
    final today = DateTime.now();
    final differenceInDays = today.difference(date).inDays;

    if (differenceInDays == 0) {
      return 'Today';
    } else if (differenceInDays == 1) {
      return 'Yesterday';
    } else if (differenceInDays >= 2 && differenceInDays <= 12) {
      return '$differenceInDays days ago';
    } else {
      final formatter = DateFormat('d MMM yyyy');
      return formatter.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    late String _unit;
    final _preferences =
        (context.watch<ApppreferencesBloc>().state as SavedAndReady)
            .appPreferences;

    if (widget.data.name is LengthMeasurementType) {
      _unit = _preferences.lengthUnitString;
    } else if (widget.data.name is WeightMeasurementType) {
      _unit = _preferences.weightUnitString;
    } else {
      _unit = '%';
    }

    final minValue = widget.data.lastThreeMonths.reduce(
      (value, element) => value.value < element.value ? value : element,
    );

    final maxValue = widget.data.lastThreeMonths.reduce(
      (value, element) => value.value > element.value ? value : element,
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            MeasurementInDetail.routeName,
            arguments: widget.data.name,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${widget.data.name.name} · ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            TextSpan(
                              text: '${widget.data.latest.value} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: _unit,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontSize: getProportionateScreenWidth(18),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         '${data.name.name} : ${data.latest.value} ',
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .headlineSmall
                      //             ?.copyWith(fontWeight: FontWeight.w600),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       Text(
                      //         _unit,
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .headlineMedium!
                      //             .copyWith(
                      //               fontSize: getProportionateScreenWidth(18),
                      //             ),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            lastMeasurementDayFormatter
                                .format(widget.data.latest.date),
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      if (widget.data.delta != null)
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                widget.data.delta! < 0
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                color: widget.data.delta! < 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '${widget.data.delta!.toStringAsFixed(1)} than ${formatDate(widget.data.previous!)}',
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )
                      else
                        const Text('No previous data'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: AddDataModal.add(
                                  type: widget.data.name,
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.primary,
                          size: getProportionateScreenHeight(30),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(
                          !isExpanded
                              ? Icons.expand_more_outlined
                              : Icons.expand_less_outlined,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     const Spacer(),
              //     IconButton(
              //       onPressed: () {
              //         setState(() {
              //           isExpanded = !isExpanded;
              //         });
              //       },
              //       icon: const Icon(Icons.expand_circle_down),
              //     ),
              //   ],
              // ),
              if (isExpanded)
                _ExtraDetails(
                  lastMeasurementDayFormatter: lastMeasurementDayFormatter,
                  data: widget.data,
                  minValue: minValue,
                  maxValue: maxValue,
                  unit: _unit,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExtraDetails extends StatelessWidget {
  const _ExtraDetails({
    super.key,
    required this.lastMeasurementDayFormatter,
    required this.data,
    required this.minValue,
    required this.maxValue,
    required String unit,
  }) : _unit = unit;

  final DateFormat lastMeasurementDayFormatter;
  final LatestMeasurementDisplayModel data;
  final Measurement minValue;
  final Measurement maxValue;
  final String _unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(16),
        ),
        Row(
          children: [
            SizedBox(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${lastMeasurementDayFormatter.format(data.startDate)} - ${lastMeasurementDayFormatter.format(data.endDate)}\n',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    // TextSpan(
                    //   text:
                    //       '${lastMeasurementDayFormatter.format(data.endDate)}\n',
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .labelMedium
                    //       ?.copyWith(fontWeight: FontWeight.w600),
                    // ),
                    TextSpan(
                      text: '${minValue.value} - ${maxValue.value} $_unit',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              indent: 6,
              color: Colors.red,
              thickness: 6,
              endIndent: 5,
              width: 22,
              // width: 6,
            ),
            Expanded(
              child: OverviewMetricsLineGraph(
                filteredMeasurements: data.lastThreeMonths,
                startDate: data.startDate,
                endDate: data.endDate,
                previousMeasurement: null,
                dayToText: DayToText(
                  startDate: data.endDate,
                  endDate: data.startDate,
                  timeUnit: TimeUnit.threeMonth,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
