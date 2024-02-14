import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/filter_modal/bloc/picture_type_filter_modal_bloc.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // HEading
        Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              const Icon(Icons.filter_alt),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Filter',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        BlocBuilder<PictureTypeFilterModalBloc, PictureTypeFilterModalState>(
          builder: (context, state) {
            return state.map(
              failed: (value) {
                return const Center(
                  child: Text('Failed'),
                );
              },
              loading: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              success: (value) {
                final list = value.allTypes;
                final selected = value.selectedTypes;

                return SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(list[index]),
                          selected: selected.contains(list[index]),
                          value: selected.contains(list[index]),
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (bool? value) {
                            if (value != null) {
                              context.read<PictureTypeFilterModalBloc>().add(
                                    PictureTypeFilterModalEvent.toggle(
                                      type: list[index],
                                      value: value,
                                    ),
                                  );
                            }
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
