import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/presentation/core/controllers/cubit/all_available_targets_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/image_tag_cubit/get_all_image_tags_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/components/view_comparison_data/cubit/comparison_data_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/components/view_comparison_data/view.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/compare_picture_form_cubit.dart'
    as compare_picture_form_cubit_alias;
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/load_picture_to_compare_cubit.dart';
import 'package:watcha_body/utils/folder_path.dart';

part '../components/compare_view.dart';

class ComparePicturesView extends StatefulWidget {
  const ComparePicturesView({super.key});

  static const routeName = '/compare-pictures';

  // 12 _jun -2020 formatter using intl
  static String? format(DateTime? date) {
    if (date == null) {
      return null;
    }
    return '${date.month}/${date.day}/${date.year}';
  }

  @override
  State<ComparePicturesView> createState() => _ComparePicturesViewState();
}

class _ComparePicturesViewState extends State<ComparePicturesView> {
  static const _fieldRadius = BorderRadius.all(Radius.circular(20));

  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return BlocConsumer<
      compare_picture_form_cubit_alias.ComparePictureFormCubit,
      compare_picture_form_cubit_alias.ComparePictureFormState
    >(
      listener: (context, state) {
        switch (state) {
          case compare_picture_form_cubit_alias.ComparePictureFormStateData(
                :final ready,
              )
              when ready:
            // context.read<LoadPictureToCompareCubit>().loadPicture(
            //       tag: tag,
            //       firstDate: firstDate!,
            //       secondDate: secondDate!,
            //     );
            break;

          default:
            break;
        }

        // state.mapOrNull(
        //   state: (value) {
        //     if (value.ready) {}
        //   },
        // );
      },
      builder: (context, compareDataState) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            title: const Text('Compare Pictures'),
            centerTitle: false,
            scrolledUnderElevation: 0,
            actions: [
              if (compareDataState.ready)
                TextButton(
                  child: const Text('View Comparsion Data'),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      builder: (context) {
                        return BlocProvider(
                          create: (context) =>
                              ComparisonDataCubit(
                                context.read<MeasurementRepository>(),
                              )..loadData(
                                dateOne: compareDataState.firstDate!,
                                dateTwo: compareDataState.secondDate!,
                              ),
                          child: ViewComparisonDataModalView(
                            firstDate: compareDataState.firstDate!,
                            secondDate: compareDataState.secondDate!,
                          ),
                        );
                      },
                    );
                  },
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: [
                      //     colorScheme.primaryContainer,
                      //     colorScheme.tertiaryContainer,
                      //   ],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      color: colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.all(Radius.circular(28)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Visual Progress Inspector',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Choose a tag, add targets, then compare two picture dates with an interactive slider.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card.outlined(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comparison Filters',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Select what and when you want to compare.',
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 16),
                          BlocBuilder<
                            GetAllImageTagsCubit,
                            GetAllImageTagsState
                          >(
                            builder: (context, state) {
                              return state.when(
                                initial: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loading: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loaded: (tags) {
                                  return DropDownTextField(
                                    onChanged: (value) {
                                      if (value.value != null) {
                                        final selectedTag =
                                            (value.value as ImageTagModel).id;
                                        context
                                            .read<
                                              compare_picture_form_cubit_alias.ComparePictureFormCubit
                                            >()
                                            .alterTag(selectedTag);
                                      }
                                    },
                                    dropDownList: tags.map((e) {
                                      return DropDownValueModel(
                                        name: e.tag,
                                        value: e,
                                      );
                                    }).toList(),
                                    textFieldDecoration: const InputDecoration(
                                      labelText: 'Tag',
                                      hintText: 'Search and select tag',
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: _fieldRadius,
                                      ),
                                    ),
                                  );
                                },
                                error: (message) {
                                  return Center(child: Text('Error: $message'));
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          BlocBuilder<
                            AllAvailableTargetsCubit,
                            AllAvailableTargetsState
                          >(
                            builder: (context, state) {
                              return state.when(
                                failure: (cause) {
                                  return Center(child: Text('Error: $cause'));
                                },
                                success: (widgets) {
                                  return MultiDropdown(
                                    items: widgets.map((e) {
                                      return DropdownItem(
                                        label: e.name,
                                        value: e,
                                      );
                                    }).toList(),
                                    onSelectionChange: (selectedItems) {
                                      final selectedIds = selectedItems
                                          .map(
                                            (e) => (e.id as dynamic).id as int,
                                          )
                                          .toList();
                                      context
                                          .read<
                                            compare_picture_form_cubit_alias.ComparePictureFormCubit
                                          >()
                                          .alerTargets(selectedIds);
                                    },
                                  );
                                },
                                initial: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loading: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _DateSelectorButton(
                                  label: 'Picture 1 Date',
                                  date: compareDataState.firstDate,
                                  onTap: () async {
                                    selectDate(context).then((value) {
                                      context
                                          .read<
                                            compare_picture_form_cubit_alias.ComparePictureFormCubit
                                          >()
                                          .alterFirstDate(value);
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _DateSelectorButton(
                                  label: 'Picture 2 Date',
                                  date: compareDataState.secondDate,
                                  onTap: () async {
                                    selectDate(context).then((value) {
                                      context
                                          .read<
                                            compare_picture_form_cubit_alias.ComparePictureFormCubit
                                          >()
                                          .alterSecondDate(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  if (compareDataState.ready)
                    FilledButton.icon(
                      icon: const Icon(Icons.compare),
                      label: const Text('Compare'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        context.read<LoadPictureToCompareCubit>().loadPicture(
                          tag: compareDataState.tag!,
                          firstDate: compareDataState.firstDate!,
                          secondDate: compareDataState.secondDate!,
                        );
                      },
                    ),

                  const SizedBox(height: 12),
                  const _CompareView(),
                ],
              ),
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: const Icon(Icons.add),
          // ),
        );
      },
    );
  }
}

class _DateSelectorButton extends StatelessWidget {
  const _DateSelectorButton({
    required this.label,
    required this.date,
    required this.onTap,
  });

  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        alignment: Alignment.centerLeft,
      ),
      onPressed: onTap,
      icon: const Icon(Icons.date_range),
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: theme.textTheme.labelMedium),
          Text(
            ComparePicturesView.format(date) ?? 'Select date',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
