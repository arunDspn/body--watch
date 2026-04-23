import 'dart:io';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/app_theme_bloc/apptheme_bloc.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/repositories/user_profile_repository.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/domain/measurement/i_measurements.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';
import 'package:watcha_body/domain/models/app_preferences.dart';
import 'package:watcha_body/domain/user_preferences/models/user_unit_preference_model.dart';
import 'package:watcha_body/l10n/arb/app_localizations.dart';
import 'package:watcha_body/presentation/app_initializer/cubit/get_all_metrics/get_all_metric_units_available_cubit.dart';
import 'package:watcha_body/presentation/common_widgets/reusable_segmented_button.dart';
import 'package:watcha_body/presentation/core/controllers/cubit/all_available_targets_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/gallery_view/vault_gallery_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/settings/cubits/backup_restore_cubit/backup_data_cubit.dart';
import 'package:watcha_body/presentation/settings/cubits/delete_all_data_cubit/delete_all_data_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    SnackBar _buildFloatingSnackBar(String message, {Color? backgroundColor}) {
      return SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        content: Text(message),
      );
    }

    Future<void> _showDeleteAllDataConfirmation() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              backgroundColor: colorScheme.surfaceContainerHigh,
              surfaceTintColor: Colors.transparent,
              title: Text(
                'Do you want delete previous data?',
                style: Theme.of(context).textTheme.titleLarge,
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

    final userPref =
        (context.watch<UserPreferencesCubit>().state as UserPreferencesLoaded)
            .preferences;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).settingsTitle,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              Navigator.of(context).pushNamed(VaultGalleryView.routeName);
            },
            icon: const Icon(Icons.settings_backup_restore_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ApppreferencesBloc, ApppreferencesState>(
          builder: (context, state) {
            return MultiBlocListener(
              listeners: [
                BlocListener<BackupRestoreDataCubit, BackupRestoreDataState>(
                  listener: (context, listnerState) {
                    switch (listnerState) {
                      case BackupRestoreDataStateInitial():
                        // Do nothing
                        break;
                      case BackupRestoreDataStateLoading():
                        ScaffoldMessenger.of(context).showSnackBar(
                          _buildFloatingSnackBar(
                            'Loading...',
                            backgroundColor: colorScheme.primary,
                          ),
                        );
                        break;
                      case BackupRestoreDataStateSuccess():
                        ScaffoldMessenger.of(context).showSnackBar(
                          _buildFloatingSnackBar(
                            context
                                .read<BackupRestoreDataCubit>()
                                .successMessage,
                            backgroundColor: Colors.green,
                          ),
                        );
                        context.read<GetallwidgetsdataBloc>().add(
                          const GetallwidgetsdataEvent.fetchAllData(),
                        );
                        context.read<AllAvailableTargetsCubit>().fetch();
                        context
                            .read<UserPreferencesCubit>()
                            .fetchUserPreferences(1);
                        context
                            .read<GetAllMetricUnitsAvailableCubit>()
                            .fetchAllMetricUnitsAvailable();
                        context.read<LoadPicturesCubit>().load();
                        break;
                      case BackupRestoreDataStateFailed(msg: final s):
                        ScaffoldMessenger.of(context).showSnackBar(
                          _buildFloatingSnackBar(
                            s,
                            backgroundColor: Colors.red,
                          ),
                        );
                        break;
                    }
                  },
                ),
                BlocListener<DeleteAllDataCubit, DeleteAllDataState>(
                  listener: (context, deleteEventstate) {
                    switch (deleteEventstate) {
                      case DeleteAllDataStateInitial():
                        // Do nothing
                        break;
                      case DeleteAllDataStateSuccess():
                        ScaffoldMessenger.of(context).showSnackBar(
                          _buildFloatingSnackBar(
                            'Success',
                            backgroundColor: Colors.green,
                          ),
                        );
                        context.read<GetallwidgetsdataBloc>().add(
                          const GetallwidgetsdataEvent.fetchAllData(),
                        );
                        context.read<AllAvailableTargetsCubit>().fetch();
                        context.read<LoadPicturesCubit>().load();
                        break;
                      case DeleteAllDataStateFailed(msg: final s):
                        ScaffoldMessenger.of(context).showSnackBar(
                          _buildFloatingSnackBar(
                            s,
                            backgroundColor: Colors.red,
                          ),
                        );
                        break;

                      default:
                        break;
                    }
                  },
                ),
              ],
              child: SafeArea(
                child: Column(
                  children: [
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: SizeConfig.screenHeight! * 0.08,
                    //   child: Stack(
                    //     children: [
                    //       Align(
                    //         child: Text(
                    //           AppLocalizations.of(context).settingsTitle,
                    //           style: Theme.of(context).textTheme.displaySmall,
                    //         ),
                    //       ),
                    //       Align(
                    //         alignment: Alignment.centerRight,
                    //         child: TextButton(
                    //           onPressed: () {
                    //             Navigator.pop(context);
                    //           },
                    //           child: const Text('Cancel'),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                Icons.tune_rounded,
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Personalize units and backups with your preferred defaults.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  height: 1.35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ProfileSettingsSection(),
                    const ChartSourceFilterPreferenceSection(),
                    // LanguageSelector(
                    //   appPreferences: (state as SavedAndReady).appPreferences,
                    // ),
                    // WeightChoiceChip(
                    //   appPreferences: state.appPreferences,
                    // ),
                    // LengthChoiceChip(
                    //   appPreferences: state.appPreferences,
                    // ),
                    // ThemeChoiceChip(
                    //   appTheme: context.read<AppthemeBloc>().state,
                    // ),
                    BlocBuilder<
                      GetAllMetricUnitsAvailableCubit,
                      GetAllMetricUnitsAvailableState
                    >(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const SizedBox.shrink();
                          },
                          loaded: (allUnits) {
                            return Column(
                              children: allUnits!.keys.map((e) {
                                return ReusableSegmentedButton<
                                  MetricUnitsModel
                                >(
                                  selectedItem: allUnits[e]!.firstWhereOrNull(
                                    (metricUnitElement) =>
                                        metricUnitElement.unit ==
                                        userPref.firstWhere((prefElement) {
                                          return prefElement.metricCode ==
                                              allUnits[e]!.first.code;
                                        }).preferredUnit,
                                  ),
                                  sectionName: e,
                                  items: allUnits[e]!,
                                  getLabel: (item) =>
                                      item.unit == 'ft' ? 'ft / in' : item.unit,
                                  onSelectionChanged: (selection) {
                                    context
                                        .read<UserPreferencesCubit>()
                                        .updateSinglePreference(
                                          UserUnitPreferenceModel(
                                            metricCode: allUnits[e]!.first.code,
                                            toBaseFactor:
                                                selection!.toBaseFactor,
                                            preferredUnit: selection.unit,
                                          ),
                                          1,
                                        );
                                  },
                                );
                              }).toList(),
                            );
                          },
                        );
                      },
                    ),
                    const RestoreOrBackup(),
                    SettingsChildContainer(
                      child: TextButton(
                        onPressed: _showDeleteAllDataConfirmation,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          textStyle: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('Delete all data'),
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

class ProfileSettingsSection extends StatefulWidget {
  const ProfileSettingsSection({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsSection> createState() => _ProfileSettingsSectionState();
}

class _ProfileSettingsSectionState extends State<ProfileSettingsSection> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _heightFeetController = TextEditingController();
  final TextEditingController _heightInchController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  DateTime? _selectedDob;
  String? _selectedGender;
  String? _selectedHeightUnit;
  String? _selectedWeightUnit;
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _heightFeetController.dispose();
    _heightInchController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    try {
      final profile = await context
          .read<UserProfileRepository>()
          .getProfileSetup(userId: 1);

      _selectedGender = profile.gender;
      _selectedDob = profile.dob;
      _selectedHeightUnit = profile.heightUnit;
      _selectedWeightUnit = profile.weightUnit;

      if (profile.height != null) {
        if (profile.heightUnit == 'cm' || profile.heightUnit == null) {
          _heightController.text = profile.height!.toStringAsFixed(1);
        } else if (profile.heightUnit == 'ft') {
          final totalInches = profile.height! / 2.54;
          final feet = totalInches ~/ 12;
          final inches = (totalInches - (feet * 12)).round();
          _heightFeetController.text = feet.toString();
          _heightInchController.text = inches.toString();
        } else {
          _heightController.text = profile.height!.toStringAsFixed(1);
        }
      }

      if (profile.weight != null) {
        _weightController.text = profile.weight!.toStringAsFixed(1);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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

    if (selected != null && mounted) {
      setState(() {
        _selectedDob = selected;
      });
    }
  }

  Future<void> _saveProfile(
    Map<String, List<MetricUnitsModel>> metricUnits,
    List<MetricUnitsModel> weightUnits,
  ) async {
    if (_selectedGender == null || _isSaving) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Please select gender first.'),
        ),
      );
      return;
    }

    double? resolvedHeightValue = _parseOptionalNumber(_heightController.text);
    String? resolvedHeightUnit = _selectedHeightUnit;
    final weightValue = _parseOptionalNumber(_weightController.text);

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
        final selectedWeightUnit = weightUnits.firstWhereOrNull(
          (unit) => unit.unit == _selectedWeightUnit,
        );

        if (selectedWeightUnit != null) {
          final measurementRepository = context.read<MeasurementRepository>();
          final allTargetsResult = await measurementRepository.getAllTargets();

          await allTargetsResult.fold((_) async {}, (targets) async {
            final weightTarget = targets.firstWhereOrNull(
              (target) => target.code == 'weight',
            );
            if (weightTarget == null) {
              return;
            }

            final existingWeightResult = await measurementRepository
                .getMeasurementsByTarget(targetId: weightTarget.id, userId: 1);
            final hasWeightMeasurement = existingWeightResult.fold(
              (_) => false,
              (measurements) => measurements.isNotEmpty,
            );

            if (!hasWeightMeasurement) {
              await measurementRepository.createMeasurement(
                measurement: MeasurementEntity.createNew(
                  date: DateTime.now(),
                  value: weightValue * selectedWeightUnit.toBaseFactor,
                  notes: 'Profile updated from settings',
                  targetId: weightTarget.id,
                ),
              );
            }
          });
        }
      }

      if (!mounted) {
        return;
      }

      context.read<GetallwidgetsdataBloc>().add(
        const GetallwidgetsdataEvent.fetchAllData(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Profile updated successfully.'),
        ),
      );
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Failed to save profile: $e'),
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

    if (_isLoading) {
      return const SettingsChildContainer(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return BlocBuilder<
      GetAllMetricUnitsAvailableCubit,
      GetAllMetricUnitsAvailableState
    >(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loaded: (allUnits) {
            final heightUnits = _unitsForCode(
              metricUnits: allUnits!,
              metricCodes: const ['height', 'length'],
            );
            final weightUnits = _unitsForCode(
              metricUnits: allUnits,
              metricCodes: const ['weight'],
            );

            _selectedHeightUnit ??= heightUnits.firstOrNull?.unit;
            _selectedWeightUnit ??= weightUnits.firstOrNull?.unit;

            return SettingsChildContainer(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Gender is required for formulas. Height, date of birth, and weight are optional.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text('Gender *', style: theme.textTheme.labelLarge),
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
                      selected: {if (_selectedGender != null) _selectedGender!},
                      onSelectionChanged: (selection) {
                        setState(() {
                          _selectedGender = selection.firstOrNull;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _selectedHeightUnit == 'ft'
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _heightFeetController,
                                        keyboardType:
                                            const TextInputType.numberWithOptions(
                                              decimal: false,
                                            ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        decoration: const InputDecoration(
                                          labelText: 'Feet (optional)',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        controller: _heightInchController,
                                        keyboardType:
                                            const TextInputType.numberWithOptions(
                                              decimal: false,
                                            ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        decoration: const InputDecoration(
                                          labelText: 'Inches (0-11)',
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
                                      unit.unit == 'ft' ? 'ft / in' : unit.unit,
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
                            keyboardType: const TextInputType.numberWithOptions(
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
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _isSaving
                            ? null
                            : () => _saveProfile(allUnits, weightUnits),
                        icon: _isSaving
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.save_outlined),
                        label: Text(_isSaving ? 'Saving...' : 'Save profile'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Future<void> _showBackupModeOptions() async {
      return showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Backup type'),
            content: const Text('Choose what you want to back up.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<BackupRestoreDataCubit>().backupData();
                },
                child: const Text('Measurements'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<BackupRestoreDataCubit>().backupFullData();
                },
                child: const Text('Full App'),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }

    Future<void> _showShareModeOptions() async {
      return showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Share backup type'),
            content: const Text('Choose what you want to share.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<BackupRestoreDataCubit>().shareDatabase();
                },
                child: const Text('Measurements'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.read<BackupRestoreDataCubit>().shareFullBackup();
                },
                child: const Text('Full App'),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }

    // Restore Options Dialog
    Future<void> _showRestoreOptions(String path) async {
      final isFullBackup = path.toLowerCase().endsWith('.zip');
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              backgroundColor: colorScheme.surfaceContainerHigh,
              surfaceTintColor: Colors.transparent,
              title: Text(
                isFullBackup
                    ? 'Replace existing full app data?'
                    : 'Do you want delete previous data?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    if (isFullBackup) {
                      context.read<BackupRestoreDataCubit>().restoreFullData(
                        merge: false,
                        path: path,
                      );
                    } else {
                      context.read<BackupRestoreDataCubit>().restoreData(
                        merge: false,
                        path: path,
                      );
                    }
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    if (isFullBackup) {
                      context.read<BackupRestoreDataCubit>().restoreFullData(
                        path: path,
                      );
                    } else {
                      context.read<BackupRestoreDataCubit>().restoreData(
                        path: path,
                      );
                    }
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
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(4),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       if (Platform.operatingSystem == 'android')
            //         MaterialButton(
            //           elevation: 0,
            //           onPressed: () {
            //             context.read<BackupRestoreDataCubit>().backupData();
            //           },
            //           color: Colors.blueAccent,
            //           textColor: Colors.white,
            //           shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(20)),
            //           ),
            //           child: const Text(
            //             'Backup',
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         )
            //       else
            //         const SizedBox.shrink(),
            //       MaterialButton(
            //         elevation: 0,
            //         onPressed: () {
            //           context.read<BackupRestoreDataCubit>().shareDatabase();
            //         },
            //         color: Colors.blueAccent,
            //         textColor: Colors.white,
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //         ),
            //         child: const Text(
            //           'Share Backup',
            //           style: TextStyle(
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       MaterialButton(
            //         elevation: 0,
            //         onPressed: () async {
            //           final result = await FilePicker.platform.pickFiles(
            //             type: FileType.custom,
            //             allowedExtensions: ['json'],
            //           );

            //           if (result != null) {
            //             await _showRestoreOptions(result.files.first.path!);
            //           }
            //         },
            //         color: Colors.blueAccent,
            //         textColor: Colors.white,
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //         ),
            //         child: const Text(
            //           'Restore',
            //           style: TextStyle(
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (Platform.operatingSystem == 'android') ...[
                      FilledButton.icon(
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          _showBackupModeOptions();
                        },
                        icon: const Icon(Icons.backup_outlined),
                        label: const Text(
                          'Backup',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                    ] else
                      const SizedBox.shrink(),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: colorScheme.secondaryContainer,
                        foregroundColor: colorScheme.onSecondaryContainer,
                      ),
                      onPressed: () {
                        _showShareModeOptions();
                      },
                      icon: const Icon(Icons.share_outlined),
                      label: const Text(
                        'Share Backup',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['json', 'zip'],
                        );

                        if (result != null) {
                          await _showRestoreOptions(result.files.first.path!);
                        }
                      },
                      icon: const Icon(Icons.restore_page_outlined),
                      label: const Text(
                        'Restore',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightChoiceChip extends StatefulWidget {
  const WeightChoiceChip({Key? key, required this.appPreferences})
    : super(key: key);
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
            //         selected: currentValue == WeightUnit.values[index],
            //         labelStyle: TextStyle(
            //           color: currentValue == WeightUnit.values[index]
            //               ? Colors.white
            //               : Colors.blueAccent,
            //         ),
            //         onSelected: (value) {
            //           context.read<ApppreferencesBloc>().add(
            //                 ApppreferencesEvent.updatePreferences(
            //                   appPreferences: AppPreferences(
            //                     WeightUnit.values[index],
            //                     widget.appPreferences.lengthUnit,
            //                     widget.appPreferences.lang,
            //                   ),
            //                 ),
            //               );
            //         },
            //       );
            //     }),
            //   ),
            // ),

            // Center(
            //   child: SegmentedButton<WeightUnit>(
            //     segments: WeightUnit.values
            //         .map(
            //           (e) => ButtonSegment(
            //             value: e,
            //             label: Text(e.name),
            //           ),
            //         )
            //         .toList(),
            //     selected: {currentValue},
            //     onSelectionChanged: (p0) {
            //       context.read<ApppreferencesBloc>().add(
            //             ApppreferencesEvent.updatePreferences(
            //               appPreferences: AppPreferences(
            //                 p0.first,
            //                 widget.appPreferences.lengthUnit,
            //                 widget.appPreferences.lang,
            //               ),
            //             ),
            //           );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ThemeChoiceChip extends StatefulWidget {
  const ThemeChoiceChip({Key? key, required this.appTheme}) : super(key: key);

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
            Text('Theme', style: Theme.of(context).textTheme.titleLarge),
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
  const LengthChoiceChip({Key? key, required this.appPreferences})
    : super(key: key);
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
            //   // child: Row(
            //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   //   children: List.generate(LengthUnit.values.length, (index) {
            //   //     return ChoiceChip(
            //   //       label: Padding(
            //   //         padding: const EdgeInsets.all(4),
            //   //         child: Text(
            //   //           EnumToString.convertToString(LengthUnit.values[index]),
            //   //           style: const TextStyle(
            //   //             // fontSize: 14,
            //   //             fontWeight: FontWeight.bold,
            //   //           ),
            //   //         ),
            //   //       ),
            //   //       // backgroundColor: Colors.red.shade100,
            //   //       // selectedColor: Colors.blueAccent,
            //   //       selectedColor:
            //   //           Theme.of(context).colorScheme.secondaryContainer,
            //   //       // backgroundColor:
            //   //       //     Theme.of(context).colorScheme.onInverseSurface,
            //   //       elevation: 0,
            //   //       pressElevation: 0,
            //   //       selected: currentValue == LengthUnit.values[index],
            //   //       // labelStyle: TextStyle(
            //   //       //   color: currentValue == LengthUnit.values[index]
            //   //       //       ? Colors.white
            //   //       //       : Colors.blueAccent,
            //   //       // ),
            //   //       labelStyle: TextStyle(
            //   //         color: currentValue == LengthUnit.values[index]
            //   //             ? Theme.of(context).colorScheme.onSecondaryContainer
            //   //             : Theme.of(context).colorScheme.primary,
            //   //       ),
            //   //       onSelected: (value) {
            //   //         context.read<ApppreferencesBloc>().add(
            //   //               ApppreferencesEvent.updatePreferences(
            //   //                 appPreferences: AppPreferences(
            //   //                   widget.appPreferences.weightUnit,
            //   //                   LengthUnit.values[index],
            //   //                   widget.appPreferences.lang,
            //   //                 ),
            //   //               ),
            //   //             );
            //   //       },
            //   //     );
            //   //   }),
            //   // ),

            //   child: Center(
            //     child: SegmentedButton<LengthUnit>(
            //       segments: LengthUnit.values
            //           .map(
            //             (e) => ButtonSegment(
            //               value: e,
            //               label: Text(e.name),
            //             ),
            //           )
            //           .toList(),
            //       selected: {currentValue},
            //       onSelectionChanged: (p0) {
            //         context.read<ApppreferencesBloc>().add(
            //               ApppreferencesEvent.updatePreferences(
            //                 appPreferences: AppPreferences(
            //                   widget.appPreferences.weightUnit,
            //                   p0.first,
            //                   widget.appPreferences.lang,
            //                 ),
            //               ),
            //             );
            //       },
            //     ),
            //   ),
            // ),
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
            Text('Time', style: Theme.of(context).textTheme.bodyLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(widget.items.length, (index) {
                return ChoiceChip(
                  label: Text(widget.items[index]),
                  // backgroundColor: Colors.grey.shade100,
                  // selectedColor: Colors.blueAccent,
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
  const LanguageSelector({Key? key, required this.appPreferences})
    : super(key: key);

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
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          DropdownButton<Locale>(
            value: _currentLocale,
            borderRadius: BorderRadius.circular(10),
            underline: const SizedBox.shrink(),
            style: Theme.of(context).textTheme.bodyLarge,
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
              // context.read<ApppreferencesBloc>().add(
              //       ApppreferencesEvent.updatePreferences(
              //         appPreferences: AppPreferences(
              //           widget.appPreferences.weightUnit,
              //           widget.appPreferences.lengthUnit,
              //           _currentLocale.toString().split('.').last,
              //         ),
              //       ),
              //     );
            },
          ),
        ],
      ),
    );
  }
}

class ChartSourceFilterPreferenceSection extends StatefulWidget {
  const ChartSourceFilterPreferenceSection({super.key});

  @override
  State<ChartSourceFilterPreferenceSection> createState() =>
      _ChartSourceFilterPreferenceSectionState();
}

class _ChartSourceFilterPreferenceSectionState
    extends State<ChartSourceFilterPreferenceSection> {
  MeasurementSourceFilter _selectedFilter = MeasurementSourceFilter.manual;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFilter();
  }

  Future<void> _loadFilter() async {
    final selected = await context
        .read<UserPreferencesCubit>()
        .getChartSourceFilter(1);
    if (!mounted) {
      return;
    }
    setState(() {
      _selectedFilter = selected;
      _isLoading = false;
    });
  }

  Future<void> _changeFilter(MeasurementSourceFilter filter) async {
    setState(() {
      _selectedFilter = filter;
    });
    await context.read<UserPreferencesCubit>().setChartSourceFilter(
      userId: 1,
      filter: filter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SettingsChildContainer(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chart Source Filter',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Default filter used by chart views.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            if (_isLoading)
              const LinearProgressIndicator(minHeight: 2)
            else
              SegmentedButton<MeasurementSourceFilter>(
                selected: <MeasurementSourceFilter>{_selectedFilter},
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(
                    value: MeasurementSourceFilter.manual,
                    label: Text('Manual'),
                  ),
                  ButtonSegment(
                    value: MeasurementSourceFilter.estimated,
                    label: Text('Estimated'),
                  ),
                  ButtonSegment(
                    value: MeasurementSourceFilter.both,
                    label: Text('Both'),
                  ),
                ],
                onSelectionChanged: (selection) {
                  if (selection.isEmpty) {
                    return;
                  }
                  _changeFilter(selection.first);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class SettingsChildContainer extends StatelessWidget {
  const SettingsChildContainer({Key? key, required this.child})
    : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.surfaceContainer,
          border: Border.all(color: colorScheme.outlineVariant.withOpacity(.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
