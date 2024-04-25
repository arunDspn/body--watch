part of 'lock_gallery_cubit.dart';

@freezed
class LockGalleryState with _$LockGalleryState {
  const factory LockGalleryState.locked() = _Locked;
  const factory LockGalleryState.unlocked() = _Unlocked;
  const factory LockGalleryState.initial() = _Initial;
}
