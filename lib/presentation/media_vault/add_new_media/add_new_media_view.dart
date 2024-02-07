import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_media_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/vault_gallery_view.dart';

class AddNewMediaView extends StatefulWidget {
  const AddNewMediaView({super.key});

  static const routeName = '/add_new_media';

  @override
  State<AddNewMediaView> createState() => _AddNewMediaViewState();
}

class _AddNewMediaViewState extends State<AddNewMediaView> {
  // Tag
  String tag = '';

  //  Datetime
  DateTime? date;

  // Image Path
  String imagePath = '';

  // Formater with intl package
  final _formatter = DateFormat('yyyy-MM-dd');

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Media'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocListener<AddNewMediaCubit, AddNewMediaState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              success: (s) {
                context.read<LoadPicturesCubit>().updateList(s.savedImage);
                Navigator.pop(context);
              },
              failure: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value.failure),
                  ),
                );
              },
            );
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _NewWig(
                      context.read<BodyPictureRepository>(),
                      (tag) {
                        setState(() {
                          this.tag = tag;
                        });
                      },
                    ),
                    // DropDownTextField(
                    //   dropDownList: [
                    //     DropDownValueModel(
                    //       name: 'Front',
                    //       toolTipMsg: 'Front',
                    //       value: 'front',
                    //     ),
                    //     DropDownValueModel(
                    //       name: 'Back',
                    //       toolTipMsg: 'Back',
                    //       value: 'back',
                    //     ),
                    //   ],
                    //   enableSearch: true,
                    //   onChanged: (value) {
                    //     print(value);
                    //   },
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return "Required field";
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),

                    // dropdown menu contains front and back
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: DropdownButton<String>(
                    //     items: const [
                    //       DropdownMenuItem(
                    //         value: 'front',
                    //         child: Text('Front'),
                    //       ),
                    //       DropdownMenuItem(
                    //         value: 'back',
                    //         child: Text('Back'),
                    //       ),
                    //     ],
                    //     onChanged: (value) {},
                    //   ),
                    // ),
                    // height 20
                    const SizedBox(
                      height: 20,
                    ),
                    // TextField
                    GestureDetector(
                      onTap: () {
                        // show date picker
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
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
                              text:
                                  date != null ? _formatter.format(date!) : ''),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                            ),
                            hintText: 'Measurement Date',
                            suffixIcon: Icon(date == null
                                ? Icons.radio_button_unchecked
                                : Icons.radio_button_checked),
                            prefixIcon:
                                const Icon(Icons.calendar_month_outlined),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    // Date picker in yyyy-mm-dd format
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // show date picker
                    //       showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(2000),
                    //         lastDate: DateTime(2025),
                    //       ).then((value) {
                    //         // if not null
                    //         if (value != null) {
                    //           // set date
                    //           setState(() {
                    //             date = value;
                    //           });
                    //         }
                    //       });
                    //     },
                    //     child: const Text('Select Date'),
                    //   ),
                    // ),

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

                    // FilledButton.icon(
                    //   onPressed: () {
                    //     final image = VaultImage(
                    //       tag: tag,
                    //       path: imagePath,
                    //       date: date!,
                    //     );
                    //     // toast with image details
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text(
                    //           image.toString(),
                    //         ),
                    //       ),
                    //     );

                    //     context.read<AddNewMediaCubit>().saveMedia(image);
                    //   },
                    //   icon: const Icon(Icons.image),
                    //   label: const Text('Save'),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          if (_formKey.currentState!.validate()) {
            final image = VaultImage(
              tag: tag,
              path: imagePath,
              date: date!,
            );
            context.read<AddNewMediaCubit>().saveMedia(image);
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
              width: MediaQuery.of(context).size.width * 0.9,
              child: formState.value == null || formState.value == ''
                  ? const Center(
                      child: Text('Add an Image'),
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

class _NewWig extends StatefulWidget {
  const _NewWig(this.bodyPictureRepository, this.onTap);

  final BodyPictureRepository bodyPictureRepository;

  final void Function(String tag) onTap;

  @override
  State<_NewWig> createState() => _NewWigState();
}

class _NewWigState extends State<_NewWig> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  final TextEditingController _controller = TextEditingController();
  List<String> tags = [];
  // getAllTags
  Future<void> getAllTags() async {
    // get all tags from the database
    // return a list of tags
    final result = await widget.bodyPictureRepository.getAllTags();

    setState(() {
      result.fold((l) {}, (r) => tags = r);
    });
  }

  @override
  void initState() {
    super.initState();
    getAllTags();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MenuAnchor(
      style: MenuStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(size.width, size.height * 0.4),
        ),
      ),
      crossAxisUnconstrained: false,
      childFocusNode: _buttonFocusNode,
      menuChildren: tags
          .map(
            (e) => MenuItemButton(
              onPressed: () {
                _controller.text = e;
                _buttonFocusNode.unfocus();

                widget.onTap(e);
              },
              child: Text(e),
            ),
          )
          .toList(),
      builder: (context, controller, child) {
        return TextFormField(
          focusNode: _buttonFocusNode,
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            hintText: 'Select a tag',
            suffixIcon: Icon(Icons.arrow_drop_down),
            prefixIcon: Icon(Icons.label),
          ),
          onChanged: (value) {
            // // show a dropdown menu with all the wonders
            // controller.open();
            // _controller.text = value;
          },
          // onSubmitted: (value) {
          //   controller.close();
          //   // _controller.text = value;
          // },
          onTap: () {
            controller.open();
          },
          onEditingComplete: () {
            controller.close();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a tag';
            }
            return null;
          },
        );
      },
    );
  }
}
