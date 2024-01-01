import 'package:flutter/material.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class VaultImage {
  VaultImage({
    required this.title,
    required this.path,
    required this.dateTime,
  });

  final String title;
  final String path;
  final DateTime dateTime;
}

// 5 list items
final vlist = <VaultImage>[
  VaultImage(
    title: 'Chevrolet Camaro',
    path: 'assets/File-1.png',
    dateTime: DateTime.now(),
  ),
  VaultImage(
    title: 'Vault Gallery',
    path: 'assets/File-2.png',
    dateTime: DateTime.now(),
  ),
  VaultImage(
    title: 'Vault Gallery',
    path: 'assets/File-3.png',
    dateTime: DateTime.now(),
  ),
  VaultImage(
    title: 'Vault Gallery',
    path: 'assets/File-4.png',
    // yestrday
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
  ),
  VaultImage(
    title: 'Vault Gallery',
    path: 'assets/File-2.png',
    // yestrday
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
  ),
  // 4 days old
  VaultImage(
    title: 'Vault Gallery',
    path: 'assets/File-3.png',
    // 4 days old
    dateTime: DateTime.now().subtract(const Duration(days: 4)),
  ),
  VaultImage(
    title: '',
    path: 'assets/File-4.png',
    // 4 days old
    dateTime: DateTime.now().subtract(const Duration(days: 4)),
  ),
  VaultImage(
    title: 'Vault Gallery',
    path: 'assets/File-2.png',
    // 4 days old
    dateTime: DateTime.now().subtract(const Duration(days: 4)),
  ),
  VaultImage(
    title: 'Vault Gallery',
    path: 'assets/File-3.png',
    // 4 days old
    dateTime: DateTime.now().subtract(const Duration(days: 8)),
  ),
];

class VaultGallery extends StatelessWidget {
  const VaultGallery({super.key});

  static const routeName = '/vault_gallery';

  // formated date to like 25 dec 2023 using intl package
  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: CardTheme(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   elevation: 0,
        // ),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.large(
              onPressed: () {
                // show modal
                showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  showDragHandle: true,
                  isScrollControlled: false,
                  builder: (context) {
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
                                    picker
                                        .pickImage(source: ImageSource.camera)
                                        .then((value) {
                                      if (value != null) {
                                        Navigator.of(context).pop();
                                      }
                                    });
                                  },
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.camera),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Camera',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
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
                                    picker
                                        .pickImage(source: ImageSource.gallery)
                                        .then((value) {
                                      if (value != null) {
                                        Navigator.of(context).pop();
                                      }
                                    });
                                  },
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.photo),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Gallery',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
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
                  },
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            appBar: AppBar(
              title: const Text('Vault Gallery'),
            ),
            // Grid View for gallery
            body: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: GroupedScrollView<VaultImage, String>.grid(
                data: vlist,
                itemBuilder: (context, item) {
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
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: .8,
                ),
                groupedOptions: GroupedScrollViewOptions(
                  stickyHeaderBuilder: (context, header, groupedIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
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
                    return formatDate(item.dateTime);
                  },
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
  });
  final VaultImage image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              image.path,
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
            image.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
