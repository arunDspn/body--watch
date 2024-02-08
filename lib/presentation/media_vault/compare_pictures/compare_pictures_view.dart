import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

class ComparePicturesView extends StatelessWidget {
  const ComparePicturesView({super.key});

  static const routeName = '/compare-pictures';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compare Pictures'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  isDense: true,
                  labelText: 'Select a Tag',
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.tag),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.46,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Picture 1 Date',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: size.width * 0.46,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Picture 2 Date',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text('Compare'),
              // ),
              const SizedBox(
                height: 20,
              ),

              ImageCompareSlider(
                // photoRadius: BorderRadius.circular(8),
                itemOne: Image.asset(
                  'assets/File-2.png',
                  // height: size.height * 0.6,
                  // width: size.width * 0.5,
                  fit: BoxFit.cover,
                ),
                itemTwo: Image.asset(
                  'assets/File-4.png',
                  // height: size.height * 0.6,
                  // width: size.width * 0.5,
                  fit: BoxFit.cover,
                ),
                itemOneBuilder: (child, context) =>
                    IntrinsicHeight(child: child),
                itemTwoBuilder: (child, context) =>
                    IntrinsicHeight(child: child),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
