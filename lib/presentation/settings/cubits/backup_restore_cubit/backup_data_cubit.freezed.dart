// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackupRestoreDataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackupRestoreDataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState()';
  }
}

/// @nodoc
class $BackupRestoreDataStateCopyWith<$Res> {
  $BackupRestoreDataStateCopyWith(
      BackupRestoreDataState _, $Res Function(BackupRestoreDataState) __);
}

/// Adds pattern-matching-related methods to [BackupRestoreDataState].
extension BackupRestoreDataStatePatterns on BackupRestoreDataState {
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
    TResult Function(BackupRestoreDataStateInitial value)? initial,
    TResult Function(BackupRestoreDataStateSuccess value)? success,
    TResult Function(BackupRestoreDataStateLoading value)? loading,
    TResult Function(BackupRestoreDataStateFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BackupRestoreDataStateInitial() when initial != null:
        return initial(_that);
      case BackupRestoreDataStateSuccess() when success != null:
        return success(_that);
      case BackupRestoreDataStateLoading() when loading != null:
        return loading(_that);
      case BackupRestoreDataStateFailed() when failed != null:
        return failed(_that);
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
    required TResult Function(BackupRestoreDataStateInitial value) initial,
    required TResult Function(BackupRestoreDataStateSuccess value) success,
    required TResult Function(BackupRestoreDataStateLoading value) loading,
    required TResult Function(BackupRestoreDataStateFailed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case BackupRestoreDataStateInitial():
        return initial(_that);
      case BackupRestoreDataStateSuccess():
        return success(_that);
      case BackupRestoreDataStateLoading():
        return loading(_that);
      case BackupRestoreDataStateFailed():
        return failed(_that);
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
    TResult? Function(BackupRestoreDataStateInitial value)? initial,
    TResult? Function(BackupRestoreDataStateSuccess value)? success,
    TResult? Function(BackupRestoreDataStateLoading value)? loading,
    TResult? Function(BackupRestoreDataStateFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case BackupRestoreDataStateInitial() when initial != null:
        return initial(_that);
      case BackupRestoreDataStateSuccess() when success != null:
        return success(_that);
      case BackupRestoreDataStateLoading() when loading != null:
        return loading(_that);
      case BackupRestoreDataStateFailed() when failed != null:
        return failed(_that);
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
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function(String msg)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BackupRestoreDataStateInitial() when initial != null:
        return initial();
      case BackupRestoreDataStateSuccess() when success != null:
        return success();
      case BackupRestoreDataStateLoading() when loading != null:
        return loading();
      case BackupRestoreDataStateFailed() when failed != null:
        return failed(_that.msg);
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
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function(String msg) failed,
  }) {
    final _that = this;
    switch (_that) {
      case BackupRestoreDataStateInitial():
        return initial();
      case BackupRestoreDataStateSuccess():
        return success();
      case BackupRestoreDataStateLoading():
        return loading();
      case BackupRestoreDataStateFailed():
        return failed(_that.msg);
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
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function(String msg)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case BackupRestoreDataStateInitial() when initial != null:
        return initial();
      case BackupRestoreDataStateSuccess() when success != null:
        return success();
      case BackupRestoreDataStateLoading() when loading != null:
        return loading();
      case BackupRestoreDataStateFailed() when failed != null:
        return failed(_that.msg);
      case _:
        return null;
    }
  }
}

/// @nodoc

class BackupRestoreDataStateInitial implements BackupRestoreDataState {
  const BackupRestoreDataStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState.initial()';
  }
}

/// @nodoc

class BackupRestoreDataStateSuccess implements BackupRestoreDataState {
  const BackupRestoreDataStateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState.success()';
  }
}

/// @nodoc

class BackupRestoreDataStateLoading implements BackupRestoreDataState {
  const BackupRestoreDataStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState.loading()';
  }
}

/// @nodoc

class BackupRestoreDataStateFailed implements BackupRestoreDataState {
  const BackupRestoreDataStateFailed(this.msg);

  final String msg;

  /// Create a copy of BackupRestoreDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackupRestoreDataStateFailedCopyWith<BackupRestoreDataStateFailed>
      get copyWith => _$BackupRestoreDataStateFailedCopyWithImpl<
          BackupRestoreDataStateFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateFailed &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @override
  String toString() {
    return 'BackupRestoreDataState.failed(msg: $msg)';
  }
}

/// @nodoc
abstract mixin class $BackupRestoreDataStateFailedCopyWith<$Res>
    implements $BackupRestoreDataStateCopyWith<$Res> {
  factory $BackupRestoreDataStateFailedCopyWith(
          BackupRestoreDataStateFailed value,
          $Res Function(BackupRestoreDataStateFailed) _then) =
      _$BackupRestoreDataStateFailedCopyWithImpl;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$BackupRestoreDataStateFailedCopyWithImpl<$Res>
    implements $BackupRestoreDataStateFailedCopyWith<$Res> {
  _$BackupRestoreDataStateFailedCopyWithImpl(this._self, this._then);

  final BackupRestoreDataStateFailed _self;
  final $Res Function(BackupRestoreDataStateFailed) _then;

  /// Create a copy of BackupRestoreDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? msg = null,
  }) {
    return _then(BackupRestoreDataStateFailed(
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
