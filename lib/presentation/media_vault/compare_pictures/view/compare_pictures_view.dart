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
    as ComparePictureFormCubitAlias;
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/load_picture_to_compare_cubit.dart';

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
    return BlocConsumer<ComparePictureFormCubitAlias.ComparePictureFormCubit,
        ComparePictureFormCubitAlias.ComparePictureFormState>(
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
                              ComparePictureFormCubitAlias
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
                                      ComparePictureFormCubitAlias
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
                                      ComparePictureFormCubitAlias
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

class _CompareView extends StatelessWidget {
  const _CompareView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadPictureToCompareCubit, LoadPictureToCompareState>(
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return const Center(
              child: Column(
                children: [
                  Text('Fill above form to compare pictures'),
                ],
              ),
            );
          },
          loading: (value) {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (value) {
            if (value.compareImagesModel.firstImages.isEmpty &&
                value.compareImagesModel.secondImages.isEmpty) {
              return const Center(
                child: Text('No images to compare'),
              );
            }
            return _CompareImageViewer(
              firstImages: value.compareImagesModel.firstImages,
              secondImages: value.compareImagesModel.secondImages,
            );
          },
          error: (value) {
            return Center(
              child: Text('Error + ${value.message}'),
            );
          },
        );
      },
    );
  }
}

class _CompareImageViewer extends StatefulWidget {
  const _CompareImageViewer({
    required this.firstImages,
    required this.secondImages,
  });

  final List<VaultImage> firstImages;
  final List<VaultImage> secondImages;

  @override
  State<_CompareImageViewer> createState() => _CompareImageViewerState();
}

class _CompareImageViewerState extends State<_CompareImageViewer> {
  int firstImageIndex = 0;
  int secondImageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageCompareSlider(
          // photoRadius: BorderRadius.circular(8),
          itemOne: Image.file(
            // 'assets/File-2.png',
            File(widget.firstImages[firstImageIndex].path),
            // height: size.height * 0.6,
            // width: size.width * 0.5,
            fit: BoxFit.cover,
          ),
          itemTwo: Image.file(
            // 'assets/File-4.png',
            File(widget.secondImages[secondImageIndex].path),
            // height: size.height * 0.6,
            // width: size.width * 0.5,
            fit: BoxFit.cover,
          ),
          itemOneBuilder: (child, context) => IntrinsicHeight(child: child),
          itemTwoBuilder: (child, context) => IntrinsicHeight(child: child),
        ),
        if (widget.firstImages.length > 1 && widget.secondImages.length > 1)
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (firstImageIndex > 0) {
                    setState(() {
                      firstImageIndex--;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_left),
              ),
              Text('${firstImageIndex + 1} / ${widget.firstImages.length}'),
              IconButton(
                onPressed: () {
                  if (firstImageIndex < widget.firstImages.length - 1) {
                    setState(() {
                      firstImageIndex++;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_right),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    if (secondImageIndex > 0) {
                      setState(() {
                        secondImageIndex--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_left)),
              Text('${secondImageIndex + 1} / ${widget.secondImages.length}'),
              IconButton(
                onPressed: () {
                  if (secondImageIndex < widget.secondImages.length - 1) {
                    setState(() {
                      secondImageIndex++;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          )
      ],
    );
  }
}
