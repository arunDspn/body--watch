// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_measurement_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteMeasurementState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteMeasurementState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteMeasurementState()';
  }
}

/// @nodoc
class $DeleteMeasurementStateCopyWith<$Res> {
  $DeleteMeasurementStateCopyWith(
      DeleteMeasurementState _, $Res Function(DeleteMeasurementState) __);
}

/// Adds pattern-matching-related methods to [DeleteMeasurementState].
extension DeleteMeasurementStatePatterns on DeleteMeasurementState {
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
    TResult Function(DeleteMeasurementStateInitial value)? initial,
    TResult Function(DeleteMeasurementStateLoading value)? loading,
    TResult Function(DeleteMeasurementStateDeleted value)? deleted,
    TResult Function(DeleteMeasurementStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteMeasurementStateInitial() when initial != null:
        return initial(_that);
      case DeleteMeasurementStateLoading() when loading != null:
        return loading(_that);
      case DeleteMeasurementStateDeleted() when deleted != null:
        return deleted(_that);
      case DeleteMeasurementStateError() when error != null:
        return error(_that);
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
    required TResult Function(DeleteMeasurementStateInitial value) initial,
    required TResult Function(DeleteMeasurementStateLoading value) loading,
    required TResult Function(DeleteMeasurementStateDeleted value) deleted,
    required TResult Function(DeleteMeasurementStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteMeasurementStateInitial():
        return initial(_that);
      case DeleteMeasurementStateLoading():
        return loading(_that);
      case DeleteMeasurementStateDeleted():
        return deleted(_that);
      case DeleteMeasurementStateError():
        return error(_that);
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
    TResult? Function(DeleteMeasurementStateInitial value)? initial,
    TResult? Function(DeleteMeasurementStateLoading value)? loading,
    TResult? Function(DeleteMeasurementStateDeleted value)? deleted,
    TResult? Function(DeleteMeasurementStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteMeasurementStateInitial() when initial != null:
        return initial(_that);
      case DeleteMeasurementStateLoading() when loading != null:
        return loading(_that);
      case DeleteMeasurementStateDeleted() when deleted != null:
        return deleted(_that);
      case DeleteMeasurementStateError() when error != null:
        return error(_that);
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
    TResult Function(String id)? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteMeasurementStateInitial() when initial != null:
        return initial();
      case DeleteMeasurementStateLoading() when loading != null:
        return loading();
      case DeleteMeasurementStateDeleted() when deleted != null:
        return deleted(_that.id);
      case DeleteMeasurementStateError() when error != null:
        return error(_that.message);
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
    required TResult Function(String id) deleted,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteMeasurementStateInitial():
        return initial();
      case DeleteMeasurementStateLoading():
        return loading();
      case DeleteMeasurementStateDeleted():
        return deleted(_that.id);
      case DeleteMeasurementStateError():
        return error(_that.message);
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
    TResult? Function(String id)? deleted,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteMeasurementStateInitial() when initial != null:
        return initial();
      case DeleteMeasurementStateLoading() when loading != null:
        return loading();
      case DeleteMeasurementStateDeleted() when deleted != null:
        return deleted(_that.id);
      case DeleteMeasurementStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DeleteMeasurementStateInitial implements DeleteMeasurementState {
  const DeleteMeasurementStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteMeasurementStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteMeasurementState.initial()';
  }
}

/// @nodoc

class DeleteMeasurementStateLoading implements DeleteMeasurementState {
  const DeleteMeasurementStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteMeasurementStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteMeasurementState.loading()';
  }
}

/// @nodoc

class DeleteMeasurementStateDeleted implements DeleteMeasurementState {
  const DeleteMeasurementStateDeleted(this.id);

  final String id;

  /// Create a copy of DeleteMeasurementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteMeasurementStateDeletedCopyWith<DeleteMeasurementStateDeleted>
      get copyWith => _$DeleteMeasurementStateDeletedCopyWithImpl<
          DeleteMeasurementStateDeleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteMeasurementStateDeleted &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'DeleteMeasurementState.deleted(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteMeasurementStateDeletedCopyWith<$Res>
    implements $DeleteMeasurementStateCopyWith<$Res> {
  factory $DeleteMeasurementStateDeletedCopyWith(
          DeleteMeasurementStateDeleted value,
          $Res Function(DeleteMeasurementStateDeleted) _then) =
      _$DeleteMeasurementStateDeletedCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$DeleteMeasurementStateDeletedCopyWithImpl<$Res>
    implements $DeleteMeasurementStateDeletedCopyWith<$Res> {
  _$DeleteMeasurementStateDeletedCopyWithImpl(this._self, this._then);

  final DeleteMeasurementStateDeleted _self;
  final $Res Function(DeleteMeasurementStateDeleted) _then;

  /// Create a copy of DeleteMeasurementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(DeleteMeasurementStateDeleted(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteMeasurementStateError implements DeleteMeasurementState {
  const DeleteMeasurementStateError(this.message);

  final String message;

  /// Create a copy of DeleteMeasurementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteMeasurementStateErrorCopyWith<DeleteMeasurementStateError>
      get copyWith => _$DeleteMeasurementStateErrorCopyWithImpl<
          DeleteMeasurementStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteMeasurementStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DeleteMeasurementState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DeleteMeasurementStateErrorCopyWith<$Res>
    implements $DeleteMeasurementStateCopyWith<$Res> {
  factory $DeleteMeasurementStateErrorCopyWith(
          DeleteMeasurementStateError value,
          $Res Function(DeleteMeasurementStateError) _then) =
      _$DeleteMeasurementStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DeleteMeasurementStateErrorCopyWithImpl<$Res>
    implements $DeleteMeasurementStateErrorCopyWith<$Res> {
  _$DeleteMeasurementStateErrorCopyWithImpl(this._self, this._then);

  final DeleteMeasurementStateError _self;
  final $Res Function(DeleteMeasurementStateError) _then;

  /// Create a copy of DeleteMeasurementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DeleteMeasurementStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
