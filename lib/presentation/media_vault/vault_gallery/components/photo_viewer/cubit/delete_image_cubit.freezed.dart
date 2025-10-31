// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_image_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteImageState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteImageState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteImageState()';
  }
}

/// @nodoc
class $DeleteImageStateCopyWith<$Res> {
  $DeleteImageStateCopyWith(
      DeleteImageState _, $Res Function(DeleteImageState) __);
}

/// Adds pattern-matching-related methods to [DeleteImageState].
extension DeleteImageStatePatterns on DeleteImageState {
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
    TResult Function(DeleteImageStateInitial value)? initial,
    TResult Function(DeleteImageStateLoading value)? loading,
    TResult Function(DeleteImageStateSuccess value)? success,
    TResult Function(DeleteImageStateFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteImageStateInitial() when initial != null:
        return initial(_that);
      case DeleteImageStateLoading() when loading != null:
        return loading(_that);
      case DeleteImageStateSuccess() when success != null:
        return success(_that);
      case DeleteImageStateFailed() when failed != null:
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
    required TResult Function(DeleteImageStateInitial value) initial,
    required TResult Function(DeleteImageStateLoading value) loading,
    required TResult Function(DeleteImageStateSuccess value) success,
    required TResult Function(DeleteImageStateFailed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteImageStateInitial():
        return initial(_that);
      case DeleteImageStateLoading():
        return loading(_that);
      case DeleteImageStateSuccess():
        return success(_that);
      case DeleteImageStateFailed():
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
    TResult? Function(DeleteImageStateInitial value)? initial,
    TResult? Function(DeleteImageStateLoading value)? loading,
    TResult? Function(DeleteImageStateSuccess value)? success,
    TResult? Function(DeleteImageStateFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteImageStateInitial() when initial != null:
        return initial(_that);
      case DeleteImageStateLoading() when loading != null:
        return loading(_that);
      case DeleteImageStateSuccess() when success != null:
        return success(_that);
      case DeleteImageStateFailed() when failed != null:
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
    TResult Function()? loading,
    TResult Function(int deletedItemId)? success,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DeleteImageStateInitial() when initial != null:
        return initial();
      case DeleteImageStateLoading() when loading != null:
        return loading();
      case DeleteImageStateSuccess() when success != null:
        return success(_that.deletedItemId);
      case DeleteImageStateFailed() when failed != null:
        return failed(_that.message);
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
    required TResult Function(int deletedItemId) success,
    required TResult Function(String message) failed,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteImageStateInitial():
        return initial();
      case DeleteImageStateLoading():
        return loading();
      case DeleteImageStateSuccess():
        return success(_that.deletedItemId);
      case DeleteImageStateFailed():
        return failed(_that.message);
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
    TResult? Function(int deletedItemId)? success,
    TResult? Function(String message)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case DeleteImageStateInitial() when initial != null:
        return initial();
      case DeleteImageStateLoading() when loading != null:
        return loading();
      case DeleteImageStateSuccess() when success != null:
        return success(_that.deletedItemId);
      case DeleteImageStateFailed() when failed != null:
        return failed(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DeleteImageStateInitial implements DeleteImageState {
  const DeleteImageStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteImageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteImageState.initial()';
  }
}

/// @nodoc

class DeleteImageStateLoading implements DeleteImageState {
  const DeleteImageStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteImageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteImageState.loading()';
  }
}

/// @nodoc

class DeleteImageStateSuccess implements DeleteImageState {
  const DeleteImageStateSuccess({required this.deletedItemId});

  final int deletedItemId;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteImageStateSuccessCopyWith<DeleteImageStateSuccess> get copyWith =>
      _$DeleteImageStateSuccessCopyWithImpl<DeleteImageStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteImageStateSuccess &&
            (identical(other.deletedItemId, deletedItemId) ||
                other.deletedItemId == deletedItemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deletedItemId);

  @override
  String toString() {
    return 'DeleteImageState.success(deletedItemId: $deletedItemId)';
  }
}

/// @nodoc
abstract mixin class $DeleteImageStateSuccessCopyWith<$Res>
    implements $DeleteImageStateCopyWith<$Res> {
  factory $DeleteImageStateSuccessCopyWith(DeleteImageStateSuccess value,
          $Res Function(DeleteImageStateSuccess) _then) =
      _$DeleteImageStateSuccessCopyWithImpl;
  @useResult
  $Res call({int deletedItemId});
}

/// @nodoc
class _$DeleteImageStateSuccessCopyWithImpl<$Res>
    implements $DeleteImageStateSuccessCopyWith<$Res> {
  _$DeleteImageStateSuccessCopyWithImpl(this._self, this._then);

  final DeleteImageStateSuccess _self;
  final $Res Function(DeleteImageStateSuccess) _then;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? deletedItemId = null,
  }) {
    return _then(DeleteImageStateSuccess(
      deletedItemId: null == deletedItemId
          ? _self.deletedItemId
          : deletedItemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class DeleteImageStateFailed implements DeleteImageState {
  const DeleteImageStateFailed(this.message);

  final String message;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteImageStateFailedCopyWith<DeleteImageStateFailed> get copyWith =>
      _$DeleteImageStateFailedCopyWithImpl<DeleteImageStateFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteImageStateFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DeleteImageState.failed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DeleteImageStateFailedCopyWith<$Res>
    implements $DeleteImageStateCopyWith<$Res> {
  factory $DeleteImageStateFailedCopyWith(DeleteImageStateFailed value,
          $Res Function(DeleteImageStateFailed) _then) =
      _$DeleteImageStateFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DeleteImageStateFailedCopyWithImpl<$Res>
    implements $DeleteImageStateFailedCopyWith<$Res> {
  _$DeleteImageStateFailedCopyWithImpl(this._self, this._then);

  final DeleteImageStateFailed _self;
  final $Res Function(DeleteImageStateFailed) _then;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DeleteImageStateFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
