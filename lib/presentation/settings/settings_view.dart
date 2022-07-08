import 'dart:ui';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/app_theme_bloc/apptheme_bloc.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/l10n/l10n.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/settings/cubits/backup_restore_cubit/backup_data_cubit.dart';
import 'package:watcha_body/presentation/settings/cubits/delete_all_data_cubit/delete_all_data_cubit.dart';
import 'package:watcha_body/size_config.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    Future<void> _showDeleteAllDataConfirmation() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              title: Text(
                'Do you want delete previous data?',
                style: Theme.of(context).textTheme.headline6,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    context.read<DeleteAllDataCubit>().deleteAllData();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<ApppreferencesBloc, ApppreferencesState>(
          builder: (context, state) {
            return MultiBlocListener(
              listeners: [
                BlocListener<BackupRestoreDataCubit, BackupRestoreDataState>(
                  listener: (context, listnerState) {
                    listnerState.maybeMap(
                      orElse: () => null,
                      success: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Success'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // Update Chart and Overview
                        context.read<GetallwidgetsdataBloc>().add(
                              GetallwidgetsdataEvent.fetchAllData(
                                appPreferences:
                                    (state as SavedAndReady).appPreferences,
                              ),
                            );

                        context.read<ChartdataBloc>().add(
                              ChartdataEvent.fetchData(
                                appPreferences: state.appPreferences,
                                duration: DurationsEnum.month1,
                              ),
                            );
                      },
                      failed: (s) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(s.msg),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                    );
                  },
                ),
                BlocListener<DeleteAllDataCubit, DeleteAllDataState>(
                  listener: (context, deleteEventstate) {
                    deleteEventstate.maybeMap(
                      orElse: () => null,
                      success: (_) {
                        // Update Chart and Overview
                        context.read<GetallwidgetsdataBloc>().add(
                              GetallwidgetsdataEvent.fetchAllData(
                                appPreferences:
                                    (state as SavedAndReady).appPreferences,
                              ),
                            );

                        context.read<ChartdataBloc>().add(
                              ChartdataEvent.fetchData(
                                appPreferences: state.appPreferences,
                                duration: DurationsEnum.month1,
                              ),
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Success'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      failed: (s) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              s.msg,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: SizeConfig.screenHeight! * 0.08,
                      child: Stack(
                        children: [
                          Align(
                            child: Text(
                              AppLocalizations.of(context).settingsTitle,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LanguageSelector(
                      appPreferences: (state as SavedAndReady).appPreferences,
                    ),
                    WeightChoiceChip(
                      appPreferences: state.appPreferences,
                    ),
                    LengthChoiceChip(
                      appPreferences: state.appPreferences,
                    ),
                    ThemeChoiceChip(
                      appTheme: context.read<AppthemeBloc>().state,
                    ),
                    const RestoreOrBackup(),
                    SettingsChildContainer(
                      child: TextButton(
                        onPressed: _showDeleteAllDataConfirmation,
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Delete all data',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // HereChoiceChiper<WeightUnit>(
                    //   currentValue: _appPreferences.state.weightUnit,
                    //   items: WeightUnit.values
                    //       .map(
                    //         EnumToString.convertToString,
                    //       )
                    //       .toList(),
                    //   enumItems: WeightUnit.values,
                    //   onChanged: <WeightUnit>(value) {
                    //     if (value is WeightUnit) {
                    //       context.read<ApppreferencesBloc>().add(
                    //             ApppreferencesEvent.updatePreferences(
                    //               appPreferences: AppPreferences(
                    //                 value,
                    //                 _appPreferences.state.lengthUnit,
                    //               ),
                    //             ),
                    //           );
                    //     }
                    //   },
                    // ),
                    // HereChoiceChiper<LengthUnit, LengthUnit>(
                    //   currentValue: _appPreferences.state.lengthUnit,
                    //   items: LengthUnit.values
                    //       .map(
                    //         EnumToString.convertToString,
                    //       )
                    //       .toList(),
                    //   enumItems: LengthUnit.values,
                    //   onChanged: <LengthUnit>(value) {
                    //     if (value is LengthUnit) {
                    //       context.read<ApppreferencesBloc>().add(
                    //             ApppreferencesEvent.updatePreferences(
                    //               appPreferences: AppPreferences(
                    //                 _appPreferences.state.weightUnit,
                    //                 value as LengthUnit,
                    //               ),
                    //             ),
                    //           );
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RestoreOrBackup extends StatefulWidget {
  const RestoreOrBackup({Key? key}) : super(key: key);

  @override
  State<RestoreOrBackup> createState() => _RestoreOrBackupState();
}

class _RestoreOrBackupState extends State<RestoreOrBackup> {
  @override
  Widget build(BuildContext context) {
    // Popup Dialog
    Future<void> _showRestoreOptions(String path) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              title: Text(
                'Do you want delete previous data?',
                style: Theme.of(context).textTheme.headline6,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    context.read<BackupRestoreDataCubit>().restoreData(
                          merge: false,
                          path: path,
                        );
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    context.read<BackupRestoreDataCubit>().restoreData(
                          path: path,
                        );
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Backup or Restore',
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    elevation: 0,
                    onPressed: () {
                      context.read<BackupRestoreDataCubit>().backupData();
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      'Backup',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MaterialButton(
                    elevation: 0,
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['json'],
                      );

                      if (result != null) {
                        await _showRestoreOptions(result.files.first.path!);
                      }
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      'Restore',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightChoiceChip extends StatefulWidget {
  const WeightChoiceChip({
    Key? key,
    required this.appPreferences,
  }) : super(key: key);
  final AppPreferences appPreferences;

  @override
  State<WeightChoiceChip> createState() => _WeightChoiceChipState();
}

class _WeightChoiceChipState extends State<WeightChoiceChip> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentValue = widget.appPreferences.weightUnit;
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weigth Unit',
              style: Theme.of(context).textTheme.headline6,
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
                    selected: currentValue == WeightUnit.values[index],
                    labelStyle: TextStyle(
                      color: currentValue == WeightUnit.values[index]
                          ? Colors.white
                          : Colors.blueAccent,
                    ),
                    onSelected: (value) {
                      context.read<ApppreferencesBloc>().add(
                            ApppreferencesEvent.updatePreferences(
                              appPreferences: AppPreferences(
                                WeightUnit.values[index],
                                widget.appPreferences.lengthUnit,
                                widget.appPreferences.lang,
                              ),
                            ),
                          );
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
    required this.appTheme,
  }) : super(key: key);

  final AppTheme appTheme;

  @override
  State<ThemeChoiceChip> createState() => _ThemeChoiceChipState();
}

class _ThemeChoiceChipState extends State<ThemeChoiceChip> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentValue = widget.appTheme;
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(AppTheme.values.length, (index) {
                  return ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        EnumToString.convertToString(
                          AppTheme.values[index],
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
                    selected: currentValue == AppTheme.values[index],
                    labelStyle: TextStyle(
                      color: currentValue == AppTheme.values[index]
                          ? Colors.white
                          : Colors.blueAccent,
                    ),
                    onSelected: (value) {
                      context.read<AppthemeBloc>().add(
                            AppthemeEvent.changeTheme(
                              appTheme: AppTheme.values[index],
                            ),
                          );
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

class LengthChoiceChip extends StatefulWidget {
  const LengthChoiceChip({
    Key? key,
    required this.appPreferences,
  }) : super(key: key);
  final AppPreferences appPreferences;

  @override
  State<LengthChoiceChip> createState() => _LengthChoiceChipState();
}

class _LengthChoiceChipState extends State<LengthChoiceChip> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentValue = widget.appPreferences.lengthUnit;
    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Length Unit',
              style: Theme.of(context).textTheme.headline6,
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
                    selected: currentValue == LengthUnit.values[index],
                    labelStyle: TextStyle(
                      color: currentValue == LengthUnit.values[index]
                          ? Colors.white
                          : Colors.blueAccent,
                    ),
                    onSelected: (value) {
                      context.read<ApppreferencesBloc>().add(
                            ApppreferencesEvent.updatePreferences(
                              appPreferences: AppPreferences(
                                widget.appPreferences.weightUnit,
                                LengthUnit.values[index],
                                widget.appPreferences.lang,
                              ),
                            ),
                          );
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
              style: Theme.of(context).textTheme.headline6,
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
    required this.appPreferences,
  }) : super(key: key);

  final AppPreferences appPreferences;

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  late List<Locale> _list;
  late Locale _currentLocale;

  @override
  void initState() {
    super.initState();
  }

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
            style: Theme.of(context).textTheme.headline6,
          ),
          DropdownButton<Locale>(
            value: _currentLocale,
            borderRadius: BorderRadius.circular(10),
            underline: const SizedBox.shrink(),
            style: Theme.of(context).textTheme.headline6,
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
              context.read<ApppreferencesBloc>().add(
                    ApppreferencesEvent.updatePreferences(
                      appPreferences: AppPreferences(
                        widget.appPreferences.weightUnit,
                        widget.appPreferences.lengthUnit,
                        _currentLocale.toString().split('.').last,
                      ),
                    ),
                  );
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
