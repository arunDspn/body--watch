// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_new_media_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddNewMediaState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddNewMediaState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddNewMediaState()';
  }
}

/// @nodoc
class $AddNewMediaStateCopyWith<$Res> {
  $AddNewMediaStateCopyWith(
      AddNewMediaState _, $Res Function(AddNewMediaState) __);
}

/// @nodoc

class AddNewMediaStateInitial implements AddNewMediaState {
  const AddNewMediaStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddNewMediaStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddNewMediaState.initial()';
  }
}

/// @nodoc

class AddNewMediaStateLoading implements AddNewMediaState {
  const AddNewMediaStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddNewMediaStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddNewMediaState.loading()';
  }
}

/// @nodoc

class AddNewMediaStateSuccess implements AddNewMediaState {
  const AddNewMediaStateSuccess({required this.savedImage});

  final VaultImage savedImage;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddNewMediaStateSuccessCopyWith<AddNewMediaStateSuccess> get copyWith =>
      _$AddNewMediaStateSuccessCopyWithImpl<AddNewMediaStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddNewMediaStateSuccess &&
            (identical(other.savedImage, savedImage) ||
                other.savedImage == savedImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, savedImage);

  @override
  String toString() {
    return 'AddNewMediaState.success(savedImage: $savedImage)';
  }
}

/// @nodoc
abstract mixin class $AddNewMediaStateSuccessCopyWith<$Res>
    implements $AddNewMediaStateCopyWith<$Res> {
  factory $AddNewMediaStateSuccessCopyWith(AddNewMediaStateSuccess value,
          $Res Function(AddNewMediaStateSuccess) _then) =
      _$AddNewMediaStateSuccessCopyWithImpl;
  @useResult
  $Res call({VaultImage savedImage});

  $VaultImageCopyWith<$Res> get savedImage;
}

/// @nodoc
class _$AddNewMediaStateSuccessCopyWithImpl<$Res>
    implements $AddNewMediaStateSuccessCopyWith<$Res> {
  _$AddNewMediaStateSuccessCopyWithImpl(this._self, this._then);

  final AddNewMediaStateSuccess _self;
  final $Res Function(AddNewMediaStateSuccess) _then;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? savedImage = null,
  }) {
    return _then(AddNewMediaStateSuccess(
      savedImage: null == savedImage
          ? _self.savedImage
          : savedImage // ignore: cast_nullable_to_non_nullable
              as VaultImage,
    ));
  }

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VaultImageCopyWith<$Res> get savedImage {
    return $VaultImageCopyWith<$Res>(_self.savedImage, (value) {
      return _then(_self.copyWith(savedImage: value));
    });
  }
}

/// @nodoc

class AddNewMediaStateFailure implements AddNewMediaState {
  const AddNewMediaStateFailure(this.failure);

  final String failure;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddNewMediaStateFailureCopyWith<AddNewMediaStateFailure> get copyWith =>
      _$AddNewMediaStateFailureCopyWithImpl<AddNewMediaStateFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddNewMediaStateFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'AddNewMediaState.failure(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $AddNewMediaStateFailureCopyWith<$Res>
    implements $AddNewMediaStateCopyWith<$Res> {
  factory $AddNewMediaStateFailureCopyWith(AddNewMediaStateFailure value,
          $Res Function(AddNewMediaStateFailure) _then) =
      _$AddNewMediaStateFailureCopyWithImpl;
  @useResult
  $Res call({String failure});
}

/// @nodoc
class _$AddNewMediaStateFailureCopyWithImpl<$Res>
    implements $AddNewMediaStateFailureCopyWith<$Res> {
  _$AddNewMediaStateFailureCopyWithImpl(this._self, this._then);

  final AddNewMediaStateFailure _self;
  final $Res Function(AddNewMediaStateFailure) _then;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(AddNewMediaStateFailure(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
