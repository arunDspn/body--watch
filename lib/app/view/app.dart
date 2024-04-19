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
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/app_theme_bloc/apptheme_bloc.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/l10n/l10n.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/add_widget/add_widget.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/app_initializer/app_initer.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';
import 'package:watcha_body/presentation/home/charts/bloc/filter_chart_bloc/filterchart_bloc.dart';
import 'package:watcha_body/presentation/home/charts/charts.dart';
import 'package:watcha_body/presentation/home/home.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/delete_measurement_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/getallmeasurments_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/measurement_detailed.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/add_new_media_view.dart';
import 'package:watcha_body/presentation/media_vault/add_new_media/cubit/add_new_media_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/compare_picture_form_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/cubit/load_picture_to_compare_cubit.dart';
import 'package:watcha_body/presentation/media_vault/compare_pictures/view/compare_pictures_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/filter_modal/bloc/picture_type_filter_modal_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/filtered_gallery_images_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/load_pictures_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/vault_gallery_view.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/overview/bloc/search_widgets_bloc.dart';
import 'package:watcha_body/presentation/overview/overview.dart';
import 'package:watcha_body/presentation/settings/cubits/backup_restore_cubit/backup_data_cubit.dart';
import 'package:watcha_body/presentation/settings/cubits/delete_all_data_cubit/delete_all_data_cubit.dart';
import 'package:watcha_body/presentation/settings/settings_view.dart';
import 'package:watcha_body/presentation/splash/splash_view.dart';
import 'package:watcha_body/services/time_range_service/service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final databaseService = DatabaseService();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MeasurementRepository>(
          create: (context) => MeasurementRepository(databaseService),
        ),
        RepositoryProvider<TimeRangeService>(
          create: (context) => TimeRangeService(),
        ),
        RepositoryProvider<BodyPictureRepository>(
          create: (context) =>
              BodyPictureRepository(databaseService: databaseService),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AdddataCubit(
              MeasurementRepository(DatabaseService()),
            ),
          ),
          BlocProvider<GetallwidgetsdataBloc>(
            create: (context) => GetallwidgetsdataBloc(
              context.read<MeasurementRepository>(),
            ),
          ),
          BlocProvider<ChartdataBloc>(
            create: (context) => ChartdataBloc(
              context.read<MeasurementRepository>(),
            ),
          ),
          BlocProvider<ApppreferencesBloc>(
            create: (context) => ApppreferencesBloc(),
          ),
          BlocProvider<AppthemeBloc>(
            create: (context) => AppthemeBloc(),
          ),
          BlocProvider<FilterchartBloc>(
            create: (context) => FilterchartBloc(),
          ),
          BlocProvider<BackupRestoreDataCubit>(
            create: (context) => BackupRestoreDataCubit(
              context.read<MeasurementRepository>(),
            ),
          ),
          BlocProvider<DeleteAllDataCubit>(
            create: (context) => DeleteAllDataCubit(
              context.read<MeasurementRepository>(),
            ),
          ),
          BlocProvider<DeleteMeasurementCubit>(
            create: (context) => DeleteMeasurementCubit(
              context.read<MeasurementRepository>(),
            ),
          ),
          BlocProvider<SearchWidgetsBloc>(
            create: (context) => SearchWidgetsBloc(),
          ),
          BlocProvider(
            create: (context) =>
                LoadPicturesCubit(context.read<BodyPictureRepository>())
                  ..load(),
          ),

          BlocProvider(
            create: (context) => PictureTypeFilterModalBloc(
              context.read<BodyPictureRepository>(),
            )..add(
                const PictureTypeFilterModalEvent.started(),
              ),
          ),
          // BlocProvider(
          //   create: (context) => PictureTypeFilterModalBloc(
          //     context.read<BodyPictureRepository>(),
          //   )..add(const PictureTypeFilterModalEvent.started()),
          // ),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<ApppreferencesBloc, ApppreferencesState>(
              builder: (context, appPrefState) {
                return BlocBuilder<AppthemeBloc, AppTheme>(
                  builder: (context, stateTheme) {
                    return DynamicColorBuilder(
                      builder: (lightDynamic, darkDynamic) => MaterialApp(
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
      return MaterialPageRoute<void>(
        builder: (context) => const SplashView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute<void>(
        builder: (context) {
          final appPref =
              context.read<ApppreferencesBloc>().state as SavedAndReady;
          // Bloc for overview data
          context.read<GetallwidgetsdataBloc>().add(
                GetallwidgetsdataEvent.fetchAllData(
                  appPreferences: appPref.appPreferences,
                ),
              );

          // Bloc for chart data
          context.read<ChartdataBloc>().add(
                ChartdataEvent.fetchData(
                  appPreferences: appPref.appPreferences,
                  duration: DurationsEnum.month1,
                ),
              );
          return const OverView();
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
              create: (context) => GetSingleMeasurmentsDetailsCubit(
                context.read<MeasurementRepository>(),
              )..fetchAllData(
                  type: _args.name,
                  appPreferences: appPref,
                  // durationsEnum: DurationsEnum.month1,
                  // (appPrefWrapperState as SavedAndReady)
                  //     .appPreferences,
                ),
              child: MeasurementInDetail(
                measurementType: _args,
              ),
            );
          },
        );
      }
      break;
    case AddWidget.routeName:
      return MaterialPageRoute<void>(
        builder: (context) {
          return BlocProvider<GetallwidgetsCubit>(
            create: (context) => GetallwidgetsCubit(
              context.read<MeasurementRepository>(),
            )..fetch(),
            child: const AddWidget(),
          );
        },
      );
    case SettingsView.routeName:
      return MaterialPageRoute<void>(
        builder: (context) => const SettingsView(),
      );
    case AppIniter.routeName:
      return MaterialPageRoute<void>(
        builder: (context) => const AppIniter(),
      );
    case VaultGallery.routeName:
      return MaterialPageRoute<void>(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              // BlocProvider(
              //   create: (context) => LoadPicturesCubit(
              //     context.read<BodyPictureRepository>(),
              //   )..load(),
              // ),
              BlocProvider(
                create: (context) => FilteredGalleryImagesCubit(),
              ),
            ],
            child: const VaultGallery(),
          );
        },
      );
    case ComparePicturesView.routeName:
      return MaterialPageRoute<void>(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ComparePictureFormCubit(),
            ),
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
        builder: (context) => BlocProvider(
          create: (context) =>
              AddNewMediaCubit(context.read<BodyPictureRepository>()),
          child: const AddNewMediaView(),
        ),
      );
    default:
      return MaterialPageRoute<void>(
        builder: (context) => const Charts(),
      );
  }
  return null;
}
