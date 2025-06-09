// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:watcha_body/app/view/app.dart';
import 'package:watcha_body/bootstrap.dart';
import 'package:watcha_body/constants/app_constants.dart';
import 'package:watcha_body/utils/folder_path.dart';

Future<void> main() async {
  final imagesFolderPath = await FolderPath.create(
    imagesFolderName: AppConstants.imagesFolderName,
    thumbnailsFolderName: AppConstants.thumbnailFolderName,
  );

  await bootstrap(
    () => App(
      folderPath: imagesFolderPath,
    ),
  );
}
