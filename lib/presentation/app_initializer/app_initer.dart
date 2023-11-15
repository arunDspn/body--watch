import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/app_theme_bloc/apptheme_bloc.dart';
import 'package:watcha_body/constants/theme.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/l10n/l10n.dart';
import 'package:watcha_body/presentation/home/home.dart';
import 'package:watcha_body/size_config.dart';

class AppIniter extends StatefulWidget {
  const AppIniter({Key? key}) : super(key: key);

  static const routeName = '/app_initializer';

  @override
  State<AppIniter> createState() => _AppIniterState();
}

class _AppIniterState extends State<AppIniter> {
  WeightUnit? _selectedWeight;
  LengthUnit? _selectedLength;
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    void _updateAppPreferences() {
      final appPreferences = AppPreferences(
        _selectedWeight!,
        _selectedLength!,
        'en',
      );
      context.read<ApppreferencesBloc>().add(
            ApppreferencesEvent.updatePreferences(
              appPreferences: appPreferences,
            ),
          );
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                'Choose your Defaults',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 20),
              // const LanguageSelector(),
              const SizedBox(height: 15),
              WeightChoiceChip(
                onSelected: (weightUnit) {
                  setState(() {
                    _selectedWeight = weightUnit;
                  });
                },
              ),
              const SizedBox(height: 15),
              LengthChoiceChip(
                onSelected: (lengthUnit) {
                  setState(() {
                    _selectedLength = lengthUnit;
                  });
                },
              ),
              const SizedBox(height: 15),
              const ThemeChoiceChip(),
              const Spacer(),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minWidth: SizeConfig.screenWidth! * 0.7,
                color: kPrimaryColorInLight,
                disabledColor: Colors.grey,
                onPressed: (_selectedLength != null && _selectedWeight != null)
                    ? _updateAppPreferences
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Continue',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
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

class WeightChoiceChip extends StatefulWidget {
  const WeightChoiceChip({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final void Function(WeightUnit weightUnit) onSelected;

  @override
  State<WeightChoiceChip> createState() => _WeightChoiceChipState();
}

class _WeightChoiceChipState extends State<WeightChoiceChip> {
  WeightUnit? _selectedWeightUnit;

  @override
  Widget build(BuildContext context) {
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weigth Unit',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(WeightUnit.values.length, (index) {
                  return ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        EnumToString.convertToString(WeightUnit.values[index]),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.blueAccent,
                    elevation: 0,
                    pressElevation: 0,
                    selected: _selectedWeightUnit == WeightUnit.values[index],
                    labelStyle: TextStyle(
                      color: _selectedWeightUnit == WeightUnit.values[index]
                          ? Colors.white
                          : Colors.blueAccent,
                    ),
                    onSelected: (value) {
                      setState(() {
                        _selectedWeightUnit = WeightUnit.values[index];
                        widget.onSelected(_selectedWeightUnit!);
                      });
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeChoiceChip extends StatefulWidget {
  const ThemeChoiceChip({
    Key? key,
  }) : super(key: key);

  @override
  State<ThemeChoiceChip> createState() => _ThemeChoiceChipState();
}

class _ThemeChoiceChipState extends State<ThemeChoiceChip> {
  AppTheme _selectedTheme = AppTheme.lightTheme;

  @override
  Widget build(BuildContext context) {
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AppTheme.values.map((e) {
                  return ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        EnumToString.convertToString(
                          e,
                          camelCase: true,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.blueAccent,
                    elevation: 0,
                    pressElevation: 0,
                    selected: _selectedTheme == e,
                    labelStyle: TextStyle(
                      color: _selectedTheme == e
                          ? Colors.white
                          : Colors.blueAccent,
                    ),
                    onSelected: (value) {
                      _selectedTheme = e;
                      context.read<AppthemeBloc>().add(
                            AppthemeEvent.changeTheme(
                              appTheme: e,
                            ),
                          );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LengthChoiceChip extends StatefulWidget {
  const LengthChoiceChip({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final void Function(LengthUnit weightUnit) onSelected;

  @override
  State<LengthChoiceChip> createState() => _LengthChoiceChipState();
}

class _LengthChoiceChipState extends State<LengthChoiceChip> {
  LengthUnit? _selectedLengthUnit;

  @override
  Widget build(BuildContext context) {
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Length Unit',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(LengthUnit.values.length, (index) {
                  return ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        EnumToString.convertToString(LengthUnit.values[index]),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.blueAccent,
                    elevation: 0,
                    pressElevation: 0,
                    selected: _selectedLengthUnit == LengthUnit.values[index],
                    labelStyle: TextStyle(
                      color: _selectedLengthUnit == LengthUnit.values[index]
                          ? Colors.white
                          : Colors.blueAccent,
                    ),
                    onSelected: (value) {
                      setState(() {
                        _selectedLengthUnit = LengthUnit.values[index];
                        widget.onSelected(_selectedLengthUnit!);
                      });
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// THis is a custom widget for the ChoiceChip
/// ഇത് ഇവിടത്തെ സ്റ്റൈൽ ആൻ
/// ഇവിടെ ഇങ്ങനെ ആൻ മാന്
class HereChoiceChiper<T extends Enum, S> extends StatefulWidget {
  const HereChoiceChiper({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.enumItems,
    required this.currentValue,
  }) : super(key: key);

  final List<String> items;
  final List<T> enumItems;
  final void Function(S? value) onChanged;
  final T currentValue;

  @override
  State<HereChoiceChiper> createState() => _HereChoiceChiperState<T>();
}

class _HereChoiceChiperState<T> extends State<HereChoiceChiper> {
  late String _internalValueKeeper;
  @override
  void initState() {
    _internalValueKeeper = EnumToString.convertToString(widget.currentValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Time',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(widget.items.length, (index) {
                return ChoiceChip(
                  label: Text(widget.items[index]),
                  backgroundColor: Colors.grey.shade100,
                  selectedColor: Colors.blueAccent,
                  elevation: 0,
                  pressElevation: 0,
                  selected: _internalValueKeeper == widget.items[index],
                  labelStyle: TextStyle(
                    color: _internalValueKeeper == widget.items[index]
                        ? Colors.white
                        : Colors.blueAccent,
                  ),
                  onSelected: (value) {
                    if (value) {
                      setState(() {
                        _internalValueKeeper = widget.items[index];
                      });
                      widget.onChanged(
                        EnumToString.fromString(
                          widget.enumItems,
                          widget.items[index],
                        ),
                      );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  late List<Locale> _list;
  late Locale _currentLocale;

  @override
  Widget build(BuildContext context) {
    _list = AppLocalizations.supportedLocales;
    _currentLocale = Localizations.localeOf(context);

    return SettingsChildContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          DropdownButton<Locale>(
            value: _currentLocale,
            borderRadius: BorderRadius.circular(10),
            underline: const SizedBox.shrink(),
            style: Theme.of(context).textTheme.titleLarge,
            items: _list
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.toString().split('.').last,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _currentLocale = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

class SettingsChildContainer extends StatelessWidget {
  const SettingsChildContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
