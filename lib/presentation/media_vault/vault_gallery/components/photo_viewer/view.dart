import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:watcha_body/domain/body_picture/models/vault_image_model.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/components/data_linked/view/data_linked_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/components/picture_notes/picture_notes_modal.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/cubit/delete_image_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';
import 'package:watcha_body/utils/date_custom_formater.dart';

class PhotoViewer extends StatefulWidget {
  const PhotoViewer({
    super.key,
    // required this.path,
    required this.images,
    required this.currentIndex,
    required this.imagePath,
  });

  // final String path;
  final List<VaultImageModel> images;
  final int currentIndex;
  final String imagePath;

  // todo: put it in helper functions
  // 21-10-2023 formater using intel
  static String formatDateImageViewer(DateTime dt) {
    // also time
    return '${dt.day}-${dt.month}-${dt.year} ${dt.hour}:${dt.minute}:${dt.second}';
  }

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  late int _currentIndex = widget.currentIndex;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.black, // Transparent status bar
    //     statusBarIconBrightness: Brightness.light, // Dark status bar icons
    //   ),
    // );
    return Scaffold(
      body: BlocListener<DeleteImageCubit, DeleteImageState>(
        listener: (context, state) {
          switch (state) {
            case DeleteImageStateSuccess(:final deletedItemId):
              context
                  .read<LoadPicturesCubit>()
                  .updateListAfterDelete(deletedItemId);
              Navigator.of(context).pop();
              break;

            default:
              break;
          }

          // state.mapOrNull(
          //   success: (value) {
          //     context
          //         .read<LoadPicturesCubit>()
          //         .updateListAfterDelete(value.deletedItemId);
          //     Navigator.of(context).pop();
          //   },
          // );
        },
        child: SafeArea(
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                pageController: PageController(initialPage: _currentIndex),
                itemCount: widget.images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                loadingBuilder: (context, event) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: FileImage(
                      File('${widget.imagePath}/${widget.images[index].file}'),
                    ),
                    // imageProvider: CustomImageProvider(
                    //   widget.images[index].file,
                    //   context
                    //       .read<BodyPictureRepository>()
                    //       .decryptImageFromPath,
                    //   widget.images[index].nonce,
                    // ),
                  );
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // to Pascal Case
                              widget.images[_currentIndex].tag
                                      .substring(0, 1)
                                      .toUpperCase() +
                                  widget.images[_currentIndex].tag.substring(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              // PhotoViewer.formatDateImageViewer(
                              //   widget.images[_currentIndex].date,
                              // ),
                              DateCustomFormater.formatDateTimeCompleteVerbose(
                                widget.images[_currentIndex].date,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              builder: (context) {
                                return DataLinkedView(
                                  date: widget.images[widget.currentIndex].date,
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.dataset_linked,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),

                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              builder: (context) {
                                return PictureNotesModal(
                                  notes:
                                      widget.images[widget.currentIndex].note,
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                        ),
                        // delete Icon
                        IconButton(
                          onPressed: () {
                            context.read<DeleteImageCubit>().delete(
                                  widget.images[widget.currentIndex].id,
                                );
                          },
                          icon: Icon(
                            Icons.delete_sharp,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
