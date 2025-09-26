// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:watcha_body/constants/app_constants.dart';
import 'package:watcha_body/utils/folder_path.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log('onClose(${bloc.runtimeType})');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate(${bloc.runtimeType})');
    super.onCreate(bloc);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // await FlutterWindowManagerPlus.addFlags(
      //     // FlutterWindowManagerPlus.FLAG_SECURE,
      //     );

      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(
          (await getApplicationDocumentsDirectory()).path,
        ),
      );
      Bloc.observer = AppBlocObserver();

      final imagesFolderPath = await FolderPath.create(
        imagesFolderName: AppConstants.imagesFolderName,
        thumbnailsFolderName: AppConstants.thumbnailFolderName,
      );

      Future<Widget> newBuilder() async {
        return RepositoryProvider.value(
          value: imagesFolderPath,
          child: await builder(),
        );
      }

      runApp(await newBuilder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
