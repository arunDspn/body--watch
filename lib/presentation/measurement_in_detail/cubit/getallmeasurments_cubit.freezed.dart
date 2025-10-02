// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getallmeasurments_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetSingleMeasurmentsDetailsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSingleMeasurmentsDetailsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetSingleMeasurmentsDetailsState()';
  }
}

/// @nodoc
class $GetSingleMeasurmentsDetailsStateCopyWith<$Res> {
  $GetSingleMeasurmentsDetailsStateCopyWith(GetSingleMeasurmentsDetailsState _,
      $Res Function(GetSingleMeasurmentsDetailsState) __);
}

/// Adds pattern-matching-related methods to [GetSingleMeasurmentsDetailsState].
extension GetSingleMeasurmentsDetailsStatePatterns
    on GetSingleMeasurmentsDetailsState {
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
    TResult Function(GetSingleMeasurmentsDetailsStateInitial value)? initial,
    TResult Function(GetSingleMeasurmentsDetailsStateLoading value)? loading,
    TResult Function(GetSingleMeasurmentsDetailsStateFailed value)? failed,
    TResult Function(AllMeasurementsLoaded value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetSingleMeasurmentsDetailsStateInitial() when initial != null:
        return initial(_that);
      case GetSingleMeasurmentsDetailsStateLoading() when loading != null:
        return loading(_that);
      case GetSingleMeasurmentsDetailsStateFailed() when failed != null:
        return failed(_that);
      case AllMeasurementsLoaded() when success != null:
        return success(_that);
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
    required TResult Function(GetSingleMeasurmentsDetailsStateInitial value)
        initial,
    required TResult Function(GetSingleMeasurmentsDetailsStateLoading value)
        loading,
    required TResult Function(GetSingleMeasurmentsDetailsStateFailed value)
        failed,
    required TResult Function(AllMeasurementsLoaded value) success,
  }) {
    final _that = this;
    switch (_that) {
      case GetSingleMeasurmentsDetailsStateInitial():
        return initial(_that);
      case GetSingleMeasurmentsDetailsStateLoading():
        return loading(_that);
      case GetSingleMeasurmentsDetailsStateFailed():
        return failed(_that);
      case AllMeasurementsLoaded():
        return success(_that);
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
    TResult? Function(GetSingleMeasurmentsDetailsStateInitial value)? initial,
    TResult? Function(GetSingleMeasurmentsDetailsStateLoading value)? loading,
    TResult? Function(GetSingleMeasurmentsDetailsStateFailed value)? failed,
    TResult? Function(AllMeasurementsLoaded value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case GetSingleMeasurmentsDetailsStateInitial() when initial != null:
        return initial(_that);
      case GetSingleMeasurmentsDetailsStateLoading() when loading != null:
        return loading(_that);
      case GetSingleMeasurmentsDetailsStateFailed() when failed != null:
        return failed(_that);
      case AllMeasurementsLoaded() when success != null:
        return success(_that);
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
    TResult Function(String cause)? failed,
    TResult Function(List<MeasurementEntity> list)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetSingleMeasurmentsDetailsStateInitial() when initial != null:
        return initial();
      case GetSingleMeasurmentsDetailsStateLoading() when loading != null:
        return loading();
      case GetSingleMeasurmentsDetailsStateFailed() when failed != null:
        return failed(_that.cause);
      case AllMeasurementsLoaded() when success != null:
        return success(_that.list);
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
    required TResult Function(String cause) failed,
    required TResult Function(List<MeasurementEntity> list) success,
  }) {
    final _that = this;
    switch (_that) {
      case GetSingleMeasurmentsDetailsStateInitial():
        return initial();
      case GetSingleMeasurmentsDetailsStateLoading():
        return loading();
      case GetSingleMeasurmentsDetailsStateFailed():
        return failed(_that.cause);
      case AllMeasurementsLoaded():
        return success(_that.list);
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
    TResult? Function(String cause)? failed,
    TResult? Function(List<MeasurementEntity> list)? success,
  }) {
    final _that = this;
    switch (_that) {
      case GetSingleMeasurmentsDetailsStateInitial() when initial != null:
        return initial();
      case GetSingleMeasurmentsDetailsStateLoading() when loading != null:
        return loading();
      case GetSingleMeasurmentsDetailsStateFailed() when failed != null:
        return failed(_that.cause);
      case AllMeasurementsLoaded() when success != null:
        return success(_that.list);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetSingleMeasurmentsDetailsStateInitial
    implements GetSingleMeasurmentsDetailsState {
  const GetSingleMeasurmentsDetailsStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSingleMeasurmentsDetailsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetSingleMeasurmentsDetailsState.initial()';
  }
}

/// @nodoc

class GetSingleMeasurmentsDetailsStateLoading
    implements GetSingleMeasurmentsDetailsState {
  const GetSingleMeasurmentsDetailsStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSingleMeasurmentsDetailsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetSingleMeasurmentsDetailsState.loading()';
  }
}

/// @nodoc

class GetSingleMeasurmentsDetailsStateFailed
    implements GetSingleMeasurmentsDetailsState {
  const GetSingleMeasurmentsDetailsStateFailed({required this.cause});

  final String cause;

  /// Create a copy of GetSingleMeasurmentsDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetSingleMeasurmentsDetailsStateFailedCopyWith<
          GetSingleMeasurmentsDetailsStateFailed>
      get copyWith => _$GetSingleMeasurmentsDetailsStateFailedCopyWithImpl<
          GetSingleMeasurmentsDetailsStateFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetSingleMeasurmentsDetailsStateFailed &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  @override
  String toString() {
    return 'GetSingleMeasurmentsDetailsState.failed(cause: $cause)';
  }
}

/// @nodoc
abstract mixin class $GetSingleMeasurmentsDetailsStateFailedCopyWith<$Res>
    implements $GetSingleMeasurmentsDetailsStateCopyWith<$Res> {
  factory $GetSingleMeasurmentsDetailsStateFailedCopyWith(
          GetSingleMeasurmentsDetailsStateFailed value,
          $Res Function(GetSingleMeasurmentsDetailsStateFailed) _then) =
      _$GetSingleMeasurmentsDetailsStateFailedCopyWithImpl;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class _$GetSingleMeasurmentsDetailsStateFailedCopyWithImpl<$Res>
    implements $GetSingleMeasurmentsDetailsStateFailedCopyWith<$Res> {
  _$GetSingleMeasurmentsDetailsStateFailedCopyWithImpl(this._self, this._then);

  final GetSingleMeasurmentsDetailsStateFailed _self;
  final $Res Function(GetSingleMeasurmentsDetailsStateFailed) _then;

  /// Create a copy of GetSingleMeasurmentsDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cause = null,
  }) {
    return _then(GetSingleMeasurmentsDetailsStateFailed(
      cause: null == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AllMeasurementsLoaded implements GetSingleMeasurmentsDetailsState {
  const AllMeasurementsLoaded({required final List<MeasurementEntity> list})
      : _list = list;

  final List<MeasurementEntity> _list;
  List<MeasurementEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  /// Create a copy of GetSingleMeasurmentsDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AllMeasurementsLoadedCopyWith<AllMeasurementsLoaded> get copyWith =>
      _$AllMeasurementsLoadedCopyWithImpl<AllMeasurementsLoaded>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AllMeasurementsLoaded &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @override
  String toString() {
    return 'GetSingleMeasurmentsDetailsState.success(list: $list)';
  }
}

/// @nodoc
abstract mixin class $AllMeasurementsLoadedCopyWith<$Res>
    implements $GetSingleMeasurmentsDetailsStateCopyWith<$Res> {
  factory $AllMeasurementsLoadedCopyWith(AllMeasurementsLoaded value,
          $Res Function(AllMeasurementsLoaded) _then) =
      _$AllMeasurementsLoadedCopyWithImpl;
  @useResult
  $Res call({List<MeasurementEntity> list});
}

/// @nodoc
class _$AllMeasurementsLoadedCopyWithImpl<$Res>
    implements $AllMeasurementsLoadedCopyWith<$Res> {
  _$AllMeasurementsLoadedCopyWithImpl(this._self, this._then);

  final AllMeasurementsLoaded _self;
  final $Res Function(AllMeasurementsLoaded) _then;

  /// Create a copy of GetSingleMeasurmentsDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? list = null,
  }) {
    return _then(AllMeasurementsLoaded(
      list: null == list
          ? _self._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<MeasurementEntity>,
    ));
  }
}

// dart format on
