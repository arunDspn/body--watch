part of 'lock_gallery_cubit.dart';

@freezed
sealed class LockGalleryState with _$LockGalleryState {
  const factory LockGalleryState.locked() = LockGalleryStateLocked;
  const factory LockGalleryState.unlocked() = LockGalleryStateUnlocked;
  const factory LockGalleryState.initial() = LockGalleryStateInitial;
}
