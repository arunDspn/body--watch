// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/app_theme_bloc/apptheme_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/data/repositories/app_backup_repository.dart';
import 'package:watcha_body/data/repositories/goals_repository.dart';
import 'package:watcha_body/data/repositories/local_auth_repository_impl.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/repositories/user_profile_repository.dart';
import 'package:watcha_body/data/repositories/user_preference/user_preference_reposiotry.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/auth/i_auth_repository.dart';
import 'package:watcha_body/l10n/arb/app_localizations.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/add_widget/add_widget.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/app_initializer/app_initer.dart';
import 'package:watcha_body/presentation/app_initializer/cubit/get_all_metrics/get_all_metric_units_available_cubit.dart';
import 'package:watcha_body/presentation/app_initializer/cubit/set_user_unit_preferences/set_user_unit_preferences_cubit.dart';
import 'package:watcha_body/presentation/core/controllers/cubit/all_available_targets_cubit.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/presentation/home/charts/bloc/filter_chart_bloc/filterchart_bloc.dart';
import 'package:watcha_body/presentation/home/charts/charts.dart';
import 'package:watcha_body/presentation/home/home.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/delete_measurement_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/getallmeasurments_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/measurement_detailed.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/add_new_media_view.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_image_tag_cubit/add_new_image_tag_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_media_cubit.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/image_tag_cubit/get_all_image_tags_cubit.dart';
import 'package:watcha_body/presentation/media_vault/common/cubits/cubit/get_all_muscle_groups_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/compare_picture_form_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/load_picture_to_compare_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/view/compare_pictures_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_gate_keeper_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_initialization_checker_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/cubit/authenicate_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/cubit/create_password_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/filter_modal/bloc/picture_type_filter_modal_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/back_up_pictures_to_zip_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/lock_gallery_cubit.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/overview/bloc/search_widgets_bloc.dart';
import 'package:watcha_body/presentation/settings/cubits/backup_restore_cubit/backup_data_cubit.dart';
import 'package:watcha_body/presentation/settings/cubits/delete_all_data_cubit/delete_all_data_cubit.dart';
import 'package:watcha_body/presentation/settings/settings_view.dart';
import 'package:watcha_body/presentation/splash/splash_view.dart';
import 'package:watcha_body/services/time_range_service/service.dart';
import 'package:watcha_body/utils/folder_path.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    // required this.folderPath,
  }) : super(key: key);

  // final FolderPath folderPath;

  @override
  Widget build(BuildContext context) {
    final databaseService = DatabaseService();

    const secureStorage = FlutterSecureStorage();

    //

    final IAuthRepository authRepository = LocalAuthRepositoryImpl(
      secureStorage: secureStorage,
    );

    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<FolderPath>.value(
        //   value: folderPath,
        // ),
        // RepositoryProvider<EncryptService>(
        //   create: (context) => encryptService,
        // ),
        // RepositoryProvider<CacheService>(
        //   create: (context) => cacheService,
        // ),
        RepositoryProvider<MeasurementRepository>(
          create: (context) => MeasurementRepository(databaseService),
        ),
        RepositoryProvider<GoalsRepository>(
          create: (context) => GoalsRepository(databaseService),
        ),
        RepositoryProvider<TimeRangeService>(
          create: (context) => TimeRangeService(),
        ),
        RepositoryProvider<BodyPictureRepository>(
          create: (context) {
            return BodyPictureRepository(
              databaseService: databaseService,
              // imagesFolderPath: folderPath.imagesPath,
              // thumbnailsFolderPath: folderPath.thumbnailsPath,
              imagesFolderPath: context.read<FolderPath>().imagesPath,
              thumbnailsFolderPath: context.read<FolderPath>().thumbnailsPath,
            );
          },
        ),
        RepositoryProvider<AppBackupRepository>(
          create: (context) => AppBackupRepository(
            measurementRepository: context.read<MeasurementRepository>(),
            bodyPictureRepository: context.read<BodyPictureRepository>(),
          ),
        ),
        RepositoryProvider<IAuthRepository>.value(value: authRepository),

        // UserPreferenceRepository
        RepositoryProvider<UserPreferenceRepository>(
          create: (context) => UserPreferenceRepository(databaseService),
        ),
        RepositoryProvider<UserProfileRepository>(
          create: (context) => UserProfileRepository(databaseService),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AdddataCubit(MeasurementRepository(DatabaseService())),
          ),
          BlocProvider<GetallwidgetsdataBloc>(
            create: (context) =>
                GetallwidgetsdataBloc(context.read<MeasurementRepository>()),
          ),
          BlocProvider<ChartdataBloc>(
            create: (context) =>
                ChartdataBloc(context.read<MeasurementRepository>()),
          ),
          BlocProvider<ApppreferencesBloc>(
            create: (context) => ApppreferencesBloc(),
          ),
          BlocProvider<AppthemeBloc>(create: (context) => AppthemeBloc()),
          BlocProvider<FilterchartBloc>(create: (context) => FilterchartBloc()),
          BlocProvider<BackupRestoreDataCubit>(
            create: (context) =>
                BackupRestoreDataCubit(context.read<AppBackupRepository>()),
          ),
          BlocProvider<DeleteAllDataCubit>(
            create: (context) =>
                DeleteAllDataCubit(context.read<MeasurementRepository>()),
          ),
          BlocProvider<DeleteMeasurementCubit>(
            create: (context) =>
                DeleteMeasurementCubit(context.read<MeasurementRepository>()),
          ),
          BlocProvider<SearchWidgetsBloc>(
            create: (context) => SearchWidgetsBloc(),
          ),
          BlocProvider(
            create: (context) =>
                LoadPicturesCubit(context.read<BodyPictureRepository>())
                  ..load(),
            // ..load(),
          ),
          BlocProvider(
            create: (context) => PictureTypeFilterModalBloc(
              context.read<BodyPictureRepository>(),
            )..add(const PictureTypeFilterModalEvent.started()),
          ),
          BlocProvider(
            create: (context) =>
                LockGalleryCubit(context.read<BodyPictureRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                BackUpPicturesToZipCubit(context.read<BodyPictureRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                AuthInitializationChecker(authRepository)
                  ..add(const AuthInitializationCheckerEvents.checkAuth()),
          ),
          BlocProvider(create: (context) => AuthenicateCubit(authRepository)),
          BlocProvider(
            create: (context) => CreatePasswordCubit(authRepository),
          ),
          // BlocProvider(
          //   create: (context) => AuthGateCubit()..unauthenicate(),
          //   lazy: false,
          // ),
          BlocProvider(
            create: (context) =>
                AuthGateKeeperBloc()
                  ..add(const AuthGateKeeperEvent.triggerUnAuth()),
            lazy: false,
          ),
          // Cubit for User Preferences
          BlocProvider(
            create: (context) =>
                UserPreferencesCubit(context.read<UserPreferenceRepository>())
                  ..fetchUserPreferences(1),
            lazy: false,
          ),

          BlocProvider<AllAvailableTargetsCubit>(
            create: (context) =>
                AllAvailableTargetsCubit(context.read<MeasurementRepository>())
                  ..fetch(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => GetAllMetricUnitsAvailableCubit(
              context.read<MeasurementRepository>(),
            )..fetchAllMetricUnitsAvailable(),
          ),
          BlocProvider(
            create: (context) => SetUserUnitPreferencesCubit(
              context.read<UserPreferenceRepository>(),
            ),
          ),
          // Image Tag Cubit can be added here if needed globally
          BlocProvider(
            create: (context) => GetAllImageTagsCubit(
              bodyPictureRepository: context.read<BodyPictureRepository>(),
            )..getAllImageTags(),
          ),
          BlocProvider(
            create: (context) => AddNewImageTagCubit(
              bodyPictureRepository: context.read<BodyPictureRepository>(),
            ),
          ),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<ApppreferencesBloc, ApppreferencesState>(
              builder: (context, appPrefState) {
                return BlocBuilder<AppthemeBloc, AppTheme>(
                  builder: (context, stateTheme) {
                    return DynamicColorBuilder(
                      builder: (lightDynamic, darkDynamic) => MaterialApp(
                        themeMode: ThemeMode.system,

                        // darkTheme: ThemeData.dark(
                        //   useMaterial3: true,
                        // ).copyWith(
                        //   colorScheme: darkDynamic,
                        // ),

                        //dark theme with font family
                        // darkTheme: ThemeData(
                        //   // colorScheme: darkDynamic,
                        //   fontFamily: 'Poppins',
                        //   useMaterial3: true,
                        //   brightness: Brightness.dark,
                        // ),
                        darkTheme: ThemeData.dark().copyWith(
                          textTheme: ThemeData.dark().textTheme.apply(
                            fontFamily: 'Poppins',
                          ),
                          colorScheme: darkDynamic,
                        ),

                        // theme: AppThemeData.lightTheme,
                        // darkTheme: AppThemeData.darkTheme,
                        // themeMode: stateTheme == AppTheme.darkTheme
                        //     ? ThemeMode.dark
                        //     : ThemeMode.light,
                        // themeMode: ThemeMode.system,
                        theme: ThemeData(
                          colorScheme: lightDynamic,
                          fontFamily: 'Poppins',
                          useMaterial3: true,
                        ),

                        // darkTheme: ThemeData(
                        //   colorScheme: darkDynamic,
                        //   textTheme: GoogleFonts.poppinsTextTheme(),
                        //   useMaterial3: true,
                        // ),
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          AppLocalizations.delegate,
                        ],
                        supportedLocales: AppLocalizations.supportedLocales,
                        locale: (appPrefState is SavedAndReady)
                            ? Locale(appPrefState.appPreferences.lang)
                            : const Locale('en'),
                        onGenerateRoute: _onGenerateRoutes,
                        initialRoute: '/',
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Route<dynamic>? _onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<void>(builder: (context) => const SplashView());
    case HomeView.routeName:
      return MaterialPageRoute<void>(
        builder: (context) {
          // final appPref =
          //     // context.read<ApppreferencesBloc>().state as SavedAndReady;
          //     context.read<UserPreferencesCubit>().state
          //         as UserPreferencesLoaded;
          // Bloc for overview data
          context.read<GetallwidgetsdataBloc>().add(
            const GetallwidgetsdataEvent.fetchAllData(),
          );

          // Bloc for chart data
          // context.read<ChartdataBloc>().add(
          //       ChartdataEvent.fetchData(
          //         appPreferences: appPref.appPreferences,
          //         duration: DurationsEnum.month1,
          //       ),
          //     );
          return const HomeView();
        },
      );
    case MeasurementInDetail.routeName:
      final _args = settings.arguments;
      if (_args is MeasurementType) {
        return MaterialPageRoute<void>(
          builder: (context) {
            final appPref =
                (context.read<ApppreferencesBloc>().state as SavedAndReady)
                    .appPreferences;
            return BlocProvider(
              create: (context) =>
                  GetSingleMeasurmentsDetailsCubit(
                    context.read<MeasurementRepository>(),
                  )..fetchAllData(
                    type: _args.name,
                    appPreferences: appPref,
                    // durationsEnum: DurationsEnum.month1,
                    // (appPrefWrapperState as SavedAndReady)
                    //     .appPreferences,
                  ),
              child: MeasurementInDetail(measurementType: _args),
            );
          },
        );
      }
      break;
    case AddWidget.routeName:
      return MaterialPageRoute<void>(
        builder: (context) {
          return BlocProvider(
            create: (context) =>
                GetallwidgetsCubit(context.read<MeasurementRepository>()),
            child: const AddWidget(),
          );
        },
      );
    case SettingsView.routeName:
      return MaterialPageRoute<void>(
        builder: (context) => const SettingsView(),
      );
    case AppIniter.routeName:
      return MaterialPageRoute<void>(builder: (context) => const AppIniter());
    // case VaultGalleryView.routeName:
    //   return MaterialPageRoute<void>(
    //     builder: (context) {
    //       return MultiBlocProvider(
    //         providers: [
    //           // BlocProvider(
    //           //   create: (context) => LoadPicturesCubit(
    //           //     context.read<BodyPictureRepository>(),
    //           //   )..load(),
    //           // ),
    //           BlocProvider(
    //             create: (context) => FilteredGalleryImagesCubit(),
    //           ),
    //         ],
    //         child: const VaultGalleryView(),
    //       );
    //     },
    //   );
    case ComparePicturesView.routeName:
      return MaterialPageRoute<void>(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ComparePictureFormCubit()),
            BlocProvider(
              create: (context) => LoadPictureToCompareCubit(
                context.read<BodyPictureRepository>(),
              ),
            ),
          ],
          child: const ComparePicturesView(),
        ),
      );
    case AddNewMediaView.routeName:
      return MaterialPageRoute<void>(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AddNewMediaCubit(context.read<BodyPictureRepository>()),
            ),
            BlocProvider(
              create: (context) =>
                  GetAllMuscleGroupsCubit(context.read<MeasurementRepository>())
                    ..fetchAllMuscleGroups(),
            ),
          ],
          child: const AddNewMediaView(),
        ),
      );
    default:
      return MaterialPageRoute<void>(builder: (context) => const Charts());
  }
  return null;
}
