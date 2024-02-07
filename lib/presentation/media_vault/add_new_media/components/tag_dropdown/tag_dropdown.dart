import 'package:flutter/material.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

class TagsDropDownController extends ChangeNotifier {
  TagsDropDownController(this.bodyPictureRepository);

  final BodyPictureRepository bodyPictureRepository;

  List<String> _orginalTags = [];
  List<String> _filteredTags = [];

  // getter
  List<String> get tags => _filteredTags;

  void close() {
    notifyListeners();
  }

  void open() {
    notifyListeners();
  }

  Future<void> loadAllTags() async {
    final result = await bodyPictureRepository.getAllTags();

    result.fold((l) {}, (r) {
      _orginalTags = r;
    });

    _filteredTags = _orginalTags;
    notifyListeners();
  }

  void filterItems(String keyword) {
    if (keyword.isEmpty) {
      _filteredTags = _orginalTags;
      notifyListeners();
    } else {
      final newtags = _orginalTags
          .where(
            (element) => element.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();

      if (newtags.isEmpty) {
        _filteredTags = ['Add "$keyword" as a new tag'];
      } else {
        _filteredTags = newtags;
      }
      notifyListeners();
    }
  }

  Future<void> addNewTag(String tag) async {
    final result = await bodyPictureRepository.addTag(tag);

    result.fold((l) => null, (r) {
      _orginalTags.add(tag);
      _filteredTags = _orginalTags;
      notifyListeners();
    });
  }
}

class TagsDropdown extends StatefulWidget {
  const TagsDropdown(this.bodyPictureRepository, this.onTap, {super.key});

  final BodyPictureRepository bodyPictureRepository;

  final void Function(String tag) onTap;

  @override
  State<TagsDropdown> createState() => _TagsDropdownState();
}

class _TagsDropdownState extends State<TagsDropdown> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  late final TagsDropDownController _tagsController = TagsDropDownController(
    widget.bodyPictureRepository,
  );

  final TextEditingController _controller = TextEditingController();
  // List<String> orginalTags = [];
  // List<String> filteredTags = [];
  // // getAllTags
  // Future<void> getAllTags() async {
  //   // get all tags from the database
  //   // return a list of tags
  //   final result = await widget.bodyPictureRepository.getAllTags();

  //   setState(() {
  //     result.fold((l) {}, (r) {
  //       orginalTags = r;
  //       filteredTags = orginalTags;
  //     });
  //   });
  // }

  // void filterItems(String keyword) {
  //   if (keyword.isEmpty) {
  //     setState(() {
  //       filteredTags = orginalTags;
  //     });
  //   } else {
  //     final newtags = orginalTags
  //         .where(
  //           (element) => element.toLowerCase().contains(keyword.toLowerCase()),
  //         )
  //         .toList();

  //     if (newtags.isEmpty) {
  //       setState(() {
  //         filteredTags = ['Add "$keyword" as a new tag'];
  //       });
  //     } else {
  //       setState(() {
  //         filteredTags = newtags;
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getAllTags();
    _tagsController
      ..addListener(() {
        setState(() {});
      })
      ..loadAllTags();
  }

  @override
  void dispose() {
    _tagsController.dispose();
    _buttonFocusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MenuAnchor(
      style: MenuStyle(
        // fixedSize: MaterialStatePropertyAll(
        //   Size(size.width, size.height * 0.4),
        // ),
        minimumSize: MaterialStatePropertyAll(
          Size(size.width, size.height * 0.05),
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(size.width, size.height * 0.4),
        ),
      ),
      crossAxisUnconstrained: false,
      childFocusNode: _buttonFocusNode,
      menuChildren: _tagsController.tags
          .map(
            (e) => MenuItemButton(
              onPressed: () {
                if (e.contains('" as a new tag')) {
                  final newTag = extractWord(e);

                  _tagsController.addNewTag(newTag).then((value) {
                    _controller.text = newTag;
                    _buttonFocusNode.unfocus();

                    widget.onTap(newTag);
                  });
                } else {
                  _controller.text = e;
                  _buttonFocusNode.unfocus();

                  widget.onTap(e);
                }
              },
              child: Text(e),
            ),
          )
          .toList(),
      builder: (context, controller, child) {
        return TextFormField(
          focusNode: _buttonFocusNode,
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            hintText: 'Select a tag',
            suffixIcon: Icon(Icons.arrow_drop_down),
            prefixIcon: Icon(Icons.label),
          ),
          onChanged: _tagsController.filterItems,
          // onSubmitted: (value) {
          //   controller.close();
          //   // _controller.text = value;
          // },
          onTap: () {
            controller.open();
          },
          onEditingComplete: () {
            controller.close();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a tag';
            }
            return null;
          },
        );
      },
    );
  }

  String extractWord(String text) {
    final startIndex = text.indexOf('"') + 1;
    if (startIndex == -1) {
      return "No word found between double quotes";
    }
    int endIndex = text.indexOf('"', startIndex);
    if (endIndex == -1) {
      return "No closing double quote found";
    }
    return text.substring(startIndex, endIndex);
  }
}
