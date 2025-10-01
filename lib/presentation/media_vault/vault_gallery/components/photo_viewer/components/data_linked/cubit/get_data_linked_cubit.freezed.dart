// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_data_linked_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetDataLinkedState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetDataLinkedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetDataLinkedState()';
  }
}

/// @nodoc
class $GetDataLinkedStateCopyWith<$Res> {
  $GetDataLinkedStateCopyWith(
      GetDataLinkedState _, $Res Function(GetDataLinkedState) __);
}

/// Adds pattern-matching-related methods to [GetDataLinkedState].
extension GetDataLinkedStatePatterns on GetDataLinkedState {
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
    TResult Function(GetDataLinkedStateInitial value)? initial,
    TResult Function(GetDataLinkedStateLoading value)? loading,
    TResult Function(GetDataLinkedStateLoaded value)? loaded,
    TResult Function(GetDataLinkedStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetDataLinkedStateInitial() when initial != null:
        return initial(_that);
      case GetDataLinkedStateLoading() when loading != null:
        return loading(_that);
      case GetDataLinkedStateLoaded() when loaded != null:
        return loaded(_that);
      case GetDataLinkedStateError() when error != null:
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
    required TResult Function(GetDataLinkedStateInitial value) initial,
    required TResult Function(GetDataLinkedStateLoading value) loading,
    required TResult Function(GetDataLinkedStateLoaded value) loaded,
    required TResult Function(GetDataLinkedStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case GetDataLinkedStateInitial():
        return initial(_that);
      case GetDataLinkedStateLoading():
        return loading(_that);
      case GetDataLinkedStateLoaded():
        return loaded(_that);
      case GetDataLinkedStateError():
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
    TResult? Function(GetDataLinkedStateInitial value)? initial,
    TResult? Function(GetDataLinkedStateLoading value)? loading,
    TResult? Function(GetDataLinkedStateLoaded value)? loaded,
    TResult? Function(GetDataLinkedStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case GetDataLinkedStateInitial() when initial != null:
        return initial(_that);
      case GetDataLinkedStateLoading() when loading != null:
        return loading(_that);
      case GetDataLinkedStateLoaded() when loaded != null:
        return loaded(_that);
      case GetDataLinkedStateError() when error != null:
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
    TResult Function(List<Measurement> dataLinked)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetDataLinkedStateInitial() when initial != null:
        return initial();
      case GetDataLinkedStateLoading() when loading != null:
        return loading();
      case GetDataLinkedStateLoaded() when loaded != null:
        return loaded(_that.dataLinked);
      case GetDataLinkedStateError() when error != null:
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
    required TResult Function(List<Measurement> dataLinked) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case GetDataLinkedStateInitial():
        return initial();
      case GetDataLinkedStateLoading():
        return loading();
      case GetDataLinkedStateLoaded():
        return loaded(_that.dataLinked);
      case GetDataLinkedStateError():
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
    TResult? Function(List<Measurement> dataLinked)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case GetDataLinkedStateInitial() when initial != null:
        return initial();
      case GetDataLinkedStateLoading() when loading != null:
        return loading();
      case GetDataLinkedStateLoaded() when loaded != null:
        return loaded(_that.dataLinked);
      case GetDataLinkedStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetDataLinkedStateInitial implements GetDataLinkedState {
  const GetDataLinkedStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDataLinkedStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetDataLinkedState.initial()';
  }
}

/// @nodoc

class GetDataLinkedStateLoading implements GetDataLinkedState {
  const GetDataLinkedStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDataLinkedStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetDataLinkedState.loading()';
  }
}

/// @nodoc

class GetDataLinkedStateLoaded implements GetDataLinkedState {
  const GetDataLinkedStateLoaded({required final List<Measurement> dataLinked})
      : _dataLinked = dataLinked;

  final List<Measurement> _dataLinked;
  List<Measurement> get dataLinked {
    if (_dataLinked is EqualUnmodifiableListView) return _dataLinked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataLinked);
  }

  /// Create a copy of GetDataLinkedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetDataLinkedStateLoadedCopyWith<GetDataLinkedStateLoaded> get copyWith =>
      _$GetDataLinkedStateLoadedCopyWithImpl<GetDataLinkedStateLoaded>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDataLinkedStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._dataLinked, _dataLinked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_dataLinked));

  @override
  String toString() {
    return 'GetDataLinkedState.loaded(dataLinked: $dataLinked)';
  }
}

/// @nodoc
abstract mixin class $GetDataLinkedStateLoadedCopyWith<$Res>
    implements $GetDataLinkedStateCopyWith<$Res> {
  factory $GetDataLinkedStateLoadedCopyWith(GetDataLinkedStateLoaded value,
          $Res Function(GetDataLinkedStateLoaded) _then) =
      _$GetDataLinkedStateLoadedCopyWithImpl;
  @useResult
  $Res call({List<Measurement> dataLinked});
}

/// @nodoc
class _$GetDataLinkedStateLoadedCopyWithImpl<$Res>
    implements $GetDataLinkedStateLoadedCopyWith<$Res> {
  _$GetDataLinkedStateLoadedCopyWithImpl(this._self, this._then);

  final GetDataLinkedStateLoaded _self;
  final $Res Function(GetDataLinkedStateLoaded) _then;

  /// Create a copy of GetDataLinkedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dataLinked = null,
  }) {
    return _then(GetDataLinkedStateLoaded(
      dataLinked: null == dataLinked
          ? _self._dataLinked
          : dataLinked // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
    ));
  }
}

/// @nodoc

class GetDataLinkedStateError implements GetDataLinkedState {
  const GetDataLinkedStateError({required this.message});

  final String message;

  /// Create a copy of GetDataLinkedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetDataLinkedStateErrorCopyWith<GetDataLinkedStateError> get copyWith =>
      _$GetDataLinkedStateErrorCopyWithImpl<GetDataLinkedStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDataLinkedStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'GetDataLinkedState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $GetDataLinkedStateErrorCopyWith<$Res>
    implements $GetDataLinkedStateCopyWith<$Res> {
  factory $GetDataLinkedStateErrorCopyWith(GetDataLinkedStateError value,
          $Res Function(GetDataLinkedStateError) _then) =
      _$GetDataLinkedStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$GetDataLinkedStateErrorCopyWithImpl<$Res>
    implements $GetDataLinkedStateErrorCopyWith<$Res> {
  _$GetDataLinkedStateErrorCopyWithImpl(this._self, this._then);

  final GetDataLinkedStateError _self;
  final $Res Function(GetDataLinkedStateError) _then;

  /// Create a copy of GetDataLinkedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(GetDataLinkedStateError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
