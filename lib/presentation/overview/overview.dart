import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/domain/measurement/models/overview_widget_model.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/add_widget/add_widget.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/chart_2/charts_view2.dart';
import 'package:watcha_body/presentation/chart_2/models/chart_models.dart';
import 'package:watcha_body/presentation/core/controllers/cubit/all_available_targets_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/view/vault_section.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/overview/bloc/search_widgets_bloc.dart';
import 'package:watcha_body/size_config.dart';
import 'package:watcha_body/utils/value_to_pref_value.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            onPressed: () {
              // Navigator.pushNamed(context, AddWidget.routeName);
              // Navigator.push<void>(context, MaterialPageRoute(
              //   builder: (context) {
              //     return const ChartsView2();
              //   },
              // ));

              Navigator.pushNamed(context, AddWidget.routeName);
            },
          ),
          //
          IconButton(
            onPressed: () {
              // context.read<BodyPictureRepository>().getAllTags();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChartsView2();
                  },
                ),
              );
            },
            icon: const Icon(Icons.emoji_emotions),
          ),
        ],
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(
      //     AppLocalizations.of(context).overViewTitle,
      //     // style: Theme.of(context).textTheme.displaySmall,
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.settings,
      //       color: Theme.of(context).colorScheme.tertiary,
      //     ),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/settings');
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.add,
      //         color: Theme.of(context).colorScheme.tertiary,
      //       ),
      //       onPressed: () {
      //         Navigator.pushNamed(context, AddWidget.routeName);
      //       },
      //     ),
      //     // IconButton(
      //     //   icon: Icon(
      //     //     Icons.add,
      //     //     color: Theme.of(context).colorScheme.secondary,
      //     //   ),
      //     //   onPressed: () {
      //     //     Navigator.push<void>(context, MaterialPageRoute(
      //     //       builder: (context) {
      //     //         return SamplerMan();
      //     //       },
      //     //     ));
      //     //   },
      //     // ),
      //   ],
      // ),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(120),
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(
      //         horizontal: 14,
      //         vertical: 12,
      //       ),
      //       child: SearchBar(
      //         padding: const MaterialStatePropertyAll(
      //           EdgeInsets.symmetric(horizontal: 8),
      //         ),
      //         elevation: const MaterialStatePropertyAll(1),
      //         hintText: 'Search',
      //         leading: Padding(
      //           padding: const EdgeInsets.all(8),
      //           child: Icon(
      //             Icons.search,
      //             color: Theme.of(context).colorScheme.secondary,
      //           ),
      //         ),
      //         trailing: [
      //           IconButton(
      //             icon: Icon(
      //               Icons.settings,
      //               color: Theme.of(context).colorScheme.tertiary,
      //             ),
      //             onPressed: () {
      //               Navigator.pushNamed(context, '/settings');
      //             },
      //           ),
      //           IconButton(
      //             icon: Icon(
      //               Icons.add,
      //               color: Theme.of(context).colorScheme.tertiary,
      //             ),
      //             onPressed: () {
      //               Navigator.pushNamed(context, AddWidget.routeName);
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocConsumer<GetallwidgetsdataBloc, GetallwidgetsdataState>(
          listener: (context, state) {
            switch (state) {
              case GetallwidgetsdataStateSuccess():
                // context
                //     .read<SearchWidgetsBloc>()
                //     .add(SearchWidgetsEvent.addData(list: widgets));
                break;

              default:
                break;
            }
            // state.mapOrNull(
            //   success: (value) {},
            // );
          },
          builder: (context, state) {
            return switch (state) {
              GetallwidgetsdataStateInitial() => const _ElseCase(),
              GetallwidgetsdataStateLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              GetallwidgetsdataStateSuccess(:final widgets)
                  when widgets.isEmpty =>
                const _EmptyWidgetList(),
              GetallwidgetsdataStateSuccess(:final widgets) => SearchView(
                widgets: widgets,
              ),
              GetallwidgetsdataStateFailure(:final cause) => Text(cause),
            };

            // return state.maybeMap(
            //   orElse: () {
            //     return _ElseCase();
            //   },
            //   loading: (value) =>
            //       const Center(child: CircularProgressIndicator()),
            //   success: (list) {
            //     if (list.widgets.isEmpty) {
            //       return _EmptyWidgetList();
            //     } else {
            //       return const SearchView();
            //       // return Column(
            //       //   children:
            //       //       list.widgets.map((e) => _WidgetBox(data: e)).toList(),
            //       // );
            //     }
            //   },
            //   failure: (cause) {
            //     return Text(cause.cause);
            //   },
            // );
          },
        ),
      ),
    );
  }
}

class _EmptyWidgetList extends StatelessWidget {
  const _EmptyWidgetList();

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 8),
          Text(
            'Add a widget by clicking + at top right \nto get started',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AddWidget.routeName);
              },
              child: const Text('Add Widget'),
            ),
          ),

          // Settings
          OutlinedButton.icon(
            label: const Text('Settings'),
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}

class _ElseCase extends StatelessWidget {
  const _ElseCase();

  @override
  Widget build(BuildContext context) {
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
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.widgets});

  final List<OverviewWidgetModel> widgets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(120),
      //   child: _SearchBar(),
      // ),
      // body: BlocBuilder<SearchWidgetsBloc, SearchWidgetsState>(
      //   builder: (context, state) {
      //     return switch (state) {
      //       SearchWidgetsStateLoading() =>
      //         const Center(child: CircularProgressIndicator()),
      //       SearchWidgetsStateFailed() => const Text('Utter'),
      //       SearchWidgetsStateLoaded(
      //         :final lists
      //       ) => // return _ReorderableWidgetList(list: value.lists);
      //         WidgetList(list: lists),
      //     };
      //   },
      body: BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (context, index) {
              final widget = widgets[index];
              return _WidgetBox(
                key: Key(widget.targetId.toString()),
                data: widget,
              );
            },
          );
        },
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar();

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  bool closeIcon = false;

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: SearchBar(
          controller: textEditingController,
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 8),
          ),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(
            Theme.of(context).colorScheme.tertiaryContainer.withOpacity(.2),
          ),
          hintText: 'Search',
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                closeIcon = true;
              } else {
                closeIcon = false;
              }
            });
            context.read<SearchWidgetsBloc>().add(
              SearchWidgetsEvent.keyChanged(value),
            );
          },
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: closeIcon
                ? GestureDetector(
                    onTap: () {
                      context.read<SearchWidgetsBloc>().add(
                        const SearchWidgetsEvent.keyChanged(''),
                      );
                      setState(() {
                        textEditingController.text = '';
                        closeIcon = false;
                      });
                    },
                    child: const Icon(Icons.chevron_left),
                  )
                : Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
          ),
          trailing: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AddWidget.routeName);
              },
            ),
            IconButton(
              onPressed: () {
                // context.read<BodyPictureRepository>().getAllTags();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const VaultSection();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.emoji_emotions),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetList extends StatelessWidget {
  const WidgetList({super.key, required this.list});

  final List<OverviewWidgetModel> list;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (preferences) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _WidgetBox(
                  key: Key(list[index].targetId.toString()),
                  data: list[index],
                );
              },
            );
          },
        );
      },
    );
  }
}

// class _ReorderableWidgetList extends StatefulWidget {
//   const _ReorderableWidgetList({
//     required this.list,
//   });
//   final List<LatestMeasurementDisplayModel> list;

//   @override
//   State<_ReorderableWidgetList> createState() => _ReorderableWidgetListState();
// }

// class _ReorderableWidgetListState extends State<_ReorderableWidgetList> {
//   late List<LatestMeasurementDisplayModel> reorderList;

//   @override
//   void initState() {
//     reorderList = [...widget.list];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ReorderableListView.builder(
//       onReorder: (oldIndex, newIndex) {
//         setState(() {
//           if (oldIndex < newIndex) {
//             newIndex -= 1;
//           }
//           final item = reorderList.removeAt(oldIndex);
//           reorderList.insert(newIndex, item);
//         });
//       },
//       itemCount: reorderList.length,
//       itemBuilder: (context, index) {
//         return _WidgetBox(
//           key: Key('${reorderList[index].name.name}box'),
//           data: reorderList[index],
//         );
//       },
//     );
//   }
// }

class _WidgetBox extends StatefulWidget {
  const _WidgetBox({required Key key, required this.data}) : super(key: key);

  final OverviewWidgetModel data;

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
    final latestMeasurements = widget.data.latestMeasurements;
    if (latestMeasurements.isEmpty) {
      return const SizedBox.shrink();
    }

    final latestData = latestMeasurements.first;

    final delta = latestMeasurements.length > 1
        ? latestData.value - latestMeasurements[1].value
        : null;

    final pref =
        (context.read<UserPreferencesCubit>().state as UserPreferencesLoaded)
            .preferences;

    final metricCode = pref.firstWhereOrNull(
      (element) => element.metricCode == widget.data.metricCode,
    );

    final preferredUnit = metricCode?.preferredUnit ?? '';
    final metricCodeValue = metricCode?.metricCode ?? latestData.metricCode;
    final toBaseFactor = metricCode?.toBaseFactor ?? 1;
    final convertedValue = UserMetricHelper.convertToUserPref(
      value: latestData.value,
      metricCode: metricCodeValue,
      context: context,
    );

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: GestureDetector(
        onTap: () {
          final safeFactor = toBaseFactor == 0 ? 1 : toBaseFactor;
          final chartData = latestMeasurements
              .map(
                (measurement) => DataPoint(
                  dateTime: measurement.date,
                  value: measurement.value / safeFactor,
                ),
              )
              .toList();

          Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ChartsView2(
                  data: chartData,
                  config: ChartConfig(
                    title: latestData.targetName,
                    unit: preferredUnit,
                    color: theme.colorScheme.primary,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    showGridLines: true,
                  ),
                  defaultFilter: ChartFilter.threeMonth,
                );
              },
            ),
          );
        },
        child: Card(
          elevation: isExpanded ? 1 : 0,
          color: theme.colorScheme.surfaceContainerHighest,
          shadowColor: theme.colorScheme.shadow.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: theme.colorScheme.outlineVariant.withOpacity(0.55),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isCompact = constraints.maxWidth < 440;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          latestData.targetName,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: theme.colorScheme.secondaryContainer,
                          ),
                          child: Text(
                            '$convertedValue $preferredUnit',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        _MetricChip(
                          icon: Icons.event,
                          text: lastMeasurementDayFormatter.format(
                            latestData.date,
                          ),
                        ),
                        if (delta != null)
                          _MetricChip(
                            icon: delta < 0
                                ? Icons.south_rounded
                                : Icons.north_rounded,
                            text:
                                '${delta.toStringAsFixed(1)} than ${formatDate(latestMeasurements[1].date)}',
                            backgroundColor: delta < 0
                                ? theme.colorScheme.errorContainer
                                : theme.colorScheme.tertiaryContainer,
                            foregroundColor: delta < 0
                                ? theme.colorScheme.onErrorContainer
                                : theme.colorScheme.onTertiaryContainer,
                          )
                        else
                          _MetricChip(
                            icon: Icons.timeline,
                            text: 'No previous data',
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (isCompact)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FilledButton.tonalIcon(
                            onPressed: () {
                              final targets =
                                  (context
                                              .read<AllAvailableTargetsCubit>()
                                              .state
                                          as Success)
                                      .targets;
                              final target = targets.firstWhere(
                                (element) => element.id == latestData.targetId,
                              );
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (context) {
                                  return AddorEditMeasurementTargetModal.edit(
                                    type: target,
                                    addedId: latestData.id,
                                    addedValue: latestData.value,
                                    addedDate: latestData.date,
                                    notes: latestData.notes,
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Add Data'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            icon: Icon(
                              !isExpanded
                                  ? Icons.expand_more_rounded
                                  : Icons.expand_less_rounded,
                            ),
                            label: Text(isExpanded ? 'Less' : 'More'),
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          FilledButton.tonalIcon(
                            onPressed: () {
                              final targets =
                                  (context.read<GetallwidgetsCubit>().state
                                          as GetAllWidgetSuccess)
                                      .widgets;
                              final target = targets.firstWhere(
                                (element) => element.id == latestData.targetId,
                              );
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (context) {
                                  return BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 2,
                                      sigmaY: 2,
                                    ),
                                    child: AddorEditMeasurementTargetModal.edit(
                                      type: target,
                                      addedId: latestData.id,
                                      addedValue: latestData.value,
                                      addedDate: latestData.date,
                                      notes: latestData.notes,
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Add Data'),
                          ),
                          const Spacer(),
                          IconButton.filledTonal(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            icon: Icon(
                              !isExpanded
                                  ? Icons.expand_more_rounded
                                  : Icons.expand_less_rounded,
                            ),
                          ),
                        ],
                      ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 220),
                      firstChild: const SizedBox.shrink(),
                      secondChild: _ExtraDetails(
                        key: Key(widget.data.hashCode.toString()),
                        data: widget.data,
                      ),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({
    required this.icon,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
  });

  final IconData icon;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = backgroundColor ?? theme.colorScheme.surfaceContainerHigh;
    final fg = foregroundColor ?? theme.colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: fg),
          const SizedBox(width: 6),
          Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: fg,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// class _WidgetBox extends StatefulWidget {
//   const _WidgetBox({
//     required Key key,
//     required this.data,
//   }) : super(key: key);

//   final LatestMeasurementDisplayModel data;

//   @override
//   State<_WidgetBox> createState() => _WidgetBoxState();
// }

// class _WidgetBoxState extends State<_WidgetBox> {
//   final DateFormat formatter = DateFormat('yyyy-MM-dd');

//   final DateFormat lastMeasurementDayFormatter = DateFormat('d MMM');

//   bool isExpanded = false;

//   String formatDate(DateTime date) {
//     final today = DateTime.now();
//     final differenceInDays = today.difference(date).inDays;

//     if (differenceInDays == 0) {
//       return 'Today';
//     } else if (differenceInDays == 1) {
//       return 'Yesterday';
//     } else if (differenceInDays >= 2 && differenceInDays <= 12) {
//       return '$differenceInDays days ago';
//     } else {
//       final formatter = DateFormat('d MMM yyyy');
//       return formatter.format(date);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     late String _unit = '';
//     final _preferences =
//         (context.watch<ApppreferencesBloc>().state as SavedAndReady)
//             .appPreferences;

//     // if (widget.data.name is LengthMeasurementType) {
//     //   _unit = _preferences.lengthUnitString;
//     // } else if (widget.data.name is WeightMeasurementType) {
//     //   _unit = _preferences.weightUnitString;
//     // } else {
//     //   _unit = '%';
//     // }

//     final minValue = widget.data.lastThreeMonths.reduce(
//       (value, element) => value.value < element.value ? value : element,
//     );

//     final maxValue = widget.data.lastThreeMonths.reduce(
//       (value, element) => value.value > element.value ? value : element,
//     );

//     print('rebinfing ------  box');

//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(
//             context,
//             MeasurementInDetail.routeName,
//             arguments: widget.data.name,
//           );
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(12),
//             ),
//             color: Theme.of(context).colorScheme.primaryContainer,
//           ),
//           width: double.infinity,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: '${widget.data.name.name} · ',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineSmall
//                                   ?.copyWith(
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                             ),
//                             TextSpan(
//                               text: '${widget.data.latest.value} ',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineSmall
//                                   ?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                             TextSpan(
//                               text: _unit,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineMedium!
//                                   .copyWith(
//                                     fontSize: getProportionateScreenWidth(18),
//                                   ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Align(
//                       //   alignment: Alignment.topLeft,
//                       //   child: Row(
//                       //     crossAxisAlignment: CrossAxisAlignment.end,
//                       //     children: [
//                       //       Text(
//                       //         '${data.name.name} : ${data.latest.value} ',
//                       //         style: Theme.of(context)
//                       //             .textTheme
//                       //             .headlineSmall
//                       //             ?.copyWith(fontWeight: FontWeight.w600),
//                       //         textAlign: TextAlign.center,
//                       //       ),
//                       //       Text(
//                       //         _unit,
//                       //         style: Theme.of(context)
//                       //             .textTheme
//                       //             .headlineMedium!
//                       //             .copyWith(
//                       //               fontSize: getProportionateScreenWidth(18),
//                       //             ),
//                       //         textAlign: TextAlign.center,
//                       //       ),
//                       //     ],
//                       //   ),
//                       // ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: Text(
//                             lastMeasurementDayFormatter
//                                 .format(widget.data.latest.date),
//                             style: Theme.of(context).textTheme.titleMedium,
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                       ),
//                       if (widget.data.delta != null)
//                         Row(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Icon(
//                                 widget.data.delta! < 0
//                                     ? Icons.arrow_drop_down
//                                     : Icons.arrow_drop_up,
//                                 color: widget.data.delta! < 0
//                                     ? Colors.red
//                                     : Colors.green,
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 '${widget.data.delta!.toStringAsFixed(1)} than ${formatDate(widget.data.previous!)}',
//                                 style: Theme.of(context).textTheme.titleSmall,
//                                 textAlign: TextAlign.left,
//                               ),
//                             ),
//                           ],
//                         )
//                       else
//                         const Text('No previous data'),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // showModalBottomSheet<void>(
//                           //   context: context,
//                           //   builder: (context) {
//                           //     return BackdropFilter(
//                           //       filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//                           //       child: AddDataModal.add(
//                           //         type: widget.data.name,
//                           //       ),
//                           //     );
//                           //   },
//                           // );
//                         },
//                         icon: Icon(
//                           Icons.add,
//                           color: Theme.of(context).colorScheme.primary,
//                           size: getProportionateScreenHeight(30),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isExpanded = !isExpanded;
//                           });
//                         },
//                         icon: Icon(
//                           !isExpanded
//                               ? Icons.expand_more_outlined
//                               : Icons.expand_less_outlined,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               // Row(
//               //   children: [
//               //     const Spacer(),
//               //     IconButton(
//               //       onPressed: () {
//               //         setState(() {
//               //           isExpanded = !isExpanded;
//               //         });
//               //       },
//               //       icon: const Icon(Icons.expand_circle_down),
//               //     ),
//               //   ],
//               // ),
//               // if (isExpanded)
//               //   _ExtraDetails(
//               //     key: Key('${widget.data.name.name}extraData'),
//               //     lastMeasurementDayFormatter: lastMeasurementDayFormatter,
//               //     data: widget.data,
//               //     minValue: minValue,
//               //     maxValue: maxValue,
//               //     unit: _unit,
//               //   ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class _ExtraDetails extends StatelessWidget {
  const _ExtraDetails({required super.key, required this.data});

  final OverviewWidgetModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final latestMeasurements = data.latestMeasurements;
    if (latestMeasurements.isEmpty) {
      return const SizedBox.shrink();
    }

    final lastMeasurementDayFormatter = DateFormat('d MMM');
    final startDate = latestMeasurements.first.date;
    final endDate = latestMeasurements.last.date;
    final latestValue = latestMeasurements.first.value;

    final pref =
        (context.read<UserPreferencesCubit>().state as UserPreferencesLoaded)
            .preferences;

    final metricCode = pref.firstWhereOrNull(
      (element) => element.metricCode == data.metricCode,
    );

    final metricCodeValue = metricCode?.metricCode ?? data.metricCode;
    final toBaseFactor = metricCode?.toBaseFactor ?? 1;
    final unit = metricCode?.preferredUnit ?? '';
    final rangeValue = data.highestValue - data.lowestValue;

    final latestDisplay = UserMetricHelper.convertToUserPref(
      value: latestValue,
      metricCode: metricCodeValue,
      context: context,
    );
    final trendValues = latestMeasurements
        .take(10)
        .toList()
        .reversed
        .map((e) => e.value / toBaseFactor)
        .toList();
    final minDisplay = (data.lowestValue / toBaseFactor).toStringAsFixed(1);
    final maxDisplay = (data.highestValue / toBaseFactor).toStringAsFixed(1);
    final rangeDisplay = (rangeValue / toBaseFactor).toStringAsFixed(1);
    final goalDisplay = data.goalValue == null
        ? null
        : UserMetricHelper.convertToUserPref(
            value: data.goalValue!,
            metricCode: metricCodeValue,
            context: context,
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 520;
            final tileWidth = isCompact
                ? constraints.maxWidth
                : (constraints.maxWidth - 10) / 2;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: theme.colorScheme.primaryContainer,
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.insights_rounded,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${lastMeasurementDayFormatter.format(startDate)} - ${lastMeasurementDayFormatter.format(endDate)}\n',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                              TextSpan(
                                text: '$minDisplay - $maxDisplay $unit',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: tileWidth,
                      child: _DetailStatTile(
                        title: 'Latest',
                        value: '$latestDisplay $unit',
                        icon: Icons.fiber_manual_record_rounded,
                        accentColor: theme.colorScheme.primary,
                      ),
                    ),
                    SizedBox(
                      width: tileWidth,
                      child: _DetailStatTile(
                        title: 'Range',
                        value: '$rangeDisplay $unit',
                        icon: Icons.swap_vert_rounded,
                        accentColor: theme.colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(
                      width: tileWidth,
                      child: _DetailStatTile(
                        title: 'Lowest',
                        value: '$minDisplay $unit',
                        icon: Icons.south_rounded,
                        accentColor: theme.colorScheme.error,
                      ),
                    ),
                    SizedBox(
                      width: tileWidth,
                      child: _DetailStatTile(
                        title: 'Highest',
                        value: '$maxDisplay $unit',
                        icon: Icons.north_rounded,
                        accentColor: theme.colorScheme.secondary,
                      ),
                    ),
                    if (goalDisplay != null)
                      SizedBox(
                        width: tileWidth,
                        child: _DetailStatTile(
                          title: 'Goal',
                          value: '$goalDisplay $unit',
                          icon: Icons.flag_rounded,
                          accentColor: theme.colorScheme.primary,
                        ),
                      ),
                  ],
                ),
                if (trendValues.length > 1) ...[
                  const SizedBox(height: 12),
                  _MiniTrendChart(values: trendValues, unit: unit),
                ],
              ],
            );
          },
        ),
        // Expanded(
        //   child: OverviewMetricsLineGraph(
        //     // key: Key('${data.name.name}overviewGraph'),
        //     filteredMeasurements: data,
        //     startDate: startDate,
        //     endDate: endDate,
        //     previousMeasurement: null,
        //     dayToText: DayToText(
        //       startDate: endDate,
        //       endDate: startDate,
        //       timeUnit: TimeUnit.threeMonth,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class _MiniTrendChart extends StatelessWidget {
  const _MiniTrendChart({required this.values, required this.unit});

  final List<double> values;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final points = <FlSpot>[];

    for (var i = 0; i < values.length; i++) {
      points.add(FlSpot(i.toDouble(), values[i]));
    }

    final minYRaw = values.reduce((a, b) => a < b ? a : b);
    final maxYRaw = values.reduce((a, b) => a > b ? a : b);
    final ySpan = (maxYRaw - minYRaw).abs();
    final yPad = ySpan == 0 ? 1.0 : ySpan * 0.18;
    final minY = minYRaw - yPad;
    final maxY = maxYRaw + yPad;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: theme.colorScheme.surfaceContainer,
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Trend',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Last ${values.length} values${unit.isNotEmpty ? ' ($unit)' : ''}',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 92,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(enabled: false),
                gridData: FlGridData(
                  drawVerticalLine: false,
                  drawHorizontalLine: true,
                  horizontalInterval: (maxY - minY) / 2,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: theme.colorScheme.outlineVariant.withOpacity(0.22),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: (values.length - 1).toDouble(),
                minY: minY,
                maxY: maxY,
                lineBarsData: [
                  LineChartBarData(
                    spots: points,
                    isCurved: true,
                    curveSmoothness: 0.2,
                    color: theme.colorScheme.primary,
                    barWidth: 2.5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, barData) {
                        return spot.x == 0 ||
                            spot.x == (values.length - 1).toDouble();
                      },
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 3.2,
                          color: theme.colorScheme.primary,
                          strokeWidth: 1.6,
                          strokeColor: theme.colorScheme.surface,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.primary.withOpacity(0.2),
                          theme.colorScheme.primary.withOpacity(0.02),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailStatTile extends StatelessWidget {
  const _DetailStatTile({
    required this.title,
    required this.value,
    required this.icon,
    required this.accentColor,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.96, end: 1),
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: theme.colorScheme.surfaceContainerHigh,
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.14),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(icon, size: 18, color: accentColor),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    value,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
