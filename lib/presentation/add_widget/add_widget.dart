import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/data/repositories/goals_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/add_initial_measurement_data/add_initial_measurement_data_modal.dart';
import 'package:watcha_body/presentation/add_initial_measurement_data/cubit/add_initial_measurement_data_cubit.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/custom_target_editor/custom_target_editor_sheet.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({Key? key}) : super(key: key);

  static const routeName = '/addWidget';

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  Future<void> _showCustomTargetEditorSheet() async {
    final formData = await showModalBottomSheet<CustomTargetEditorFormData>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (sheetContext) {
        return const CustomTargetEditorSheet(isEditMode: false);
      },
    );

    if (formData != null && mounted) {
      final repository = context.read<MeasurementRepository>();
      final result = await repository.createCustomTarget(
        name: formData.name,
        metricCode: formData.metricType,
        category: formData.category,
      );

      if (!mounted) return;

      result.fold(
        (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to create target: $error')),
          );
        },
        (target) {
          // Reload the target list
          context.read<GetallwidgetsCubit>().fetch();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Created target: ${target.name}')),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetallwidgetsCubit(context.read<MeasurementRepository>())..fetch(),

      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _showCustomTargetEditorSheet,
          tooltip: 'Create custom target',
          child: const Icon(Icons.add),
        ),
        body: BlocListener<AdddataCubit, AdddataState>(
          listener: (context, state) {
            switch (state) {
              case AddDataFailure(:final message):
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to add data: $message')),
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
                          GetAllWidgetLoading() => const Center(
                            child: CircularProgressIndicator(),
                          ),
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
                          GetAllWidgetSuccess(widgets: final widgets) =>
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: ListView.builder(
                                  itemCount: widgets.length,
                                  itemBuilder: (context, index) {
                                    return _Boxes(target: widgets[index]);
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
      ),
    );
  }
}

class _Boxes extends StatelessWidget {
  const _Boxes({Key? key, required this.target}) : super(key: key);

  final MeasurementTargetModel target;

  Future<void> _showCustomTargetMenu(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                target.name,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showEditCustomTargetSheet(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                title: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showDeleteConfirmation(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showEditCustomTargetSheet(BuildContext context) async {
    final formData = await showModalBottomSheet<CustomTargetEditorFormData>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (sheetContext) {
        return CustomTargetEditorSheet(
          initialName: target.name,
          initialMetricType: target.metricCode,
          initialCategory: target.category,
          isEditMode: true,
        );
      },
    );

    if (formData != null && context.mounted) {
      final repository = context.read<MeasurementRepository>();
      final result = await repository.updateCustomTarget(
        id: target.id,
        name: formData.name,
        category: formData.category,
      );

      if (!context.mounted) return;

      result.fold(
        (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update target: $error')),
          );
        },
        (_) {
          // Reload the target list
          context.read<GetallwidgetsCubit>().fetch();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Updated target: ${formData.name}')),
          );
        },
      );
    }
  }

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    final shouldDelete =
        await showDialog<bool>(
          context: context,
          builder: (dialogContext) {
            final colorScheme = Theme.of(dialogContext).colorScheme;
            return AlertDialog(
              title: const Text('Delete Custom Target?'),
              content: Text(
                "Delete '${target.name}' and its measurements? This action cannot be undone.",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext, false),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                  ),
                  onPressed: () => Navigator.pop(dialogContext, true),
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        ) ??
        false;

    if (!shouldDelete || !context.mounted) return;

    final repository = context.read<MeasurementRepository>();
    final result = await repository.deleteCustomTarget(id: target.id);

    if (!context.mounted) return;

    result.fold(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete target: $error')),
        );
      },
      (_) {
        // Reload the target list
        context.read<GetallwidgetsCubit>().fetch();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Deleted '${target.name}'")));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: target.isCustom
          ? () => _showCustomTargetMenu(context)
          : null,
      onTap: () async {
        if (target.code == 'bmi') {
          final shouldEnable =
              await showDialog<bool>(
                context: context,
                builder: (dialogContext) {
                  return AlertDialog(
                    title: const Text('Enable BMI tracking?'),
                    content: const Text(
                      'BMI is auto-calculated from your height and weight. Do you want to enable BMI tracking now?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(false),
                        child: const Text('Cancel'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.of(dialogContext).pop(true),
                        child: const Text('Enable'),
                      ),
                    ],
                  );
                },
              ) ??
              false;

          if (!shouldEnable || !context.mounted) {
            return;
          }

          final result = await context
              .read<MeasurementRepository>()
              .activateBmiTracking();

          if (!context.mounted) {
            return;
          }

          final navigator = Navigator.of(context);
          final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);

          result.fold(
            (failure) {
              scaffoldMessenger?.showSnackBar(
                SnackBar(
                  content: Text('Failed to enable BMI tracking: $failure'),
                ),
              );
            },
            (status) {
              context.read<GetallwidgetsdataBloc>().add(
                const GetallwidgetsdataEvent.fetchAllData(),
              );

              final message = switch ((
                status.hasHeightData,
                status.hasWeightData,
              )) {
                (true, true) =>
                  status.didTriggerInitialCalculation
                      ? 'BMI tracking enabled. BMI has been calculated from your latest data.'
                      : 'BMI tracking enabled. New weight entries will update BMI automatically.',
                (false, true) =>
                  'BMI tracking enabled. Add height to start automatic BMI updates.',
                (true, false) =>
                  'BMI tracking enabled. Add weight to start automatic BMI updates.',
                (false, false) =>
                  'BMI tracking enabled. Add height and weight to start automatic BMI updates.',
              };

              scaffoldMessenger?.showSnackBar(SnackBar(content: Text(message)));
              navigator.pop();
            },
          );
          return;
        }

        await showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            // return AddorEditMeasurementTargetModal.add(type: target);
            return BlocProvider(
              create: (context) => AddInitialMeasurementDataCubit(
                measurementRepository: context.read<MeasurementRepository>(),
                goalsRepository: context.read<GoalsRepository>(),
              ),
              child: AddInitialMeasurementDataModal(type: target),
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
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
