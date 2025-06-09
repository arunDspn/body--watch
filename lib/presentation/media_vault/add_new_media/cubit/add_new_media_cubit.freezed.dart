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

class _Initial implements AddNewMediaState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddNewMediaState.initial()';
  }
}

/// @nodoc

class _Loading implements AddNewMediaState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddNewMediaState.loading()';
  }
}

/// @nodoc

class _Success implements AddNewMediaState {
  const _Success({required this.savedImage});

  final VaultImage savedImage;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
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
abstract mixin class _$SuccessCopyWith<$Res>
    implements $AddNewMediaStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({VaultImage savedImage});

  $VaultImageCopyWith<$Res> get savedImage;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? savedImage = null,
  }) {
    return _then(_Success(
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

class _Failure implements AddNewMediaState {
  const _Failure(this.failure);

  final String failure;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
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
abstract mixin class _$FailureCopyWith<$Res>
    implements $AddNewMediaStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) =
      __$FailureCopyWithImpl;
  @useResult
  $Res call({String failure});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

  /// Create a copy of AddNewMediaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(_Failure(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
