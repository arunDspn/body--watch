import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:watcha_body/domain/body_picture/models/vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/add_new_media_view.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/view/compare_pictures_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_gate_keeper_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/filter_modal/bloc/picture_type_filter_modal_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/filter_modal/filter_modal.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/cubit/delete_image_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/back_up_pictures_to_zip_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/lock_gallery_cubit.dart';
import 'package:watcha_body/utils/folder_path.dart';

part '../add_media_modal.dart';
part '../bio_lock_view.dart';
part '../gallery_view.dart';

class VaultGalleryView extends StatelessWidget {
  const VaultGalleryView({super.key});

  static const routeName = '/vault-section/vault_gallery';

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackUpPicturesToZipCubit, BackUpPicturesToZipState>(
      listener: (context, state) {
        switch (state) {
          case BackUpPicturesToZipStateLoading():
            // Pop up a progress indicator
            showDialog(
              context: context,
              builder: (context) {
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
            break;

          case BackUpPicturesToZipStateSuccess():
            context.read<LoadPicturesCubit>().load();
            final message = context
                .read<BackUpPicturesToZipCubit>()
                .successMessage;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 7),
                content: Text(message),
              ),
            );
            break;

          case BackUpPicturesToZipStateFailure(:final message):
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
            // Navigator.pop(context);
            Navigator.of(context).pop();
            break;
          default:
            break;
        }

        // state.maybeMap(
        //   orElse: () {},
        //   failure: (value) {},
        //   loading: (value) {},
        //   success: (value) {},
        // );
      },
      child: BlocConsumer<LockGalleryCubit, LockGalleryState>(
        listener: (context, state) {
          switch (state) {
            case LockGalleryStateLocked():
              context.read<LoadPicturesCubit>().reset();
              break;
            case LockGalleryStateUnlocked():
              context.read<LoadPicturesCubit>().load();
              break;
            default:
              break;
          }

          // state.mapOrNull(
          //   locked: (value) {},
          //   unlocked: (value) {},
          // );
        },
        builder: (context, state) {
          Future<void> showRestoreOptions(String path) async {
            return showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('Restore pictures'),
                  content: const Text(
                    'Keep existing pictures and import only new ones?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        context
                            .read<BackUpPicturesToZipCubit>()
                            .restorePictures(path: path, merge: false);
                      },
                      child: const Text('Replace'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        context
                            .read<BackUpPicturesToZipCubit>()
                            .restorePictures(path: path, merge: true);
                      },
                      child: const Text('Merge'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              },
            );
          }

          Future<void> pickRestoreZip() async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['zip'],
            );

            final path = result?.files.single.path;
            if (path == null) {
              return;
            }

            await showRestoreOptions(path);
          }

          return switch (state) {
            LockGalleryStateLocked() => const _BioLockView(),
            LockGalleryStateUnlocked() => Center(
              child: BlocBuilder<PictureTypeFilterModalBloc, PictureTypeFilterModalState>(
                builder: (context, filterState) {
                  return switch (filterState) {
                    PictureTypeFilterModalStateFailed() => const Column(
                      children: [Center(child: Text('Failed to load Filters'))],
                    ),
                    PictureTypeFilterModalStateSuccess(:final selectedTypes) =>
                      BlocBuilder<LoadPicturesCubit, LoadPicturesState>(
                        buildWhen: (previous, current) => true,
                        builder: (context, state) {
                          return switch (state) {
                            // TODO: Handle this case.
                            LoadPicturesStateLoading() =>
                              const CircularProgressIndicator(),
                            LoadPicturesStateLoaded(:final pictures) => Builder(
                              builder: (context) {
                                // Filtering inside the UI
                                // TODO: Is that Good
                                var filteredImages = <VaultImageModel>[];
                                if (selectedTypes.isEmpty) {
                                  filteredImages = pictures;
                                } else {
                                  filteredImages = pictures
                                      .where(
                                        (element) => selectedTypes
                                            .map((e) => e.tag)
                                            .contains(element.id),
                                      )
                                      .toList();
                                }

                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    cardTheme: CardThemeData(
                                      elevation: 0,
                                      margin: EdgeInsets.zero,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.surfaceContainerHighest,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      return Scaffold(
                                        floatingActionButton:
                                            FloatingActionButton.large(
                                              onPressed: () {
                                                // Navigator.pushNamed(
                                                //   context,
                                                //   AddNewMediaView.routeName,
                                                // );
                                                Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pushNamed(
                                                  AddNewMediaView.routeName,
                                                );
                                              },
                                              child: const Icon(Icons.add),
                                            ),
                                        floatingActionButtonLocation:
                                            FloatingActionButtonLocation
                                                .centerFloat,
                                        floatingActionButtonAnimator:
                                            FloatingActionButtonAnimator
                                                .scaling,
                                        appBar: AppBar(
                                          title: const Text('Vault Gallery'),
                                          automaticallyImplyLeading: false,
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
                                                // context
                                                //     .read<LockGalleryCubit>()
                                                //     .lock();
                                                context
                                                    .read<AuthGateKeeperBloc>()
                                                    .add(
                                                      const AuthGateKeeperEvent.triggerUnAuth(),
                                                    );
                                              },
                                              icon: const Icon(Icons.lock),
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
                                                // Navigator.pushNamed(
                                                //   context,
                                                //   ComparePicturesView.routeName,
                                                // );
                                                Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pushNamed(
                                                  ComparePicturesView.routeName,
                                                );
                                              },
                                              child: const Text('Compare'),
                                            ),

                                            // Overflow Menu
                                            PopupMenuButton<int>(
                                              onSelected: (value) {
                                                if (1 == value) {
                                                  Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  ).pushNamed(
                                                    ComparePicturesView
                                                        .routeName,
                                                  );
                                                } else if (value == 2) {
                                                  context
                                                      .read<
                                                        BackUpPicturesToZipCubit
                                                      >()
                                                      .backupPictures();
                                                } else if (value == 3) {
                                                  pickRestoreZip();
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
                                                      const PopupMenuItem(
                                                        value: 3,
                                                        child: Text('Restore'),
                                                      ),
                                                    ];
                                                  },
                                            ),
                                          ],
                                        ),
                                        // Grid View for gallery
                                        body: _GalleryView(
                                          filteredImages: filteredImages,
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
                            ),
                            LoadPicturesStateFailed() => const Column(
                              children: [
                                Center(child: Text('Failed to load Pictures')),
                                // OutlinedButton(
                                //     onPressed: () {
                                //       final folder = Directory(
                                //           '/data/user/0/com.example.verygoodcore.watcha_body.dev/app_flutter/encrypted_thumbnails/');

                                //       print(folder.existsSync());
                                //       if (folder.existsSync()) {
                                //         // folder.open().then(
                                //         //   (value) {
                                //         //     print(value.path);
                                //         //   },
                                //         // );
                                //         // list contents in folder
                                //         log(folder.listSync().toString());
                                //       }
                                //     },
                                //     child: const Text('Retry')),
                              ],
                            ),
                          };

                          // return state.map(
                          //   failed: (value) {},
                          //   loading: (_) => const Center(
                          //     child:
                          //   ),
                          //   loaded: (pictureLoadedStateValue) {
                          //   },
                          // );
                        },
                      ),
                    PictureTypeFilterModalState() => const SizedBox.shrink(),
                  };

                  // return filterState.maybeMap(
                  //   orElse: () {
                  //     return;
                  //   },
                  //   failed: (value) {
                  //     return;
                  //   },
                  //   success: (filterStateValue) {
                  //     return;
                  //   },
                  // );
                },
              ),
            ),
            LockGalleryStateInitial() => const Column(
              children: [
                Text('Lock Loading'),
                Center(child: CircularProgressIndicator()),
              ],
            ),
          };

          // return state.map(
          //   locked: (value) {
          //     return
          //   },
          //   unlocked: (value) {
          //     return ;
          //   },
          //   initial: (value) {
          //     return ;
          //   },
          // );
        },
      ),
    );
  }
}
