import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/presentation/core/controllers/cubit/all_available_targets_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/components/custom_drop_down/custom_drop_down.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_image_tag_cubit/add_new_image_tag_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_media_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/image_tag_cubit/get_all_image_tags_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/gallery_view/vault_gallery_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';

class AddNewMediaView extends StatefulWidget {
  const AddNewMediaView({super.key});

  static const routeName = '/add_new_media';

  @override
  State<AddNewMediaView> createState() => _AddNewMediaViewState();
}

class _AddNewMediaViewState extends State<AddNewMediaView> {
  // Tag
  ImageTagModel? tag;

  //  Datetime
  DateTime? date;

  // Image Path
  String imagePath = '';

  // Formater with intl package
  final _formatter = DateFormat('yyyy-MM-dd');

  // Form key
  final _formKey = GlobalKey<FormState>();

  final _muscleGroups = <MeasurementTargetModel>{};

  // Note
  String note = '';

  Widget _buildSectionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Add New Media'),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<AllAvailableTargetsCubit, AllAvailableTargetsState>(
          builder: (context, measurementTargetState) {
            return measurementTargetState.when(
              initial: () {
                return const Text('No invokation');
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              failure: (cause) {
                return Text(cause);
              },
              success: (muscleGroups) {
                final dropDownTargetItems = muscleGroups.map((e) {
                  return DropdownItem<MeasurementTargetModel>(
                    value: e,
                    label: e.name,
                  );
                }).toList();
                return BlocListener<AddNewMediaCubit, AddNewMediaState>(
                  listener: (context, state) {
                    switch (state) {
                      case AddNewMediaStateInitial():
                        break;
                      case AddNewMediaStateLoading():
                        // dialog box of loading
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const AlertDialog(
                              title: Center(child: CircularProgressIndicator()),
                            );
                          },
                        );
                        break;

                      case AddNewMediaStateSuccess(:final savedImage):
                        Navigator.of(context).pop();
                        context.read<LoadPicturesCubit>().updateList(
                          savedImage,
                        );
                        // context
                        //     .read<FilteredGalleryImagesCubit>()
                        //     .updateList(s.savedImage);
                        Navigator.pop(context);
                        break;
                      case AddNewMediaStateFailure(:final failure):
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(failure)));
                        break;
                    }
                  },
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 104),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Capture your progress',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Add a photo, organize it with tags, and connect it to your targets.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 18),
                            _buildSectionCard(
                              context: context,
                              icon: Icons.sell_outlined,
                              title: 'Media Tag',
                              child:
                                  BlocBuilder<
                                    GetAllImageTagsCubit,
                                    GetAllImageTagsState
                                  >(
                                    builder: (context, state) {
                                      return state.when(
                                        initial: () => const SizedBox.shrink(),
                                        loading: () =>
                                            const CircularProgressIndicator(),
                                        error: (cause) => Text('Error: $cause'),
                                        loaded: (tags) {
                                          return BlocListener<
                                            AddNewImageTagCubit,
                                            AddNewImageTagState
                                          >(
                                            listener: (context, state) {
                                              state.when(
                                                initial: () {},
                                                loading: () {},
                                                success: (newTag) {
                                                  context
                                                      .read<
                                                        GetAllImageTagsCubit
                                                      >()
                                                      .refreshImageTags();
                                                  setState(() {
                                                    tag = newTag;
                                                  });
                                                },
                                                error: (message) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(message),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child:
                                                CustomDropDown<ImageTagModel>(
                                                  selectedItem: tag,
                                                  items: tags,
                                                  hintText: 'Select or Add Tag',
                                                  displayBuilder: (item) {
                                                    return item.tag;
                                                  },
                                                  onItemSelected: (item) {
                                                    setState(() {
                                                      tag = item;
                                                    });
                                                  },
                                                  onAddNewItem: (item) {
                                                    context
                                                        .read<
                                                          AddNewImageTagCubit
                                                        >()
                                                        .addImageTag(item);
                                                  },
                                                ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                            ),
                            const SizedBox(height: 14),
                            _buildSectionCard(
                              context: context,
                              icon: Icons.calendar_month_outlined,
                              title: 'Capture Date',
                              child: GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        date = value;
                                      });
                                    }
                                  });
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: TextEditingController(
                                      text: date != null
                                          ? _formatter.format(date!)
                                          : '',
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: colorScheme.surface,
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      hintText: 'Measurement Date',
                                      suffixIcon: Icon(
                                        date == null
                                            ? Icons.radio_button_unchecked
                                            : Icons.radio_button_checked,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.calendar_today_outlined,
                                      ),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter date';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            _buildSectionCard(
                              context: context,
                              icon: Icons.fitness_center_outlined,
                              title: 'Target Muscle Groups',
                              child: MultiDropdown<MeasurementTargetModel>(
                                items: dropDownTargetItems,
                                searchEnabled: true,
                                fieldDecoration: FieldDecoration(
                                  hintText: 'Measurement Target Groups',
                                  hintStyle: TextStyle(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.sports_gymnastics_outlined,
                                  ),
                                  showClearIcon: false,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: colorScheme.outlineVariant,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: colorScheme.primary,
                                      width: 1.6,
                                    ),
                                  ),
                                ),
                                chipDecoration: ChipDecoration(
                                  backgroundColor:
                                      colorScheme.secondaryContainer,
                                  labelStyle: TextStyle(
                                    color: colorScheme.onSecondaryContainer,
                                  ),
                                  wrap: true,
                                  runSpacing: 8,
                                  spacing: 8,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                dropdownDecoration: const DropdownDecoration(
                                  marginTop: 6,
                                  maxHeight: 500,
                                  header: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Select Muscle Groups',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                dropdownItemDecoration: DropdownItemDecoration(
                                  selectedIcon: Icon(
                                    Icons.check_box_rounded,
                                    color: colorScheme.primary,
                                  ),
                                  disabledIcon: Icon(
                                    Icons.lock,
                                    color: colorScheme.outlineVariant,
                                  ),
                                ),
                                onSelectionChange: (selectedItems) {
                                  _muscleGroups
                                    ..clear()
                                    ..addAll(selectedItems);
                                },
                              ),
                            ),
                            const SizedBox(height: 14),
                            _buildSectionCard(
                              context: context,
                              icon: Icons.note_alt_outlined,
                              title: 'Optional Notes',
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: colorScheme.surface,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  hintText: 'Write details about this photo',
                                  prefixIcon: const Icon(
                                    Icons.note_add_outlined,
                                  ),
                                ),
                                maxLines: 3,
                                onChanged: (value) {
                                  setState(() {
                                    note = value;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 14),
                            _buildSectionCard(
                              context: context,
                              icon: Icons.add_a_photo_outlined,
                              title: 'Photo',
                              child: MeasurementPictureSelectorFormField(
                                builder: (field) {
                                  return _MeasurementPictureSelector(field);
                                },
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      imagePath = newValue;
                                    });
                                  }
                                },
                                initialValue: '',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select an image';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        label: const Text('Save Media'),
        icon: const Icon(Icons.check_circle_outline_rounded),
        onPressed: () {
          if (_formKey.currentState!.validate() && tag != null) {
            context.read<AddNewMediaCubit>().saveMedia(
              date: date!,
              tag: tag!.tag,
              path: imagePath,
              targets: _muscleGroups.map((e) => e.id).toList(),
              tagId: tag!.id,
              note: note,
            );
          } else if (tag == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select a tag.')),
            );
          }
        },
      ),
    );
  }
}

class MeasurementPictureSelectorFormField extends FormField<String> {
  const MeasurementPictureSelectorFormField({
    super.key,
    required super.builder,
    required super.onSaved,
    required super.initialValue,
    required super.validator,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
  });
}

class _MeasurementPictureSelector extends StatelessWidget {
  const _MeasurementPictureSelector(this.formState);

  final FormFieldState<String> formState;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        // show modal
        showModalBottomSheet<(String, String)>(
          context: context,
          showDragHandle: true,
          builder: (context) {
            return const AddMediaModal();
          },
        ).then((value) {
          if (value != null) {
            formState
              ..didChange(value.$1)
              ..save();
          }
        });
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  width: 1.2,
                  color: formState.hasError
                      ? colorScheme.error
                      : colorScheme.outlineVariant,
                ),
                color: colorScheme.surfaceContainer,
              ),
              height: MediaQuery.of(context).size.width * 0.86,
              child: formState.value == null || formState.value == ''
                  ? SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 64,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Add an Image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap to select from camera or gallery',
                            style: TextStyle(
                              fontSize: 14,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Image.file(File(formState.value!), fit: BoxFit.cover),
            ),
          ),
          // If error in state show error as text
          if (formState.hasError)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  formState.errorText!,
                  style: TextStyle(color: colorScheme.error, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// class _Wonder extends StatelessWidget {
//   const _Wonder(this.onTap);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _NewWig(context.read<BodyPictureRepository>()),
//       ],
//     );
//   }
// }
