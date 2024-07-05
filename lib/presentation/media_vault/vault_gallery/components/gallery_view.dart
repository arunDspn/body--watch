part of 'gallery_view/vault_gallery_view.dart';

class _GalleryView extends StatelessWidget {
  const _GalleryView({required this.filteredImages});

  final List<DisplayVaultImageModel> filteredImages;

  // formated date to like 25 dec 2023 using intl package
  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: Center(
        child: Column(
          children: [
            // filter  icon button
            BlocBuilder<PictureTypeFilterModalBloc,
                PictureTypeFilterModalState>(
              builder: (context, state) {
                var isFilterActive = false;

                state.mapOrNull(
                  success: (value) {
                    isFilterActive = value.selectedTypes.isNotEmpty;
                  },
                );

                return Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton.filled(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (context) {
                          return const FilterModal();
                        },
                      );
                    },
                    isSelected: isFilterActive,
                    icon: const Icon(
                      Icons.filter_alt_rounded,
                    ),
                  ),
                );
              },
            ),

            //
            Expanded(
              child: GroupedScrollView<DisplayVaultImageModel, String>.grid(
                data: filteredImages,
                itemBuilder: (context, item) {
                  return _PhotoThumbnail(
                    image: item,
                    images: filteredImages,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: .8,
                ),
                itemsSorter: (a, b) {
                  return a.date.compareTo(b.date);
                },
                groupedOptions: GroupedScrollViewOptions(
                  stickyHeaderBuilder: (
                    context,
                    header,
                    groupedIndex,
                  ) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          header,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                  itemGrouper: (item) {
                    return formatDate(item.date);
                  },
                ),
              ),
            )
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
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  const _PhotoThumbnail({
    required this.image,
    required this.images,
  });
  final DisplayVaultImageModel image;
  final List<DisplayVaultImageModel> images;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).push(
          MaterialPageRoute(
            builder: (context) {
              final currentIndex = images.indexOf(image);
              return BlocProvider(
                create: (context) =>
                    DeleteImageCubit(context.read<BodyPictureRepository>()),
                child: Builder(
                  builder: (context) {
                    return PhotoViewer(
                      // path: image.path,
                      images: images,
                      currentIndex: currentIndex,
                    );
                  },
                ),
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
              child: Image.memory(
                image.thumbnailData,
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
