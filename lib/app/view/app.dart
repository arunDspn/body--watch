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
import 'package:watcha_body/data/data_layer/database_service.dart';
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
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
                colorScheme: ColorScheme.fromSwatch(
                  accentColor: const Color(0xFF13B9FF),
                ),
                fontFamily: GoogleFonts.inter(
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ).fontFamily,
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none,
                ),
                //   textTheme: const TextTheme().copyWith(
                //     titleMedium: const TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     bodyText1: const TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w600,
                //     ),
                //     bodyText2: const TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.blue,
                //     ),
                //   ),
              ),
              // darkTheme: ThemeData.dark(),
              // themeMode: ThemeMode.dark,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute<void>(
                      builder: (context) => const Charts(),
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
                  default:
                    return MaterialPageRoute<void>(
                      builder: (context) => const Charts(),
                    );
                }
              },
              home: const OverView(),
            );
          },
        ),
      ),
    );
  }
}
