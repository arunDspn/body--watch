// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:watcha_body/app/app.dart';
import 'package:watcha_body/bootstrap.dart';
import 'package:watcha_body/services/encryption_service/src/encryption_service.dart';
import 'package:watcha_body/src/rust/frb_generated.dart';

Future<void> main() async {
  // bootstrap(() => const App());

  await RustLib.init();

  // Isolates Setups   // Isolates Setups
  final encryptReceicePort = ReceivePort(
    'EncryptIsolate',
  );
  final decryptReceicePort = ReceivePort(
    'DecryptIsolate',
  );

  final rootIsolateToken = RootIsolateToken.instance!;

  // Creating isolates for encryption and decryption
  final encryptIsolate = await Isolate.spawn(
    EncryptService.encryptPhotosFromBytes,
    [encryptReceicePort.sendPort, rootIsolateToken],
  );
  final decryptIsolate = await Isolate.spawn(
    EncryptService.decryptPhotosFromBytes,
    [decryptReceicePort.sendPort, rootIsolateToken],
  );

  // Receiver Streams
  final encryptRPortDataStream = encryptReceicePort.asBroadcastStream();
  final decryptRPortDataStream = decryptReceicePort.asBroadcastStream();

  // Compelter for send Ports
  final encryptSendPort = await encryptRPortDataStream.first;
  final decryptSendPort = await decryptRPortDataStream.first;

  await bootstrap(
    () => App(
      decryptReceiverStream: decryptRPortDataStream,
      encryptReceiverStream: encryptRPortDataStream,
      decryptSenderPort: decryptSendPort,
      encryptSenderPort: encryptSendPort,
    ),
  );
}
