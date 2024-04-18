import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:watcha_body/data/domain/i_measurements.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/components/data_linked/cubit/get_data_linked_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/photo_viewer/components/data_linked/view/data_linked_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({
    super.key,
    // required this.path,
    required this.images,
    required this.currentIndex,
  });

  // final String path;
  final List<VaultImage> images;
  final int currentIndex;

  // todo: put it in helper functions
  // 21-10-2023 formater using intel
  static String formatDateImageViewer(DateTime dt) {
    // also time
    return '${dt.day}-${dt.month}-${dt.year} ${dt.hour}:${dt.minute}:${dt.second}';
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Transparent status bar
        statusBarIconBrightness: Brightness.light, // Dark status bar icons
      ),
    );
    return Scaffold(
      // body: PhotoView(imageProvider: FileImage(File(path))),
      // appBar: AppBar(
      //   title: Text(
      //     images[currentIndex].tag,
      //     style: const TextStyle(
      //       color: Colors.white,
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: BlocListener<LoadPicturesCubit, LoadPicturesState>(
        listener: (context, state) {
          state.mapOrNull(
            loaded: (_) => Navigator.of(context).pop(),
          );
        },
        child: SafeArea(
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                pageController: PageController(initialPage: currentIndex),
                itemCount: images.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: FileImage(
                      File(images[index].path),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // color: Colors.red.withOpacity(.5),
                  width: double.infinity,
                  // height: 50,
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
                              images[currentIndex]
                                      .tag
                                      .substring(0, 1)
                                      .toUpperCase() +
                                  images[currentIndex].tag.substring(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              formatDateImageViewer(
                                images[currentIndex].date,
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
                              isDismissible: true,
                              builder: (context) {
                                return DataLinkedView(
                                  date: images[currentIndex].date,
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.dataset_linked,
                            color: Colors.white,
                          ),
                        ),
                        // delete Icon
                        IconButton(
                          onPressed: () {
                            context.read<LoadPicturesCubit>().delete(
                                  images[currentIndex].path,
                                );
                          },
                          icon: Icon(
                            Icons.delete_sharp,
                            color: Colors.red.shade400,
                          ),
                        )
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
