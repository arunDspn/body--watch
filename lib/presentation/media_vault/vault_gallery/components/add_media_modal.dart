part of '../vault_gallery_view.dart';

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
