// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getallwidgets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetallwidgetsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetallwidgetsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetallwidgetsState()';
  }
}

/// @nodoc
class $GetallwidgetsStateCopyWith<$Res> {
  $GetallwidgetsStateCopyWith(
      GetallwidgetsState _, $Res Function(GetallwidgetsState) __);
}

/// Adds pattern-matching-related methods to [GetallwidgetsState].
extension GetallwidgetsStatePatterns on GetallwidgetsState {
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
    TResult Function(GetAllWidgetInitial value)? initial,
    TResult Function(GetAllWidgetLoading value)? loading,
    TResult Function(GetAllWidgetFailure value)? failure,
    TResult Function(GetAllWidgetSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetAllWidgetInitial() when initial != null:
        return initial(_that);
      case GetAllWidgetLoading() when loading != null:
        return loading(_that);
      case GetAllWidgetFailure() when failure != null:
        return failure(_that);
      case GetAllWidgetSuccess() when success != null:
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
    required TResult Function(GetAllWidgetInitial value) initial,
    required TResult Function(GetAllWidgetLoading value) loading,
    required TResult Function(GetAllWidgetFailure value) failure,
    required TResult Function(GetAllWidgetSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case GetAllWidgetInitial():
        return initial(_that);
      case GetAllWidgetLoading():
        return loading(_that);
      case GetAllWidgetFailure():
        return failure(_that);
      case GetAllWidgetSuccess():
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
    TResult? Function(GetAllWidgetInitial value)? initial,
    TResult? Function(GetAllWidgetLoading value)? loading,
    TResult? Function(GetAllWidgetFailure value)? failure,
    TResult? Function(GetAllWidgetSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case GetAllWidgetInitial() when initial != null:
        return initial(_that);
      case GetAllWidgetLoading() when loading != null:
        return loading(_that);
      case GetAllWidgetFailure() when failure != null:
        return failure(_that);
      case GetAllWidgetSuccess() when success != null:
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
    TResult Function(String cause)? failure,
    TResult Function(List<MeasurementTargetModel> widgets)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetAllWidgetInitial() when initial != null:
        return initial();
      case GetAllWidgetLoading() when loading != null:
        return loading();
      case GetAllWidgetFailure() when failure != null:
        return failure(_that.cause);
      case GetAllWidgetSuccess() when success != null:
        return success(_that.widgets);
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
    required TResult Function(String cause) failure,
    required TResult Function(List<MeasurementTargetModel> widgets) success,
  }) {
    final _that = this;
    switch (_that) {
      case GetAllWidgetInitial():
        return initial();
      case GetAllWidgetLoading():
        return loading();
      case GetAllWidgetFailure():
        return failure(_that.cause);
      case GetAllWidgetSuccess():
        return success(_that.widgets);
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
    TResult? Function(String cause)? failure,
    TResult? Function(List<MeasurementTargetModel> widgets)? success,
  }) {
    final _that = this;
    switch (_that) {
      case GetAllWidgetInitial() when initial != null:
        return initial();
      case GetAllWidgetLoading() when loading != null:
        return loading();
      case GetAllWidgetFailure() when failure != null:
        return failure(_that.cause);
      case GetAllWidgetSuccess() when success != null:
        return success(_that.widgets);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetAllWidgetInitial implements GetallwidgetsState {
  const GetAllWidgetInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetAllWidgetInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetallwidgetsState.initial()';
  }
}

/// @nodoc

class GetAllWidgetLoading implements GetallwidgetsState {
  const GetAllWidgetLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetAllWidgetLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetallwidgetsState.loading()';
  }
}

/// @nodoc

class GetAllWidgetFailure implements GetallwidgetsState {
  const GetAllWidgetFailure(this.cause);

  final String cause;

  /// Create a copy of GetallwidgetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetAllWidgetFailureCopyWith<GetAllWidgetFailure> get copyWith =>
      _$GetAllWidgetFailureCopyWithImpl<GetAllWidgetFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetAllWidgetFailure &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  @override
  String toString() {
    return 'GetallwidgetsState.failure(cause: $cause)';
  }
}

/// @nodoc
abstract mixin class $GetAllWidgetFailureCopyWith<$Res>
    implements $GetallwidgetsStateCopyWith<$Res> {
  factory $GetAllWidgetFailureCopyWith(
          GetAllWidgetFailure value, $Res Function(GetAllWidgetFailure) _then) =
      _$GetAllWidgetFailureCopyWithImpl;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class _$GetAllWidgetFailureCopyWithImpl<$Res>
    implements $GetAllWidgetFailureCopyWith<$Res> {
  _$GetAllWidgetFailureCopyWithImpl(this._self, this._then);

  final GetAllWidgetFailure _self;
  final $Res Function(GetAllWidgetFailure) _then;

  /// Create a copy of GetallwidgetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cause = null,
  }) {
    return _then(GetAllWidgetFailure(
      null == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetAllWidgetSuccess implements GetallwidgetsState {
  const GetAllWidgetSuccess(
      {required final List<MeasurementTargetModel> widgets})
      : _widgets = widgets;

  final List<MeasurementTargetModel> _widgets;
  List<MeasurementTargetModel> get widgets {
    if (_widgets is EqualUnmodifiableListView) return _widgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_widgets);
  }

  /// Create a copy of GetallwidgetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetAllWidgetSuccessCopyWith<GetAllWidgetSuccess> get copyWith =>
      _$GetAllWidgetSuccessCopyWithImpl<GetAllWidgetSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetAllWidgetSuccess &&
            const DeepCollectionEquality().equals(other._widgets, _widgets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_widgets));

  @override
  String toString() {
    return 'GetallwidgetsState.success(widgets: $widgets)';
  }
}

/// @nodoc
abstract mixin class $GetAllWidgetSuccessCopyWith<$Res>
    implements $GetallwidgetsStateCopyWith<$Res> {
  factory $GetAllWidgetSuccessCopyWith(
          GetAllWidgetSuccess value, $Res Function(GetAllWidgetSuccess) _then) =
      _$GetAllWidgetSuccessCopyWithImpl;
  @useResult
  $Res call({List<MeasurementTargetModel> widgets});
}

/// @nodoc
class _$GetAllWidgetSuccessCopyWithImpl<$Res>
    implements $GetAllWidgetSuccessCopyWith<$Res> {
  _$GetAllWidgetSuccessCopyWithImpl(this._self, this._then);

  final GetAllWidgetSuccess _self;
  final $Res Function(GetAllWidgetSuccess) _then;

  /// Create a copy of GetallwidgetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? widgets = null,
  }) {
    return _then(GetAllWidgetSuccess(
      widgets: null == widgets
          ? _self._widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<MeasurementTargetModel>,
    ));
  }
}

// dart format on
