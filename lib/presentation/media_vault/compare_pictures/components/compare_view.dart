part of '../view/compare_pictures_view.dart';

class _CompareView extends StatelessWidget {
  const _CompareView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadPictureToCompareCubit, LoadPictureToCompareState>(
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return const Center(
              child: Column(
                children: [
                  Text('Fill above form to compare pictures'),
                ],
              ),
            );
          },
          loading: (value) {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (value) {
            if (value.compareImagesModel.firstImages.isEmpty &&
                value.compareImagesModel.secondImages.isEmpty) {
              return const Center(
                child: Text('No images to compare'),
              );
            }
            return _CompareImageViewer(
              firstImages: value.compareImagesModel.firstImages,
              secondImages: value.compareImagesModel.secondImages,
            );
          },
          error: (value) {
            return Center(
              child: Text('Error + ${value.message}'),
            );
          },
        );
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
    return Column(
      children: [
        // ImageCompareSlider(
        //   // photoRadius: BorderRadius.circular(8),
        //   itemOne: Image(
        //     image: CustomImageProvider(
        //       widget.firstImages[firstImageIndex],
        //       context.read<BodyPictureRepository>().decryptImageFromPath,
        //       widget.firstImages[firstImageIndex].n
        //     ),
        //   ),
        //   //  Image.file(
        //   //   // 'assets/File-2.png',
        //   //   // File(widget.firstImages[firstImageIndex].path),
        //   //   // height: size.height * 0.6,
        //   //   // width: size.width * 0.5,
        //   //   fit: BoxFit.cover,
        //   // ),
        //   itemTwo: Image(
        //     image: CustomImageProvider(
        //       widget.secondImages[secondImageIndex],
        //       context.read<BodyPictureRepository>().decryptImageFromPath,
        //     ),
        //   ),
        //   // Image.file(
        //   //   // 'assets/File-4.png',
        //   //   File(widget.secondImages[secondImageIndex].path),
        //   //   // height: size.height * 0.6,
        //   //   // width: size.width * 0.5,
        //   //   fit: BoxFit.cover,
        //   // ),
        //   itemOneBuilder: (child, context) => IntrinsicHeight(child: child),
        //   itemTwoBuilder: (child, context) => IntrinsicHeight(child: child),
        // ),
        if (widget.firstImages.length > 1 && widget.secondImages.length > 1)
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (firstImageIndex > 0) {
                    setState(() {
                      firstImageIndex--;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_left),
              ),
              Text('${firstImageIndex + 1} / ${widget.firstImages.length}'),
              IconButton(
                onPressed: () {
                  if (firstImageIndex < widget.firstImages.length - 1) {
                    setState(() {
                      firstImageIndex++;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_right),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    if (secondImageIndex > 0) {
                      setState(() {
                        secondImageIndex--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_left)),
              Text('${secondImageIndex + 1} / ${widget.secondImages.length}'),
              IconButton(
                onPressed: () {
                  if (secondImageIndex < widget.secondImages.length - 1) {
                    setState(() {
                      secondImageIndex++;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          )
      ],
    );
  }
}
