import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/presentation/app_initializer/app_initer.dart';
import 'package:watcha_body/presentation/home/home.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<ApppreferencesBloc>().state.maybeMap(
          orElse: () {
            Navigator.of(context).pushReplacementNamed(AppIniter.routeName);
          },
          savedAndReady: (value) {
            Navigator.of(context).pushReplacementNamed(HomeView.routeName);
          },
        );
      },
    );

    return const Scaffold(
      body: Center(child: Text('Splash')),
    );
  }
}
