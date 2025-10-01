import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/measurement_target/model/measurement_target_model.dart';
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
          switch (state) {
            case AddDataFailure(:final message):
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to add data: $message'),
                ),
              );
              break;
            case AddDataSuccess():
              Navigator.of(context).pop();
              break;
            default:
              // No action needed for initial or loading states
              break;
          }
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
                      return switch (state) {
                        GetAllWidgetInitial() => const Text('Never see me'),
                        GetAllWidgetLoading() =>
                          const Center(child: CircularProgressIndicator()),
                        GetAllWidgetFailure(:final cause) => Center(
                            child: Text('Failed to load widgets: $cause'),
                          ),
                        GetAllWidgetSuccess(widgets: final widgets)
                            when widgets.isEmpty =>
                          Expanded(
                            child: Center(
                              child: Text(
                                'No widgets remaining',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                        GetAllWidgetSuccess(widgets: final widgets) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: ListView.builder(
                                itemCount: widgets.length,
                                itemBuilder: (context, index) {
                                  return _Boxes(
                                    target: widgets[index],
                                  );
                                },
                              ),
                            ),
                          ),
                      };
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
    required this.target,
  }) : super(key: key);

  final MeasurementTargetModel target;

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
                type: target,
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
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Center(
            child: Text(
              target.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
