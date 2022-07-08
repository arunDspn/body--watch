import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/presentation/add_data_modal/add_data_modal.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';

class AddWidget extends StatelessWidget {
  const AddWidget({Key? key}) : super(key: key);

  static const routeName = '/addWidget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AdddataCubit, AdddataState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (_) => Navigator.of(context).pop(),
          );
        },
        child: Builder(
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                  ),
                  BlocBuilder<GetallwidgetsCubit, GetallwidgetsState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () {
                          return const Text('Never see me');
                        },
                        success: (value) {
                          if (value.widgets.isEmpty) {
                            return Expanded(
                              child: Center(
                                child: Text(
                                  'No widgets remaining',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            );
                          }
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: ListView.builder(
                                itemCount: value.widgets.length,
                                itemBuilder: (context, index) {
                                  return _Boxes(
                                    type: value.widgets[index],
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        failure: (value) {
                          return Text('Failed${value.cause}');
                        },
                        loading: (_) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Boxes extends StatelessWidget {
  const _Boxes({
    Key? key,
    required this.type,
  }) : super(key: key);

  final MeasurementType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AddDataModal(
                type: type,
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          child: Center(
            child: Text(
              type.name,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      ),
    );
  }
}
