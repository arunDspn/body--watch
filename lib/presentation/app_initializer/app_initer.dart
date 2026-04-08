import 'package:enum_to_string/enum_to_string.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:watcha_body/app/app_theme_bloc/apptheme_bloc.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/repositories/user_preference/user_preference_reposiotry.dart';
import 'package:watcha_body/data/repositories/user_profile_repository.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';
import 'package:watcha_body/domain/models/app_preferences.dart';
import 'package:watcha_body/domain/user_preferences/models/user_unit_preferences_entity.dart';
import 'package:watcha_body/l10n/arb/app_localizations.dart';
import 'package:watcha_body/presentation/app_initializer/cubit/get_all_metrics/get_all_metric_units_available_cubit.dart';
import 'package:watcha_body/presentation/common_widgets/reusable_segmented_button.dart';
import 'package:watcha_body/presentation/home/home.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/settings/settings_view.dart';

import 'package:watcha_body/size_config.dart';

class AppIniter extends StatefulWidget {
  const AppIniter({Key? key}) : super(key: key);

  static const routeName = '/app_initializer';

  @override
  State<AppIniter> createState() => _AppIniterState();
}

class _AppIniterState extends State<AppIniter> {
  Map<String, dynamic> dynamicStates = {};
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _heightFeetController = TextEditingController();
  final TextEditingController _heightInchController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  DateTime? _selectedDob;
  String? _selectedGender;
  String? _selectedHeightUnit;
  String? _selectedWeightUnit;
  bool _isSaving = false;

  @override
  void dispose() {
    _heightController.dispose();
    _heightFeetController.dispose();
    _heightInchController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  List<MetricUnitsModel> _unitsForCode({
    required Map<String, List<MetricUnitsModel>> metricUnits,
    required List<String> metricCodes,
  }) {
    final units = metricUnits.values
        .expand((items) => items)
        .where((unit) => metricCodes.contains(unit.code))
        .toList();

    final uniqueByUnit = <String, MetricUnitsModel>{};
    for (final unit in units) {
      uniqueByUnit[unit.unit] = unit;
    }

    return uniqueByUnit.values.toList();
  }

  double? _parseOptionalNumber(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return double.tryParse(trimmed);
  }

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: _selectedDob ?? DateTime(now.year - 20, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (selected != null) {
      setState(() {
        _selectedDob = selected;
      });
    }
  }

  Future<void> _saveAllSetupData(
    Map<String, List<MetricUnitsModel>> metricUnits,
  ) async {
    final hasPendingSelections = dynamicStates.values.any(
      (element) => element == null,
    );

    if (_selectedGender == null || hasPendingSelections || _isSaving) {
      return;
    }

    final heightValue = _parseOptionalNumber(_heightController.text);
    final weightValue = _parseOptionalNumber(_weightController.text);

    double? resolvedHeightValue = heightValue;
    String? resolvedHeightUnit = _selectedHeightUnit;

    if (_selectedHeightUnit == 'ft') {
      final feet = _parseOptionalNumber(_heightFeetController.text) ?? 0;
      final inches = _parseOptionalNumber(_heightInchController.text) ?? 0;

      if (inches >= 12) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Inches must be less than 12.'),
          ),
        );
        return;
      }

      if (feet > 0 || inches > 0) {
        resolvedHeightValue = ((feet * 12) + inches) * 2.54;
        resolvedHeightUnit = 'cm';
      } else {
        resolvedHeightValue = null;
      }
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final userPreferences = <UserUnitPreferencesEntity>[];
      dynamicStates.forEach((key, value) {
        final pref = UserUnitPreferencesEntity(
          userId: 1,
          metricCode: metricUnits[key]!
              .firstWhere((element) => element.unit == value)
              .code,
          preferredUnit: value,
        );
        userPreferences.add(pref);
      });

      await context.read<UserPreferenceRepository>().setAllPreferences(
        userPreferences,
      );

      await context.read<UserProfileRepository>().saveProfileSetup(
        userId: 1,
        gender: _selectedGender!,
        dob: _selectedDob,
        height: resolvedHeightValue,
        heightUnit: resolvedHeightUnit,
        weight: weightValue,
        weightUnit: _selectedWeightUnit,
      );

      if (weightValue != null && _selectedWeightUnit != null) {
        final weightUnits = _unitsForCode(
          metricUnits: metricUnits,
          metricCodes: const ['weight'],
        );
        final selectedWeight = weightUnits.firstWhereOrNull(
          (unit) => unit.unit == _selectedWeightUnit,
        );

        if (selectedWeight != null) {
          final measurementRepository = context.read<MeasurementRepository>();
          final allTargetsResult = await measurementRepository.getAllTargets();

          await allTargetsResult.fold(
            (failure) async {
              throw Exception(failure);
            },
            (targets) async {
              final weightTarget = targets.firstWhereOrNull(
                (target) => target.code == 'weight',
              );
              if (weightTarget == null) {
                return;
              }

              final existingWeightResult = await measurementRepository
                  .getMeasurementsByTarget(
                    targetId: weightTarget.id,
                    userId: 1,
                  );

              final hasWeightMeasurement = existingWeightResult.fold(
                (_) => false,
                (measurements) => measurements.isNotEmpty,
              );

              if (hasWeightMeasurement) {
                return;
              }

              final createResult = await measurementRepository
                  .createMeasurement(
                    measurement: MeasurementEntity.createNew(
                      date: DateTime.now(),
                      value: weightValue * selectedWeight.toBaseFactor,
                      notes: 'Initial profile setup',
                      targetId: weightTarget.id,
                    ),
                  );

              createResult.fold((failure) => throw Exception(failure), (_) {});
            },
          );
        }
      }

      await context.read<UserPreferencesCubit>().fetchUserPreferences(1);
      context.read<GetallwidgetsdataBloc>().add(
        const GetallwidgetsdataEvent.fetchAllData(),
      );

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: const Text('Setup completed successfully!'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeView.routeName,
        (route) => false,
      );
    } catch (e) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Failed to save setup: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Choose your defaults',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<GetAllMetricUnitsAvailableCubit, GetAllMetricUnitsAvailableState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (metricUnits) {
                if (dynamicStates.isEmpty) {
                  metricUnits!.forEach((key, value) {
                    dynamicStates[key] = null;
                  });
                }

                final weightUnits = _unitsForCode(
                  metricUnits: metricUnits!,
                  metricCodes: const ['weight'],
                );
                if (_selectedWeightUnit == null && weightUnits.isNotEmpty) {
                  _selectedWeightUnit = weightUnits.first.unit;
                }

                final heightUnits = _unitsForCode(
                  metricUnits: metricUnits,
                  metricCodes: const ['height', 'length'],
                );
                if (_selectedHeightUnit == null && heightUnits.isNotEmpty) {
                  _selectedHeightUnit = heightUnits.first.unit;
                }
              },
            );
          },
          builder: (context, state) {
            return state.when(
              error: (message) {
                return Center(child: Text('Error: $message'));
              },
              initial: () {
                return const Center(child: Text('Initializing...'));
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              loaded: (metricUnits) {
                final hasPendingSelections = dynamicStates.values.any(
                  (element) => element == null,
                );

                final heightUnits = _unitsForCode(
                  metricUnits: metricUnits!,
                  metricCodes: const ['height', 'length'],
                );
                final weightUnits = _unitsForCode(
                  metricUnits: metricUnits,
                  metricCodes: const ['weight'],
                );

                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Profile setup',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Gender is required for formula-based features. Height, date of birth, and weight are optional.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  height: 1.35,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'Gender *',
                                style: theme.textTheme.labelLarge,
                              ),
                              const SizedBox(height: 8),
                              SegmentedButton<String>(
                                emptySelectionAllowed: true,
                                segments: const [
                                  ButtonSegment<String>(
                                    value: 'male',
                                    label: Text('Male'),
                                  ),
                                  ButtonSegment<String>(
                                    value: 'female',
                                    label: Text('Female'),
                                  ),
                                ],
                                selected: {
                                  if (_selectedGender != null) _selectedGender!,
                                },
                                onSelectionChanged: (selection) {
                                  setState(() {
                                    _selectedGender = selection.firstOrNull;
                                  });
                                },
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Expanded(
                                    child: _selectedHeightUnit == 'ft'
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      _heightFeetController,
                                                  keyboardType:
                                                      const TextInputType.numberWithOptions(
                                                        decimal: false,
                                                      ),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText:
                                                            'Feet (optional)',
                                                      ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      _heightInchController,
                                                  keyboardType:
                                                      const TextInputType.numberWithOptions(
                                                        decimal: false,
                                                      ),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  decoration:
                                                      const InputDecoration(
                                                        labelText:
                                                            'Inches (0-11)',
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : TextField(
                                            controller: _heightController,
                                            keyboardType:
                                                const TextInputType.numberWithOptions(
                                                  decimal: true,
                                                ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d*\.?\d{0,2}'),
                                              ),
                                            ],
                                            decoration: const InputDecoration(
                                              labelText: 'Height (optional)',
                                            ),
                                          ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: 110,
                                    child: DropdownButtonFormField<String>(
                                      value: _selectedHeightUnit,
                                      decoration: const InputDecoration(
                                        labelText: 'Unit',
                                      ),
                                      items: heightUnits
                                          .map(
                                            (unit) => DropdownMenuItem<String>(
                                              value: unit.unit,
                                              child: Text(
                                                unit.unit == 'ft'
                                                    ? 'ft / in'
                                                    : unit.unit,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedHeightUnit = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _weightController,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                            decimal: true,
                                          ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d*\.?\d{0,2}'),
                                        ),
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: 'Weight (optional)',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: 110,
                                    child: DropdownButtonFormField<String>(
                                      value: _selectedWeightUnit,
                                      decoration: const InputDecoration(
                                        labelText: 'Unit',
                                      ),
                                      items: weightUnits
                                          .map(
                                            (unit) => DropdownMenuItem<String>(
                                              value: unit.unit,
                                              child: Text(unit.unit),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedWeightUnit = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              OutlinedButton.icon(
                                onPressed: _pickDob,
                                icon: const Icon(Icons.calendar_today_rounded),
                                label: Text(
                                  _selectedDob == null
                                      ? 'Date of birth (optional)'
                                      : 'DOB: ${_selectedDob!.year}-${_selectedDob!.month.toString().padLeft(2, '0')}-${_selectedDob!.day.toString().padLeft(2, '0')}',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.tune_rounded,
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Pick your preferred units once and we will use them across the app.',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    height: 1.35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Column(
                          children: metricUnits.keys.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Material(
                                color: colorScheme.surfaceContainer,
                                elevation: 0,
                                borderRadius: BorderRadius.circular(20),
                                child:
                                    ReusableSegmentedButton<MetricUnitsModel>(
                                      sectionName: e,
                                      items: metricUnits[e]!,
                                      getLabel: (item) {
                                        return item.unit == 'ft'
                                            ? 'ft / in'
                                            : item.unit;
                                      },
                                      onSelectionChanged: (selection) {
                                        setState(() {
                                          dynamicStates[e] = selection?.unit;
                                        });
                                      },
                                    ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: double.infinity,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                minimumSize: const Size.fromHeight(54),
                                textStyle: theme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed:
                                  (hasPendingSelections ||
                                      _selectedGender == null ||
                                      _isSaving)
                                  ? null
                                  : () => _saveAllSetupData(metricUnits),
                              icon: _isSaving
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.arrow_forward_rounded),
                              label: Text(
                                _isSaving
                                    ? 'Saving setup...'
                                    : hasPendingSelections
                                    ? 'Select all units'
                                    : _selectedGender == null
                                    ? 'Select gender'
                                    : 'Continue',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class WeightChoiceChip extends StatefulWidget {
  const WeightChoiceChip({Key? key, required this.onSelected})
    : super(key: key);

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
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),

            Center(
              child: SegmentedButton<WeightUnit?>(
                segments: WeightUnit.values
                    .map((e) => ButtonSegment(value: e, label: Text(e.name)))
                    .toList(),
                selected: {_selectedWeightUnit},
                onSelectionChanged: (p0) {
                  if (p0.first != null) {
                    _selectedWeightUnit = p0.first;
                    widget.onSelected(_selectedWeightUnit!);
                  }
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(4),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: List.generate(WeightUnit.values.length, (index) {
            //       return ChoiceChip(
            //         label: Padding(
            //           padding: const EdgeInsets.all(4),
            //           child: Text(
            //             EnumToString.convertToString(WeightUnit.values[index]),
            //             style: const TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         backgroundColor: Colors.grey.shade100,
            //         selectedColor: Colors.blueAccent,
            //         elevation: 0,
            //         pressElevation: 0,
            //         selected: _selectedWeightUnit == WeightUnit.values[index],
            //         labelStyle: TextStyle(
            //           color: _selectedWeightUnit == WeightUnit.values[index]
            //               ? Colors.white
            //               : Colors.blueAccent,
            //         ),
            //         onSelected: (value) {
            //           setState(() {
            //             _selectedWeightUnit = WeightUnit.values[index];
            //             widget.onSelected(_selectedWeightUnit!);
            //           });
            //         },
            //       );
            //     }),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ThemeChoiceChip extends StatefulWidget {
  const ThemeChoiceChip({Key? key}) : super(key: key);

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
            Text('Theme', style: Theme.of(context).textTheme.titleLarge),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AppTheme.values.map((e) {
                  return ChoiceChip(
                    label: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        EnumToString.convertToString(e, camelCase: true),
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
                        AppthemeEvent.changeTheme(appTheme: e),
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
  const LengthChoiceChip({Key? key, required this.onSelected})
    : super(key: key);

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
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(4),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: List.generate(LengthUnit.values.length, (index) {
            //       return ChoiceChip(
            //         label: Padding(
            //           padding: const EdgeInsets.all(4),
            //           child: Text(
            //             EnumToString.convertToString(LengthUnit.values[index]),
            //             style: const TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         backgroundColor: Colors.grey.shade100,
            //         selectedColor: Colors.blueAccent,
            //         elevation: 0,
            //         pressElevation: 0,
            //         selected: _selectedLengthUnit == LengthUnit.values[index],
            //         labelStyle: TextStyle(
            //           color: _selectedLengthUnit == LengthUnit.values[index]
            //               ? Colors.white
            //               : Colors.blueAccent,
            //         ),
            //         onSelected: (value) {
            //           setState(() {
            //             _selectedLengthUnit = LengthUnit.values[index];
            //             widget.onSelected(_selectedLengthUnit!);
            //           });
            //         },
            //       );
            //     }),
            //   ),
            // ),
            Center(
              child: SegmentedButton<LengthUnit?>(
                segments: LengthUnit.values
                    .map((e) => ButtonSegment(value: e, label: Text(e.name)))
                    .toList(),
                selected: {_selectedLengthUnit},
                onSelectionChanged: (p0) {
                  if (p0.first != null) {
                    _selectedLengthUnit = p0.first;
                    widget.onSelected(_selectedLengthUnit!);
                  }
                },
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
            Text('Time', style: Theme.of(context).textTheme.titleLarge),
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
  const LanguageSelector({Key? key}) : super(key: key);

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
          Text('Language', style: Theme.of(context).textTheme.titleLarge),
          DropdownButton<Locale>(
            value: _currentLocale,
            borderRadius: BorderRadius.circular(10),
            underline: const SizedBox.shrink(),
            style: Theme.of(context).textTheme.titleLarge,
            items: _list
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().split('.').last),
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

// class SettingsChildContainer extends StatelessWidget {
//   const SettingsChildContainer({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Theme.of(context).colorScheme.onPrimaryContainer,
//         ),
//         width: double.infinity,
//         child: child,
//       ),
//     );
//   }
// }
