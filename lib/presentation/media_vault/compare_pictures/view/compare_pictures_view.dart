import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/image_tag_cubit/get_all_image_tags_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/components/tag_dropdown_menu/view/view.dart';
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
    final size = MediaQuery.of(context).size;
    return BlocConsumer<
        compare_picture_form_cubit_alias.ComparePictureFormCubit,
        compare_picture_form_cubit_alias.ComparePictureFormState>(
      listener: (context, state) {
        switch (state) {
          case compare_picture_form_cubit_alias.ComparePictureFormStateData(
                :final ready,
                :final firstDate,
                :final secondDate,
                :final tag,
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
          appBar: AppBar(
            title: const Text('Compare Pictures'),
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
                          create: (context) => ComparisonDataCubit(
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
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // TagDropDownMenu(
                  //   bodyPictureRepository:
                  //       context.read<BodyPictureRepository>(),
                  //   onSelected: (tag) {
                  //     context
                  //         .read<
                  //             compare_picture_form_cubit_alias
                  //             .ComparePictureFormCubit>()
                  //         .alterTag(tag);
                  //   },
                  // ),

                  // Tag dropdown using dropdown_textfield package
                  BlocBuilder<GetAllImageTagsCubit, GetAllImageTagsState>(
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
                          // A searchable dropdown menu for tags
                          return DropDownTextField(
                            onChanged: (value) {
                              if (value.value != null) {
                                final selectedTag =
                                    (value.value as ImageTagModel).id;
                                context
                                    .read<
                                        compare_picture_form_cubit_alias
                                        .ComparePictureFormCubit>()
                                    .alterTag(selectedTag);
                              }
                            },
                            dropDownList: tags.map(
                              (e) {
                                return DropDownValueModel(
                                  name: e.tag,
                                  value: e,
                                );
                              },
                            ).toList(),
                            // Rounded border
                            textFieldDecoration: const InputDecoration(
                              labelText: 'Select Tag',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          );
                        },
                        error: (message) {
                          return Center(
                            child: Text('Error: $message'),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(
                    height: 22,
                  ),
                  // Measurement target dropdown menu
                  BlocBuilder<GetallwidgetsCubit, GetallwidgetsState>(
                    builder: (context, state) {
                      return state.when(
                        failure: (cause) {
                          return Center(
                            child: Text('Error: $cause'),
                          );
                        },
                        success: (widgets) {
                          // return DropDownTextField.multiSelection(
                          //   onChanged: (value) {},
                          //   dropDownList: widgets.map(
                          //     (e) {
                          //       return DropDownValueModel(
                          //         name: e.name,
                          //         value: e,
                          //       );
                          //     },
                          //   ).toList(),
                          //   textFieldDecoration: const InputDecoration(
                          //     labelText: 'Select Measurement Target',
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(12),
                          //       ),
                          //     ),
                          //   ),
                          // );
                          return MultiDropdown(
                            items: widgets.map(
                              (e) {
                                return DropdownItem(label: e.name, value: e);
                              },
                            ).toList(),
                            onSelectionChange: (selectedItems) {
                              final selectedIds = selectedItems
                                  .map((e) => (e.id as dynamic).id as int)
                                  .toList();
                              context
                                  .read<
                                      compare_picture_form_cubit_alias
                                      .ComparePictureFormCubit>()
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

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.46,
                        child: GestureDetector(
                          onTap: () async {
                            selectDate(context).then((value) {
                              context
                                  .read<
                                      compare_picture_form_cubit_alias
                                      .ComparePictureFormCubit>()
                                  .alterFirstDate(value);
                            });

                            // final selectedDate = await selectDate(context);
                            // setState(() {
                            //   firstDate = selectedDate;
                            // });
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: TextEditingController(
                                text: ComparePicturesView.format(
                                  // state.firstDate,
                                  // firstDate,
                                  compareDataState.firstDate,
                                ),
                              ),
                              decoration: const InputDecoration(
                                isDense: true,
                                labelText: 'Picture 1 Date',
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                prefixIcon: Icon(Icons.date_range),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: size.width * 0.46,
                        child: GestureDetector(
                          onTap: () async {
                            selectDate(context).then((value) {
                              context
                                  .read<
                                      compare_picture_form_cubit_alias
                                      .ComparePictureFormCubit>()
                                  .alterSecondDate(value);
                            });

                            // final selectedDate = await selectDate(context);

                            // setState(() {
                            //   secondDate = selectedDate;
                            // });
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: TextEditingController(
                                text: ComparePicturesView.format(
                                  compareDataState.secondDate,
                                ),
                              ),
                              decoration: const InputDecoration(
                                isDense: true,
                                labelText: 'Picture 2 Date',
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                prefixIcon: Icon(Icons.date_range),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: const Text('Compare'),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),

                  if (compareDataState.ready)
                    // Button to load comparison view
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoadPictureToCompareCubit>().loadPicture(
                              tag: compareDataState.tag!,
                              firstDate: compareDataState.firstDate!,
                              secondDate: compareDataState.secondDate!,
                            );
                      },
                      child: const Text('Compare'),
                    ),

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
