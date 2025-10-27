import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/data/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/data/domain/measurement/models/measurement_model.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/add_widget/add_widget.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/chart_2/charts_view2.dart';
import 'package:watcha_body/presentation/display_models/measurement_display.dart';
import 'package:watcha_body/presentation/measurement_in_detail/helper/day_to_text.dart';
import 'package:watcha_body/presentation/measurement_in_detail/measurement_detailed.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/view/vault_section.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/overview/bloc/search_widgets_bloc.dart';
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
              case GetallwidgetsdataStateSuccess(:final widgets):
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
  const _EmptyWidgetList({
    super.key,
  });

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
  const _ElseCase({
    super.key,
  });

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
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
    required this.widgets,
  });

  final Map<String, List<MeasurementModel>> widgets;

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
            itemCount: widgets.keys.length,
            itemBuilder: (context, index) {
              final widget = widgets[widgets.keys.elementAt(index)];
              return _WidgetBox(
                key: Key(widget!.first.id.toString()),
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
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 12,
        ),
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
            context
                .read<SearchWidgetsBloc>()
                .add(SearchWidgetsEvent.keyChanged(value));
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

  final List<MeasurementModel> list;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesCubit, UserPreferencesState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (preferences) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _WidgetBox(
                  key: Key(list.hashCode.toString()),
                  data: list,
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
  const _WidgetBox({
    required Key key,
    required this.data,
  }) : super(key: key);

  final List<MeasurementModel> data;

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
    // late String _unit = '';
    // // final _preferences =
    // //     (context.watch<ApppreferencesBloc>().state as SavedAndReady)
    // //         .appPreferences;

    // if (widget.data.name is LengthMeasurementType) {
    //   _unit = _preferences.lengthUnitString;
    // } else if (widget.data.name is WeightMeasurementType) {
    //   _unit = _preferences.weightUnitString;
    // } else {
    //   _unit = '%';
    // }

    final minValue = widget.data.reduce(
      (value, element) => value.value < element.value ? value : element,
    );

    final maxValue = widget.data.reduce(
      (value, element) => value.value > element.value ? value : element,
    );

    print('rebinfing ------  box');

    final latestData = widget.data.first;

    final delta =
        widget.data.length > 1 ? latestData.value - widget.data[1].value : null;

    final pref =
        (context.read<UserPreferencesCubit>().state as UserPreferencesLoaded)
            .preferences;

    final metricCode = pref.firstWhereOrNull(
      (element) => element.metricCode == widget.data.last.metricCode,
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   MeasurementInDetail.routeName,
          //   arguments: widget.data.,
          // );
        },
        child: Container(
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
                              text: '${latestData.targetName} · ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  '${latestData.value / metricCode!.toBaseFactor} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: metricCode!.preferredUnit,
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
                            lastMeasurementDayFormatter.format(latestData.date),
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      if (delta != null)
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                delta < 0
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                color: delta < 0 ? Colors.red : Colors.green,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '${delta!.toStringAsFixed(1)} than ${formatDate(widget.data[1].date)}',
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
                          final targets = (context
                                  .read<GetallwidgetsCubit>()
                                  .state as GetAllWidgetSuccess)
                              .widgets;
                          final target = targets.firstWhere(
                            (element) => element.id == latestData.targetId,
                          );
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
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
                  key: Key(widget.data.hashCode.toString()),
                  data: widget.data,
                ),
            ],
          ),
        ),
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
  const _ExtraDetails({
    required super.key,
    required this.data,
  });

  final List<MeasurementModel> data;

  @override
  Widget build(BuildContext context) {
    final lastMeasurementDayFormatter = DateFormat('d MMM');
    final startDate = data.first.date;
    final endDate = data.last.date;
    final minValue = data.reduce(
      (value, element) => value.value < element.value ? value : element,
    );
    final maxValue = data.reduce(
      (value, element) => value.value > element.value ? value : element,
    );

    final pref =
        (context.read<UserPreferencesCubit>().state as UserPreferencesLoaded)
            .preferences;

    final metricCode = pref.firstWhereOrNull(
      (element) => element.metricCode == data.last.metricCode,
    );

    print('rebuiling ---- extra det');
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(16),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                // round
                // border: Border.all(
                //   color: Theme.of(context).colorScheme.primary,
                //   width: getProportionateScreenWidth(1),
                // ),
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(10),
                ),
                color: Theme.of(context)
                    .colorScheme
                    .inversePrimary
                    .withOpacity(.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '${lastMeasurementDayFormatter.format(startDate)} - ${lastMeasurementDayFormatter.format(endDate)}\n',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
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
                        text:
                            '${minValue.value / metricCode!.toBaseFactor} - ${maxValue.value / metricCode.toBaseFactor} ${metricCode.preferredUnit}\n',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
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
        ),
      ],
    );
  }
}
