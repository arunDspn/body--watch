import 'package:flutter/material.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

sealed class TagDropDownMenuState {}

class TagDropDownMenuStateLoading extends TagDropDownMenuState {}

class TagDropDownMenuStateLoaded extends TagDropDownMenuState {
  TagDropDownMenuStateLoaded({required this.tags});
  final List<String> tags;
}

class TagDropDownMenuStateError extends TagDropDownMenuState {
  TagDropDownMenuStateError(this.error);
  final String error;
}

class TagDropDownMenuController extends ChangeNotifier {
  TagDropDownMenuController({required this.bodyPictureRepository});

  final BodyPictureRepository bodyPictureRepository;

  TagDropDownMenuState state = TagDropDownMenuStateLoading();

  Future<void> getTags() async {
    final result = await bodyPictureRepository.getAllTags();
    result.fold((l) {
      state = TagDropDownMenuStateError(l);
      notifyListeners();
    }, (r) {
      state = TagDropDownMenuStateLoaded(tags: r);
      notifyListeners();
    });
  }
}

class TagDropDownMenu extends StatefulWidget {
  const TagDropDownMenu({
    super.key,
    required this.bodyPictureRepository,
    required this.onSelected,
  });

  final BodyPictureRepository bodyPictureRepository;
  final void Function(String tag) onSelected;

  @override
  State<TagDropDownMenu> createState() => _TagDropDownMenuState();
}

class _TagDropDownMenuState extends State<TagDropDownMenu> {
  late final TextEditingController _controller = TextEditingController();

  late final tagDropDownController = TagDropDownMenuController(
    bodyPictureRepository: widget.bodyPictureRepository,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tagDropDownController
      ..getTags()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownMenu<String>(
        requestFocusOnTap: true,
        enableFilter: true,
        label: const Text('Tag'),
        leadingIcon: const Icon(Icons.tag),
        hintText: tagDropDownController.state is TagDropDownMenuStateLoaded
            ? 'Select a Tag'
            : '',
        controller: _controller,
        expandedInsets: EdgeInsets.zero,
        onSelected: (value) {
          if (value != null) {
            widget.onSelected(value);
          }
        },
        searchCallback: (entries, query) {
          if (query.isEmpty) {
            return null;
          }
          final index = entries.indexWhere(
            (DropdownMenuEntry<String> entry) => entry.label == query,
          );

          return index != -1 ? index : null;
        },
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(8),
          isDense: true,
          labelStyle: TextStyle(
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        dropdownMenuEntries:
            tagDropDownController.state is TagDropDownMenuStateLoaded
                ? (tagDropDownController.state as TagDropDownMenuStateLoaded)
                    .tags
                    .map((e) => DropdownMenuEntry(value: e, label: e))
                    .toList()
                : [],
      ),
    );
  }
}
