// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'back_up_pictures_to_zip_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackUpPicturesToZipState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackUpPicturesToZipState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackUpPicturesToZipState()';
  }
}

/// @nodoc
class $BackUpPicturesToZipStateCopyWith<$Res> {
  $BackUpPicturesToZipStateCopyWith(
      BackUpPicturesToZipState _, $Res Function(BackUpPicturesToZipState) __);
}

/// @nodoc

class BackUpPicturesToZipStateInitial implements BackUpPicturesToZipState {
  const BackUpPicturesToZipStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackUpPicturesToZipStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackUpPicturesToZipState.initial()';
  }
}

/// @nodoc

class BackUpPicturesToZipStateLoading implements BackUpPicturesToZipState {
  const BackUpPicturesToZipStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackUpPicturesToZipStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackUpPicturesToZipState.loading()';
  }
}

/// @nodoc

class BackUpPicturesToZipStateSuccess implements BackUpPicturesToZipState {
  const BackUpPicturesToZipStateSuccess(this.path);

  final String path;

  /// Create a copy of BackUpPicturesToZipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackUpPicturesToZipStateSuccessCopyWith<BackUpPicturesToZipStateSuccess>
      get copyWith => _$BackUpPicturesToZipStateSuccessCopyWithImpl<
          BackUpPicturesToZipStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackUpPicturesToZipStateSuccess &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @override
  String toString() {
    return 'BackUpPicturesToZipState.success(path: $path)';
  }
}

/// @nodoc
abstract mixin class $BackUpPicturesToZipStateSuccessCopyWith<$Res>
    implements $BackUpPicturesToZipStateCopyWith<$Res> {
  factory $BackUpPicturesToZipStateSuccessCopyWith(
          BackUpPicturesToZipStateSuccess value,
          $Res Function(BackUpPicturesToZipStateSuccess) _then) =
      _$BackUpPicturesToZipStateSuccessCopyWithImpl;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$BackUpPicturesToZipStateSuccessCopyWithImpl<$Res>
    implements $BackUpPicturesToZipStateSuccessCopyWith<$Res> {
  _$BackUpPicturesToZipStateSuccessCopyWithImpl(this._self, this._then);

  final BackUpPicturesToZipStateSuccess _self;
  final $Res Function(BackUpPicturesToZipStateSuccess) _then;

  /// Create a copy of BackUpPicturesToZipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
  }) {
    return _then(BackUpPicturesToZipStateSuccess(
      null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class BackUpPicturesToZipStateFailure implements BackUpPicturesToZipState {
  const BackUpPicturesToZipStateFailure(this.message);

  final String message;

  /// Create a copy of BackUpPicturesToZipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackUpPicturesToZipStateFailureCopyWith<BackUpPicturesToZipStateFailure>
      get copyWith => _$BackUpPicturesToZipStateFailureCopyWithImpl<
          BackUpPicturesToZipStateFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackUpPicturesToZipStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'BackUpPicturesToZipState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $BackUpPicturesToZipStateFailureCopyWith<$Res>
    implements $BackUpPicturesToZipStateCopyWith<$Res> {
  factory $BackUpPicturesToZipStateFailureCopyWith(
          BackUpPicturesToZipStateFailure value,
          $Res Function(BackUpPicturesToZipStateFailure) _then) =
      _$BackUpPicturesToZipStateFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$BackUpPicturesToZipStateFailureCopyWithImpl<$Res>
    implements $BackUpPicturesToZipStateFailureCopyWith<$Res> {
  _$BackUpPicturesToZipStateFailureCopyWithImpl(this._self, this._then);

  final BackUpPicturesToZipStateFailure _self;
  final $Res Function(BackUpPicturesToZipStateFailure) _then;

  /// Create a copy of BackUpPicturesToZipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(BackUpPicturesToZipStateFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
