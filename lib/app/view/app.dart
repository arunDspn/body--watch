// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/app/app_theme_bloc/apptheme_bloc.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/repositories/widget_repository.dart';
import 'package:watcha_body/l10n/l10n.dart';
import 'package:watcha_body/presentation/add_data_modal/cubit/adddata_cubit.dart';
import 'package:watcha_body/presentation/add_widget/add_widget.dart';
import 'package:watcha_body/presentation/add_widget/cubit/getallwidgets_cubit.dart';
import 'package:watcha_body/presentation/charts/charts.dart';
import 'package:watcha_body/presentation/measurement_in_detail/cubit/getallmeasurments_cubit.dart';
import 'package:watcha_body/presentation/measurement_in_detail/measurement_detailed.dart';
import 'package:watcha_body/presentation/overview/bloc/getallwidgetsdata_bloc.dart';
import 'package:watcha_body/presentation/overview/overview.dart';
import 'package:watcha_body/presentation/settings/settings_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WidgetRepository>(
          create: (context) => WidgetRepository(DatabaseService()),
        ),
        RepositoryProvider<MeasurementRepository>(
          create: (context) => MeasurementRepository(DatabaseService()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AdddataCubit(
              MeasurementRepository(DatabaseService()),
              //TODO: Reuse
              WidgetRepository(DatabaseService()),
            ),
          ),
          BlocProvider<GetallwidgetsdataBloc>(
            create: (context) => GetallwidgetsdataBloc(
              context.read<WidgetRepository>(),
              context.read<MeasurementRepository>(),
            )..add(const GetallwidgetsdataEvent.fetchAllData()),
          ),
          BlocProvider<ApppreferencesBloc>(
            create: (context) => ApppreferencesBloc(),
          ),
          BlocProvider<AppthemeBloc>(
            create: (context) => AppthemeBloc(),
          ),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<ApppreferencesBloc, AppPreferences>(
              builder: (context, appPrefState) {
                return BlocBuilder<AppthemeBloc, AppTheme>(
                  builder: (context, stateTheme) {
                    return MaterialApp(
                      theme: lightTheme,
                      darkTheme: darkTheme,
                      themeMode: stateTheme == AppTheme.darkTheme
                          ? ThemeMode.dark
                          : ThemeMode.light,
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        // AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                      ],
                      onGenerateRoute: (settings) {
                        switch (settings.name) {
                          case '/':
                            return MaterialPageRoute<void>(
                              builder: (context) => const OverView(),
                            );
                          case MeasurementInDetail.routeName:
                            final _args = settings.arguments;
                            if (_args is MeasurementWidget) {
                              return MaterialPageRoute<void>(
                                builder: (context) => BlocProvider(
                                  create: (context) => GetallmeasurmentsCubit(
                                    context.read<MeasurementRepository>(),
                                  )..fetchAllData(
                                      tableName: _args.tableName,
                                    ),
                                  child: MeasurementInDetail(
                                    measurementWidget: _args,
                                  ),
                                ),
                              );
                            }
                            break;
                          case AddWidget.routeName:
                            return MaterialPageRoute<void>(
                              builder: (context) {
                                return BlocProvider<GetallwidgetsCubit>(
                                  create: (context) => GetallwidgetsCubit(
                                    context.read<WidgetRepository>(),
                                  )..fetch(),
                                  child: const AddWidget(),
                                );
                              },
                            );

                          case SettingsView.routeName:
                            return MaterialPageRoute<void>(
                              builder: (context) => const SettingsView(),
                            );
                          default:
                            return MaterialPageRoute<void>(
                              builder: (context) => const Charts(),
                            );
                        }
                      },
                      home: const OverView(),
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

final lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  scaffoldBackgroundColor: Colors.grey.shade100,
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red,
    primary: Colors.blue,
    onPrimaryContainer: Colors.white,
    secondaryContainer: Colors.white,
    secondary: Colors.black54,
  ),
  fontFamily: GoogleFonts.inter(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.red,
    ),
    color: Colors.amber,
  ).fontFamily,
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    headline2: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      color: Colors.black54,
    ),
    headline5: TextStyle(
      fontSize: 16,
    ),
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 0, 0, 0),
  ),
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red,
    primary: Colors.blue,
    secondary: Colors.white60,
    secondaryContainer: Colors.black87,
    onPrimaryContainer: const Color.fromARGB(255, 53, 53, 53),
  ),
  fontFamily: GoogleFonts.inter(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    color: Colors.amber,
  ).fontFamily,
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    labelStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    headline2: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      color: Colors.white60,
    ),
    headline5: TextStyle(
      fontSize: 16,
      color: Colors.white60,
    ),
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
