import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/add_new_media_view.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/view/compare_pictures_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/filter_modal/bloc/picture_type_filter_modal_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/filter_modal/filter_modal.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/back_up_pictures_to_zip_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/lock_gallery_cubit.dart';

class VaultGallery extends StatelessWidget {
  const VaultGallery({super.key});

  static const routeName = '/vault_gallery';

  // formated date to like 25 dec 2023 using intl package
  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackUpPicturesToZipCubit, BackUpPicturesToZipState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          failure: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value.message),
              ),
            );
            // Navigator.pop(context);
            Navigator.of(context).pop();
          },
          loading: (value) {
            // Pop up a progress indicator
            return showDialog(
              context: context,
              useRootNavigator: true,
              builder: (context) {
                // return const Center(
                //   child: CircularProgressIndicator(),
                // );
                return const AlertDialog(
                  title: Text('Backup in progress'),
                  content: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              },
            );
          },
          success: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 7),
                content: Text(
                  'Backup successful \n Backup Path: ${value.path}',
                ),
              ),
            );

            // Navigator.of(context).pop();
          },
        );
      },
      child: BlocConsumer<LockGalleryCubit, LockGalleryState>(
        listener: (context, state) {
          state.mapOrNull(
            locked: (value) {
              context.read<LoadPicturesCubit>().reset();
            },
            unlocked: (value) {
              context.read<LoadPicturesCubit>().load();
            },
          );
        },
        builder: (context, state) {
          return state.map(
            locked: (value) {
              return _LockView();
            },
            unlocked: (value) {
              return Center(
                child: BlocConsumer<PictureTypeFilterModalBloc,
                    PictureTypeFilterModalState>(
                  listener: (context, state) {
                    // // state.mapOrNull(
                    // //   success: (value) {
                    // //     context.read<FilteredGalleryImagesCubit>().filterImages(
                    // //           selectedTags: value.selectedTypes,
                    // //         );
                    // //   },
                    // );
                  },
                  builder: (context, filterState) {
                    return filterState.maybeMap(
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                      failed: (value) {
                        return const Center(
                          child: Text('Failed to load Filters'),
                        );
                      },
                      success: (filterStateValue) {
                        return BlocConsumer<LoadPicturesCubit,
                            LoadPicturesState>(
                          // listenWhen: (previous, current) => true,
                          buildWhen: (previous, current) => true,
                          listener: (context, state) {
                            // state.mapOrNull(
                            //   loaded: (value) {
                            //     context
                            //         .read<FilteredGalleryImagesCubit>()
                            //         .loadImages(images: value.pictures);
                            //   },
                            // );
                          },
                          builder: (context, state) {
                            return state.map(
                              failed: (value) {
                                return const Center(
                                  child: Text('Failed to load Pictures'),
                                );
                              },
                              loading: (_) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              loaded: (pictureLoadedStateValue) {
                                // Filtering inside the UI
                                // TODO: Is that Good
                                var filteredImages = <VaultImage>[];
                                if (filterStateValue.selectedTypes.isEmpty) {
                                  filteredImages =
                                      pictureLoadedStateValue.pictures;
                                } else {
                                  filteredImages =
                                      pictureLoadedStateValue.pictures
                                          .where(
                                            (element) => filterStateValue
                                                .selectedTypes
                                                .contains(element.tag),
                                          )
                                          .toList();
                                }

                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    cardTheme: CardTheme(
                                      elevation: 0,
                                      margin: EdgeInsets.zero,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceVariant,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      return Scaffold(
                                        floatingActionButton:
                                            FloatingActionButton.large(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              AddNewMediaView.routeName,
                                            );
                                          },
                                          child: const Icon(
                                            Icons.add,
                                          ),
                                        ),
                                        floatingActionButtonLocation:
                                            FloatingActionButtonLocation
                                                .centerFloat,
                                        floatingActionButtonAnimator:
                                            FloatingActionButtonAnimator
                                                .scaling,
                                        appBar: AppBar(
                                          title: const Text('Vault Gallery'),
                                          actions: [
                                            // IconButton(
                                            //   onPressed: () {
                                            //     context
                                            //         .read<BodyPictureRepository>()
                                            //         .deleteAllBodyPictures();
                                            //   },
                                            //   icon: const Icon(
                                            //     Icons.delete,
                                            //   ), // delete
                                            // ),
                                            // lock icon button
                                            IconButton(
                                              onPressed: () {
                                                context
                                                    .read<LockGalleryCubit>()
                                                    .lock();
                                              },
                                              icon: const Icon(
                                                Icons.lock,
                                              ),
                                            ),

                                            // ElevatedButton(
                                            //     onPressed: () {
                                            //       context
                                            //           .read<
                                            //               BodyPictureRepository>()
                                            //           .cacheService
                                            //           .dos();
                                            //     },
                                            //     child: const Text('TEST')),
                                            // filter
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  ComparePicturesView.routeName,
                                                );
                                              },
                                              child: const Text(
                                                'Compare',
                                              ),
                                            ),

                                            // Overflow Menu
                                            PopupMenuButton<int>(
                                              onSelected: (value) {
                                                if (1 == value) {
                                                } else {
                                                  context
                                                      .read<
                                                          BackUpPicturesToZipCubit>()
                                                      .backupPictures();
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return [
                                                  const PopupMenuItem(
                                                    value: 1,
                                                    child: Text('Compare'),
                                                  ),
                                                  const PopupMenuItem(
                                                    value: 2,
                                                    child: Text('Backup'),
                                                  ),
                                                ];
                                              },
                                            ),
                                          ],
                                        ),
                                        // Grid View for gallery
                                        body: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 8,
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                // filter  icon button
                                                BlocBuilder<
                                                    PictureTypeFilterModalBloc,
                                                    PictureTypeFilterModalState>(
                                                  builder: (context, state) {
                                                    var isFilterActive = false;

                                                    state.mapOrNull(
                                                      success: (value) {
                                                        isFilterActive = value
                                                            .selectedTypes
                                                            .isNotEmpty;
                                                      },
                                                    );

                                                    return Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: IconButton.filled(
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            showDragHandle:
                                                                true,
                                                            builder: (context) {
                                                              return const FilterModal();
                                                            },
                                                          );
                                                        },
                                                        isSelected:
                                                            isFilterActive,
                                                        icon: const Icon(
                                                          Icons
                                                              .filter_alt_rounded,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                //

                                                // SingleChildScrollView(
                                                //   scrollDirection: Axis.horizontal,
                                                //   child: Row(
                                                //     children: [
                                                //       FilterChip(
                                                //         selected: true,
                                                //         label: const Text('Chest'),
                                                //         onSelected: (value) {},
                                                //       ),
                                                //       FilterChip(
                                                //         selected: true,
                                                //         label: const Text('Legs'),
                                                //         onSelected: (value) {},
                                                //       ),
                                                //       FilterChip(
                                                //         selected: true,
                                                //         label: const Text('Arms'),
                                                //         onSelected: (value) {},
                                                //       ),
                                                //       FilterChip(
                                                //         selected: true,
                                                //         label: const Text('Back'),
                                                //         onSelected: (value) {},
                                                //       ),
                                                //       FilterChip(
                                                //         selected: true,
                                                //         label: const Text('Abs'),
                                                //         onSelected: (value) {},
                                                //       ),
                                                //       FilterChip(
                                                //         selected: true,
                                                //         label: const Text('Shoulders'),
                                                //         onSelected: (value) {},
                                                //       ),
                                                //       FilterChip(
                                                //         selected: true,
                                                //         label: const Text('Cardio'),
                                                //         onSelected: (value) {},
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                                // MultiSelectDropDown<int>(
                                                //   onOptionSelected:
                                                //       (List<ValueItem> selectedOptions) {},
                                                //   options: const <ValueItem<int>>[
                                                //     ValueItem(label: 'Option 1', value: 1),
                                                //     ValueItem(label: 'Option 2', value: 2),
                                                //     ValueItem(label: 'Option 3', value: 3),
                                                //     ValueItem(label: 'Option 4', value: 4),
                                                //     ValueItem(label: 'Option 5', value: 5),
                                                //     ValueItem(label: 'Option 6', value: 6),
                                                //   ],
                                                //   // selectionType: SelectionType.multi,
                                                //   chipConfig:
                                                //       const ChipConfig(wrapType: WrapType.wrap),
                                                //   dropdownHeight: 300,
                                                //   optionTextStyle: const TextStyle(fontSize: 16),
                                                //   selectedOptionIcon:
                                                //       const Icon(Icons.check_circle),
                                                // ),
                                                Expanded(
                                                  child: GroupedScrollView<
                                                      VaultImage, String>.grid(
                                                    data: filteredImages,
                                                    itemBuilder:
                                                        (context, item) {
                                                      // return GridTile(
                                                      //   child: _PhotoThumbnail(
                                                      //     image: item,
                                                      //   ),
                                                      //   // footer: GridTileBar(
                                                      //   //   backgroundColor: Colors.white.withOpacity(0.5),
                                                      //   //   title: Text(
                                                      //   //     item.title,
                                                      //   //     style: Theme.of(context).textTheme.labelLarge,
                                                      //   //   ),
                                                      //   // ),
                                                      // );
                                                      return _PhotoThumbnail(
                                                        image: item,
                                                        images: filteredImages,
                                                      );
                                                    },
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 8,
                                                      crossAxisSpacing: 8,
                                                      childAspectRatio: .8,
                                                    ),
                                                    itemsSorter: (a, b) {
                                                      return a.date
                                                          .compareTo(b.date);
                                                    },
                                                    groupedOptions:
                                                        GroupedScrollViewOptions(
                                                      stickyHeaderBuilder: (
                                                        context,
                                                        header,
                                                        groupedIndex,
                                                      ) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .scaffoldBackgroundColor
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                12,
                                                              ),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12),
                                                            child: Text(
                                                              header,
                                                              style:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      itemGrouper: (item) {
                                                        return formatDate(
                                                            item.date);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // child: GridView.builder(
                                          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          //     crossAxisCount: 3,
                                          //     mainAxisSpacing: 8,
                                          //     crossAxisSpacing: 8,
                                          //   ),
                                          //   itemBuilder: (context, index) => Image.asset(
                                          //     'assets/mr-ponji.jpg',
                                          //     fit: BoxFit.cover,
                                          //   ),
                                          // ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                                // return BlocBuilder<FilteredGalleryImagesCubit,
                                //     FilteredGalleryImagesState>(
                                //   buildWhen: (previous, current) => true,
                                //   builder: (context, state) {
                                //     ;
                                //   },
                                // );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
            initial: (value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}

class _LockView extends StatelessWidget {
  const _LockView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Locked',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // Some dialogs saying use finger print to unlock
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Use your fingerprint to unlock',
          ),
          // 1 Button to activate unlock biometric
          const SizedBox(
            height: 16,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       context.read<BodyPictureRepository>().cacheService.dos();
          //     },
          //     child: const Text('TEST')),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              context.read<LockGalleryCubit>().unlock();
              // try {
              //   final auth = LocalAuthentication();
              //   // ···
              //   final canAuthenticateWithBiometrics =
              //       await auth.canCheckBiometrics;
              //   final canAuthenticate = canAuthenticateWithBiometrics ||
              //       await auth.isDeviceSupported();

              //   if (canAuthenticate) {
              //     unawaited(
              //       auth
              //           .authenticate(
              //         localizedReason: 'Please authenticate to show gallery',
              //         options: const AuthenticationOptions(
              //           biometricOnly: true,
              //         ),
              //       )
              //           .then((value) {
              //         if (value) {
              //           context.read<LockGalleryCubit>().unlock();
              //         }
              //       }),
              //     );
              //   }
              // } on PlatformException catch (e) {
              //   debugPrint(e.toString());
              // } on Exception catch (e) {
              //   // TODO
              //   debugPrint(e.toString());
              // }
            },
            child: const Text('Activate'),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class AddMediaModal extends StatelessWidget {
  const AddMediaModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: [
              // 2 filled buttons camera or gallery
              // Expanded(
              //   child: OutlinedButton.icon(
              //     onPressed: () {},
              //     label: const Text('Camera'),
              //     icon: const Icon(Icons.camera),
              //   ),
              // ),
              // const SizedBox(
              //   width: 16,
              // ),
              // Expanded(
              //   child: OutlinedButton.icon(
              //     onPressed: () {},
              //     label: const Text('Gallery'),
              //     icon: const Icon(Icons.photo),
              //   ),
              // ),

              // 2 Cards with gallery and camera icon
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    final picker = ImagePicker();
                    picker.pickImage(source: ImageSource.camera).then((value) {
                      if (value != null) {
                        Navigator.of(context).pop((value.path, value.name));
                      }
                    });
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Camera',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    final picker = ImagePicker();
                    picker.pickImage(source: ImageSource.gallery).then((value) {
                      if (value != null) {
                        Navigator.of(context).pop((value.path, value.name));
                      }
                    });
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.photo),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Gallery',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class _PhotoThumbnail extends StatelessWidget {
//   const _PhotoThumbnail({
//     required this.image,
//   });
//   final VaultImage image;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Expanded(
//             child: Image.asset(
//               image.path,
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Footer
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Text(
//               image.title,
//               style: Theme.of(context).textTheme.labelLarge,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class _PhotoThumbnail extends StatelessWidget {
  const _PhotoThumbnail({
    required this.image,
    required this.images,
  });
  final VaultImage image;
  final List<VaultImage> images;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              final currentIndex = images.indexOf(image);
              return PhotoViewer(
                // path: image.path,
                images: images,
                currentIndex: currentIndex,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.file(
                File(image.path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          // Footer
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              image.tag,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
