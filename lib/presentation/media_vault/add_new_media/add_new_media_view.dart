import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/domain/models/save_vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/components/custom_drop_down/custom_drop_down.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/components/tag_dropdown/tag_dropdown.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_image_tag_cubit/add_new_image_tag_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_media_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/image_tag_cubit/get_all_image_tags_cubit.dart';
import 'package:watcha_body/presentation/media_vault/common/cubits/cubit/get_all_muscle_groups_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Media'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<GetallwidgetsCubit, GetallwidgetsState>(
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
                final dropDownTargetItems = muscleGroups.map(
                  (e) {
                    return DropdownItem<MeasurementTargetModel>(
                      value: e,
                      label: e.name,
                    );
                  },
                ).toList();
                return BlocListener<AddNewMediaCubit, AddNewMediaState>(
                  listener: (context, state) {
                    switch (state) {
                      case AddNewMediaStateInitial():
                        break;
                      case AddNewMediaStateLoading():
                        // dialog box of loading
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        );
                        break;

                      case AddNewMediaStateSuccess(:final savedImage):
                        Navigator.of(context).pop();
                        context
                            .read<LoadPicturesCubit>()
                            .updateList(savedImage);
                        // context
                        //     .read<FilteredGalleryImagesCubit>()
                        //     .updateList(s.savedImage);
                        Navigator.pop(context);
                        break;
                      case AddNewMediaStateFailure(:final failure):
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(failure),
                          ),
                        );
                        break;
                    }
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // TagsDropdown(
                            //   context.read<BodyPictureRepository>(),
                            //   (tag) {
                            //     setState(() {
                            //       this.tag = tag;
                            //     });
                            //   },
                            // ),

                            Center(
                              child: BlocBuilder<GetAllImageTagsCubit,
                                  GetAllImageTagsState>(
                                builder: (context, state) {
                                  return state.when(
                                    initial: () => const SizedBox.shrink(),
                                    loading: () =>
                                        const CircularProgressIndicator(),
                                    error: (cause) => Text('Error: $cause'),
                                    loaded: (tags) {
                                      return BlocListener<AddNewImageTagCubit,
                                          AddNewImageTagState>(
                                        listener: (context, state) {
                                          state.when(
                                            initial: () {},
                                            loading: () {},
                                            success: (newTag) {
                                              // add the new tag to the list
                                              // tags.add(newTag);
                                              context
                                                  .read<GetAllImageTagsCubit>()
                                                  .refreshImageTags();
                                              setState(() {
                                                tag = newTag;
                                              });
                                            },
                                            error: (message) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(message),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: CustomDropDown<ImageTagModel>(
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
                                                .read<AddNewImageTagCubit>()
                                                .addImageTag(item);
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            // TextField -- Measurement Date
                            GestureDetector(
                              onTap: () {
                                // show date picker
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),
                                ).then((value) {
                                  // if not null
                                  if (value != null) {
                                    // set date
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
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    hintText: 'Measurement Date',
                                    suffixIcon: Icon(
                                      date == null
                                          ? Icons.radio_button_unchecked
                                          : Icons.radio_button_checked,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.calendar_month_outlined,
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

                            const SizedBox(
                              height: 20,
                            ),

                            // Muscle group selection chips
                            MultiDropdown<MeasurementTargetModel>(
                              items: dropDownTargetItems,
                              // controller: controller,
                              searchEnabled: true,
                              // chipDecoration: const ChipDecoration(
                              //   backgroundColor: Colors.yellow,
                              //   wrap: true,
                              //   runSpacing: 2,
                              //   spacing: 10,
                              // ),
                              fieldDecoration: FieldDecoration(
                                hintText: 'Measurement Target Groups',
                                hintStyle:
                                    const TextStyle(color: Colors.black87),
                                prefixIcon: const Icon(
                                  Icons.sports_gymnastics_outlined,
                                ),
                                showClearIcon: false,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              dropdownDecoration: const DropdownDecoration(
                                marginTop: 2,
                                maxHeight: 600,
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
                                selectedIcon: const Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                                disabledIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              // validator: (value) {},
                              onSelectionChange: (selectedItems) {
                                // debugPrint('OnSelectionChange: $selectedItems');
                                _muscleGroups
                                  ..clear()
                                  ..addAll(selectedItems);
                              },
                            ),

                            // Picture Notes
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(14),
                                  ),
                                ),
                                hintText: 'Notes',
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

                            // IMage view
                            const SizedBox(
                              height: 20,
                            ),
                            MeasurementPictureSelectorFormField(
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
                            // Spacer(),

                            const SizedBox(
                              height: 20,
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
        label: const Text(
          'Save',
          style: TextStyle(),
        ),
        icon: const Icon(Icons.image),
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
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: formState.hasError
                      ? Colors.red.shade300
                      : Colors.grey.shade300,
                ),
                color: Colors.grey.shade300,
              ),
              height: MediaQuery.of(context).size.width * 0.9,
              // width: MediaQuery.of(context).size.width * 0.9,
              child: formState.value == null || formState.value == ''
                  ? SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 64,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Add an Image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap to select from camera or gallery',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Image.file(
                      File(formState.value!),
                      fit: BoxFit.cover,
                    ),
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
                  style: TextStyle(
                    color: Colors.red.shade800,
                    fontSize: 12,
                  ),
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
