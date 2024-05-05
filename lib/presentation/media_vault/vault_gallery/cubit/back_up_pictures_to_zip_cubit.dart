import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'back_up_pictures_to_zip_state.dart';
part 'back_up_pictures_to_zip_cubit.freezed.dart';

class BackUpPicturesToZipCubit extends Cubit<BackUpPicturesToZipState> {
  BackUpPicturesToZipCubit(this.bodyPictureRepository)
      : super(const BackUpPicturesToZipState.initial());

  final BodyPictureRepository bodyPictureRepository;

  Future<void> backupPictures() async {
    emit(const BackUpPicturesToZipState.loading());

    // Permissions
    final permissionStatus = await _checkPermission(false);
    if (!permissionStatus.isGranted) {
      final newP = await _requestPermission(false);
      if (!newP.isGranted) {
        emit(
          const BackUpPicturesToZipState.failure('Permission Scene ann Mone'),
        );
      }
    }

    // 3 sec lag
    // await Future.delayed(const Duration(seconds: 3));

    final result = await bodyPictureRepository.backupPhotosToZip();

    result.fold(
      (l) => emit(BackUpPicturesToZipState.failure(l)),
      (r) => emit(BackUpPicturesToZipState.success(r)),
    );

    // emit(const BackUpPicturesToZipState.success());

    // failed
    // emit(const BackUpPicturesToZipState.failed());
  }
}

Future<PermissionStatus> _checkPermission(bool ios) async {
  if (ios) {
    return Permission.mediaLibrary.status;
  } else {
    return Permission.manageExternalStorage.status;
  }
}

Future<PermissionStatus> _requestPermission(bool ios) async {
  if (ios) {
    return Permission.manageExternalStorage.request();
  } else {
    return Permission.manageExternalStorage.request();
  }
}
