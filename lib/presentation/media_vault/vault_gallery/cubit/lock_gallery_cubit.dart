import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'lock_gallery_state.dart';
part 'lock_gallery_cubit.freezed.dart';

class LockGalleryCubit extends Cubit<LockGalleryState> {
  LockGalleryCubit(this.bodyPictureRepository)
      : super(const LockGalleryState.unlocked());

  final BodyPictureRepository bodyPictureRepository;

  void unlock() => emit(const LockGalleryState.unlocked());
  Future<void> lock() async {
    final result = await bodyPictureRepository.clearLocalCache();

    result.fold(
      (failure) {
        debugPrint(failure);
      },
      (_) => emit(const LockGalleryState.locked()),
    );

    // emit(const LockGalleryState.locked());
  }
}
