// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [BackUpPicturesToZipState].
extension BackUpPicturesToZipStatePatterns on BackUpPicturesToZipState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BackUpPicturesToZipStateInitial value)? initial,
    TResult Function(BackUpPicturesToZipStateLoading value)? loading,
    TResult Function(BackUpPicturesToZipStateSuccess value)? success,
    TResult Function(BackUpPicturesToZipStateFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BackUpPicturesToZipStateInitial() when initial != null:
        return initial(_that);
      case BackUpPicturesToZipStateLoading() when loading != null:
        return loading(_that);
      case BackUpPicturesToZipStateSuccess() when success != null:
        return success(_that);
      case BackUpPicturesToZipStateFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BackUpPicturesToZipStateInitial value) initial,
    required TResult Function(BackUpPicturesToZipStateLoading value) loading,
    required TResult Function(BackUpPicturesToZipStateSuccess value) success,
    required TResult Function(BackUpPicturesToZipStateFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case BackUpPicturesToZipStateInitial():
        return initial(_that);
      case BackUpPicturesToZipStateLoading():
        return loading(_that);
      case BackUpPicturesToZipStateSuccess():
        return success(_that);
      case BackUpPicturesToZipStateFailure():
        return failure(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BackUpPicturesToZipStateInitial value)? initial,
    TResult? Function(BackUpPicturesToZipStateLoading value)? loading,
    TResult? Function(BackUpPicturesToZipStateSuccess value)? success,
    TResult? Function(BackUpPicturesToZipStateFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case BackUpPicturesToZipStateInitial() when initial != null:
        return initial(_that);
      case BackUpPicturesToZipStateLoading() when loading != null:
        return loading(_that);
      case BackUpPicturesToZipStateSuccess() when success != null:
        return success(_that);
      case BackUpPicturesToZipStateFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BackUpPicturesToZipStateInitial() when initial != null:
        return initial();
      case BackUpPicturesToZipStateLoading() when loading != null:
        return loading();
      case BackUpPicturesToZipStateSuccess() when success != null:
        return success(_that.path);
      case BackUpPicturesToZipStateFailure() when failure != null:
        return failure(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String path) success,
    required TResult Function(String message) failure,
  }) {
    final _that = this;
    switch (_that) {
      case BackUpPicturesToZipStateInitial():
        return initial();
      case BackUpPicturesToZipStateLoading():
        return loading();
      case BackUpPicturesToZipStateSuccess():
        return success(_that.path);
      case BackUpPicturesToZipStateFailure():
        return failure(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String path)? success,
    TResult? Function(String message)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case BackUpPicturesToZipStateInitial() when initial != null:
        return initial();
      case BackUpPicturesToZipStateLoading() when loading != null:
        return loading();
      case BackUpPicturesToZipStateSuccess() when success != null:
        return success(_that.path);
      case BackUpPicturesToZipStateFailure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
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
