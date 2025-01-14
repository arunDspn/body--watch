import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/presentation/app_initializer/app_initer.dart';
import 'package:watcha_body/presentation/home/home.dart';
import 'package:watcha_body/src/rust/api/crypter.dart';

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

// const keyTerm = 'blablakey';

// Future<void> _checkKeyOrBuild() async {
//   final key = await const FlutterSecureStorage().read(key: keyTerm);

//   if (key == null || key.isEmpty) {
//     log('key is not exist, build new key');
//     final key = await makeKey();

//     await const FlutterSecureStorage()
//         .write(key: keyTerm, value: String.fromCharCodes(key));
//   }
//   log(' NOw key is exist, no need to build new key');
// }
