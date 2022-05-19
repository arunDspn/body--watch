import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';
import 'package:watcha_body/l10n/l10n.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/add_widget/add_widget.dart';
import 'package:watcha_body/presentation/display_models/measurement_display.dart';
import 'package:watcha_body/presentation/measurement_in_detail/measurement_detailed.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
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
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
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
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AddWidget.routeName);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<GetallwidgetsdataBloc, GetallwidgetsdataState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const Text('No You Cant See Me');
                },
                success: (list) {
                  if (list.widgets.isEmpty) {
                    return const Center(
                      child: Text('Nothing at all'),
                    );
                  } else {
                    return Column(
                      children:
                          list.widgets.map((e) => _WidgetBox(data: e)).toList(),
                    );
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

class _WidgetBox extends StatelessWidget {
  _WidgetBox({
    Key? key,
    required this.data,
  }) : super(key: key);

  final LatestMeasurementDisplayModel data;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final _preferences = context.watch<ApppreferencesBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            MeasurementInDetail.routeName,
            arguments: MeasurementWidget(data.name, data.tableName),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${data.name} : ${data.latest.measurement.toString()} ',
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          _preferences.lengthUnitString,
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        formatter.format(data.latest.date),
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  if (data.delta != null)
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            data.delta! < 0
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: data.delta! < 0 ? Colors.red : Colors.green,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${data.delta!.toStringAsFixed(1)} than ${formatter.format(data.previous!)}',
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )
                  else
                    const Text('No previous data'),
                ],
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) {
                      return AddDataModal.add(
                        tableName: data.tableName,
                        measurementName: data.name,
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
