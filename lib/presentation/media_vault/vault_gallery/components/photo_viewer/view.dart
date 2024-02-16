import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/filtered_gallery_images_cubit.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({
    super.key,
    required this.path,
    required this.images,
    required this.currentIndex,
  });

  final String path;
  final List<VaultImage> images;
  final int currentIndex;

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
      body: SafeArea(
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
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Spacer(),
                      // delete Icon
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.white,
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
    );
  }
}
