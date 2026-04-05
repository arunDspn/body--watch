part of '../view/compare_pictures_view.dart';

class _CompareView extends StatelessWidget {
  const _CompareView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<LoadPictureToCompareCubit, LoadPictureToCompareState>(
      builder: (context, state) {
        return switch (state) {
          LoadPictureToCompareStateInitial() => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Icon(
                  Icons.tune_rounded,
                  size: 40,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 10),
                Text(
                  'Fill above form to compare pictures',
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          LoadPictureToCompareStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          LoadPictureToCompareStateLoaded(:final compareImagesModel)
              when (compareImagesModel.firstImages.isEmpty ||
                  compareImagesModel.secondImages.isEmpty) =>
            const _NoImagesCompareState(),
          LoadPictureToCompareStateLoaded(:final compareImagesModel) =>
            _CompareImageViewer(
              firstImages: compareImagesModel.firstImages,
              secondImages: compareImagesModel.secondImages,
            ),
          LoadPictureToCompareStateError(:final message) => Center(
            child: Text('Error + $message'),
          ),
        };

        // return state.map(
        //   initial: (value) {},
        //   loading: (value) {
        //     return
        //   },
        //   loaded: (value) {
        //     if (value.compareImagesModel.firstImages.isEmpty &&
        //         value.compareImagesModel.secondImages.isEmpty) {

        //     }
        //     return ;
        //   },
        //   error: (value) {
        //     return ;
        //   },
        // );
      },
    );
  }
}

class _CompareImageViewer extends StatefulWidget {
  const _CompareImageViewer({
    required this.firstImages,
    required this.secondImages,
  });

  final List<String> firstImages;
  final List<String> secondImages;

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
    final theme = Theme.of(context);
    final imageFolderPath = context.read<FolderPath>().imagesPath;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card.filled(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: ImageCompareSlider(
              itemOne: Image.file(
                File('$imageFolderPath/${widget.firstImages[firstImageIndex]}'),
                fit: BoxFit.cover,
              ),
              itemTwo: Image.file(
                File(
                  '$imageFolderPath/${widget.secondImages[secondImageIndex]}',
                ),
                fit: BoxFit.cover,
              ),
              itemOneBuilder: (child, context) => IntrinsicHeight(child: child),
              itemTwoBuilder: (child, context) => IntrinsicHeight(child: child),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Card.outlined(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: _ImageStepper(
                    label: 'Picture 1',
                    current: firstImageIndex + 1,
                    total: widget.firstImages.length,
                    onPrevious: firstImageIndex > 0
                        ? () {
                            setState(() {
                              firstImageIndex--;
                            });
                          }
                        : null,
                    onNext: firstImageIndex < widget.firstImages.length - 1
                        ? () {
                            setState(() {
                              firstImageIndex++;
                            });
                          }
                        : null,
                  ),
                ),
                const SizedBox(height: 84, child: VerticalDivider(width: 18)),
                Expanded(
                  child: _ImageStepper(
                    label: 'Picture 2',
                    current: secondImageIndex + 1,
                    total: widget.secondImages.length,
                    onPrevious: secondImageIndex > 0
                        ? () {
                            setState(() {
                              secondImageIndex--;
                            });
                          }
                        : null,
                    onNext: secondImageIndex < widget.secondImages.length - 1
                        ? () {
                            setState(() {
                              secondImageIndex++;
                            });
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Drag the divider in the image to inspect changes side by side.',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ImageStepper extends StatelessWidget {
  const _ImageStepper({
    required this.label,
    required this.current,
    required this.total,
    required this.onPrevious,
    required this.onNext,
  });

  final String label;
  final int current;
  final int total;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton.filledTonal(
              onPressed: onPrevious,
              icon: const Icon(Icons.arrow_left_rounded),
            ),
            Expanded(
              child: Text(
                '$current / $total',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            IconButton.filledTonal(
              onPressed: onNext,
              icon: const Icon(Icons.arrow_right_rounded),
            ),
          ],
        ),
      ],
    );
  }
}

class _NoImagesCompareState extends StatelessWidget {
  const _NoImagesCompareState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card.outlined(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.photo_library_outlined,
                color: colors.onSecondaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'No matching pictures',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Try another date range or choose a different tag to load pictures for comparison.',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
