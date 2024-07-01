import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/components/tag_dropdown_menu/view/view.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/components/view_comparison_data/cubit/comparison_data_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/components/view_comparison_data/view.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/compare_picture_form_cubit.dart'
    as compare_picture_form_cubit_alias;
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/load_picture_to_compare_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/components/custom_image_provider.dart';

part '../components/compare_view.dart';

class ComparePicturesView extends StatelessWidget {
  const ComparePicturesView({super.key});

  static const routeName = '/compare-pictures';

  // 12 _jun -2020 formatter using intl
  static String? format(DateTime? date) {
    if (date == null) {
      return null;
    }
    return '${date.month}/${date.day}/${date.year}';
  }

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
        state.mapOrNull(
          state: (value) {
            if (value.ready) {
              context.read<LoadPictureToCompareCubit>().loadPicture(
                    tag: value.tag,
                    firstDate: value.firstDate!,
                    secondDate: value.secondDate!,
                  );
            }
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Compare Pictures'),
            actions: [
              if (state.ready)
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
                              dateOne: state.firstDate!,
                              dateTwo: state.secondDate!,
                            ),
                          child: ViewComparisonDataModalView(
                            firstDate: state.firstDate!,
                            secondDate: state.secondDate!,
                          ),
                        );
                      },
                    );
                  },
                )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TagDropDownMenu(
                    bodyPictureRepository:
                        context.read<BodyPictureRepository>(),
                    onSelected: (tag) {
                      context
                          .read<
                              compare_picture_form_cubit_alias
                              .ComparePictureFormCubit>()
                          .alterTag(tag);
                    },
                  ),
                  // TextFormField(
                  //   decoration: const InputDecoration(
                  //     contentPadding: EdgeInsets.all(8),
                  //     isDense: true,
                  //     labelText: 'Select a Tag',
                  //     labelStyle: TextStyle(
                  //       fontSize: 14,
                  //     ),
                  //     prefixIcon: Icon(Icons.tag),
                  //     suffixIcon: Icon(Icons.arrow_drop_down),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(12),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.46,
                        child: GestureDetector(
                          onTap: () {
                            selectDate(context).then((value) {
                              context
                                  .read<
                                      compare_picture_form_cubit_alias
                                      .ComparePictureFormCubit>()
                                  .alterFirstDate(value);
                            });
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: TextEditingController(
                                  text: format(state.firstDate)),
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
                          onTap: () {
                            selectDate(context).then((value) {
                              context
                                  .read<
                                      compare_picture_form_cubit_alias
                                      .ComparePictureFormCubit>()
                                  .alterSecondDate(value);
                            });
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: TextEditingController(
                                text: format(state.secondDate),
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
