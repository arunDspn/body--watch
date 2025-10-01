// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getallwidgetsdata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetallwidgetsdataEvent {
  AppPreferences get appPreferences;

  /// Create a copy of GetallwidgetsdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetallwidgetsdataEventCopyWith<GetallwidgetsdataEvent> get copyWith =>
      _$GetallwidgetsdataEventCopyWithImpl<GetallwidgetsdataEvent>(
          this as GetallwidgetsdataEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetallwidgetsdataEvent &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'GetallwidgetsdataEvent(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class $GetallwidgetsdataEventCopyWith<$Res> {
  factory $GetallwidgetsdataEventCopyWith(GetallwidgetsdataEvent value,
          $Res Function(GetallwidgetsdataEvent) _then) =
      _$GetallwidgetsdataEventCopyWithImpl;
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class _$GetallwidgetsdataEventCopyWithImpl<$Res>
    implements $GetallwidgetsdataEventCopyWith<$Res> {
  _$GetallwidgetsdataEventCopyWithImpl(this._self, this._then);

  final GetallwidgetsdataEvent _self;
  final $Res Function(GetallwidgetsdataEvent) _then;

  /// Create a copy of GetallwidgetsdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_self.copyWith(
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// Adds pattern-matching-related methods to [GetallwidgetsdataEvent].
extension GetallwidgetsdataEventPatterns on GetallwidgetsdataEvent {
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
    TResult Function(_FetchAllData value)? fetchAllData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAllData() when fetchAllData != null:
        return fetchAllData(_that);
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
    required TResult Function(_FetchAllData value) fetchAllData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAllData():
        return fetchAllData(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_FetchAllData value)? fetchAllData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAllData() when fetchAllData != null:
        return fetchAllData(_that);
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
    TResult Function(AppPreferences appPreferences)? fetchAllData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAllData() when fetchAllData != null:
        return fetchAllData(_that.appPreferences);
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
    required TResult Function(AppPreferences appPreferences) fetchAllData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAllData():
        return fetchAllData(_that.appPreferences);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(AppPreferences appPreferences)? fetchAllData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAllData() when fetchAllData != null:
        return fetchAllData(_that.appPreferences);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FetchAllData implements GetallwidgetsdataEvent {
  const _FetchAllData({required this.appPreferences});

  @override
  final AppPreferences appPreferences;

  /// Create a copy of GetallwidgetsdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchAllDataCopyWith<_FetchAllData> get copyWith =>
      __$FetchAllDataCopyWithImpl<_FetchAllData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchAllData &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'GetallwidgetsdataEvent.fetchAllData(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$FetchAllDataCopyWith<$Res>
    implements $GetallwidgetsdataEventCopyWith<$Res> {
  factory _$FetchAllDataCopyWith(
          _FetchAllData value, $Res Function(_FetchAllData) _then) =
      __$FetchAllDataCopyWithImpl;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$FetchAllDataCopyWithImpl<$Res>
    implements _$FetchAllDataCopyWith<$Res> {
  __$FetchAllDataCopyWithImpl(this._self, this._then);

  final _FetchAllData _self;
  final $Res Function(_FetchAllData) _then;

  /// Create a copy of GetallwidgetsdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_FetchAllData(
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc
mixin _$GetallwidgetsdataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetallwidgetsdataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetallwidgetsdataState()';
  }
}

/// @nodoc
class $GetallwidgetsdataStateCopyWith<$Res> {
  $GetallwidgetsdataStateCopyWith(
      GetallwidgetsdataState _, $Res Function(GetallwidgetsdataState) __);
}

/// Adds pattern-matching-related methods to [GetallwidgetsdataState].
extension GetallwidgetsdataStatePatterns on GetallwidgetsdataState {
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
    TResult Function(GetallwidgetsdataStateInitial value)? initial,
    TResult Function(GetallwidgetsdataStateLoading value)? loading,
    TResult Function(GetallwidgetsdataStateFailure value)? failure,
    TResult Function(GetallwidgetsdataStateSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetallwidgetsdataStateInitial() when initial != null:
        return initial(_that);
      case GetallwidgetsdataStateLoading() when loading != null:
        return loading(_that);
      case GetallwidgetsdataStateFailure() when failure != null:
        return failure(_that);
      case GetallwidgetsdataStateSuccess() when success != null:
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
    required TResult Function(GetallwidgetsdataStateInitial value) initial,
    required TResult Function(GetallwidgetsdataStateLoading value) loading,
    required TResult Function(GetallwidgetsdataStateFailure value) failure,
    required TResult Function(GetallwidgetsdataStateSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case GetallwidgetsdataStateInitial():
        return initial(_that);
      case GetallwidgetsdataStateLoading():
        return loading(_that);
      case GetallwidgetsdataStateFailure():
        return failure(_that);
      case GetallwidgetsdataStateSuccess():
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
    TResult? Function(GetallwidgetsdataStateInitial value)? initial,
    TResult? Function(GetallwidgetsdataStateLoading value)? loading,
    TResult? Function(GetallwidgetsdataStateFailure value)? failure,
    TResult? Function(GetallwidgetsdataStateSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case GetallwidgetsdataStateInitial() when initial != null:
        return initial(_that);
      case GetallwidgetsdataStateLoading() when loading != null:
        return loading(_that);
      case GetallwidgetsdataStateFailure() when failure != null:
        return failure(_that);
      case GetallwidgetsdataStateSuccess() when success != null:
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
    TResult Function(List<LatestMeasurementDisplayModel> widgets)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetallwidgetsdataStateInitial() when initial != null:
        return initial();
      case GetallwidgetsdataStateLoading() when loading != null:
        return loading();
      case GetallwidgetsdataStateFailure() when failure != null:
        return failure(_that.cause);
      case GetallwidgetsdataStateSuccess() when success != null:
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
    required TResult Function(List<LatestMeasurementDisplayModel> widgets)
        success,
  }) {
    final _that = this;
    switch (_that) {
      case GetallwidgetsdataStateInitial():
        return initial();
      case GetallwidgetsdataStateLoading():
        return loading();
      case GetallwidgetsdataStateFailure():
        return failure(_that.cause);
      case GetallwidgetsdataStateSuccess():
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
    TResult? Function(List<LatestMeasurementDisplayModel> widgets)? success,
  }) {
    final _that = this;
    switch (_that) {
      case GetallwidgetsdataStateInitial() when initial != null:
        return initial();
      case GetallwidgetsdataStateLoading() when loading != null:
        return loading();
      case GetallwidgetsdataStateFailure() when failure != null:
        return failure(_that.cause);
      case GetallwidgetsdataStateSuccess() when success != null:
        return success(_that.widgets);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetallwidgetsdataStateInitial implements GetallwidgetsdataState {
  const GetallwidgetsdataStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetallwidgetsdataStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetallwidgetsdataState.initial()';
  }
}

/// @nodoc

class GetallwidgetsdataStateLoading implements GetallwidgetsdataState {
  const GetallwidgetsdataStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetallwidgetsdataStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetallwidgetsdataState.loading()';
  }
}

/// @nodoc

class GetallwidgetsdataStateFailure implements GetallwidgetsdataState {
  const GetallwidgetsdataStateFailure(this.cause);

  final String cause;

  /// Create a copy of GetallwidgetsdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetallwidgetsdataStateFailureCopyWith<GetallwidgetsdataStateFailure>
      get copyWith => _$GetallwidgetsdataStateFailureCopyWithImpl<
          GetallwidgetsdataStateFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetallwidgetsdataStateFailure &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  @override
  String toString() {
    return 'GetallwidgetsdataState.failure(cause: $cause)';
  }
}

/// @nodoc
abstract mixin class $GetallwidgetsdataStateFailureCopyWith<$Res>
    implements $GetallwidgetsdataStateCopyWith<$Res> {
  factory $GetallwidgetsdataStateFailureCopyWith(
          GetallwidgetsdataStateFailure value,
          $Res Function(GetallwidgetsdataStateFailure) _then) =
      _$GetallwidgetsdataStateFailureCopyWithImpl;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class _$GetallwidgetsdataStateFailureCopyWithImpl<$Res>
    implements $GetallwidgetsdataStateFailureCopyWith<$Res> {
  _$GetallwidgetsdataStateFailureCopyWithImpl(this._self, this._then);

  final GetallwidgetsdataStateFailure _self;
  final $Res Function(GetallwidgetsdataStateFailure) _then;

  /// Create a copy of GetallwidgetsdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cause = null,
  }) {
    return _then(GetallwidgetsdataStateFailure(
      null == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GetallwidgetsdataStateSuccess implements GetallwidgetsdataState {
  const GetallwidgetsdataStateSuccess(
      final List<LatestMeasurementDisplayModel> widgets)
      : _widgets = widgets;

  final List<LatestMeasurementDisplayModel> _widgets;
  List<LatestMeasurementDisplayModel> get widgets {
    if (_widgets is EqualUnmodifiableListView) return _widgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_widgets);
  }

  /// Create a copy of GetallwidgetsdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetallwidgetsdataStateSuccessCopyWith<GetallwidgetsdataStateSuccess>
      get copyWith => _$GetallwidgetsdataStateSuccessCopyWithImpl<
          GetallwidgetsdataStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetallwidgetsdataStateSuccess &&
            const DeepCollectionEquality().equals(other._widgets, _widgets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_widgets));

  @override
  String toString() {
    return 'GetallwidgetsdataState.success(widgets: $widgets)';
  }
}

/// @nodoc
abstract mixin class $GetallwidgetsdataStateSuccessCopyWith<$Res>
    implements $GetallwidgetsdataStateCopyWith<$Res> {
  factory $GetallwidgetsdataStateSuccessCopyWith(
          GetallwidgetsdataStateSuccess value,
          $Res Function(GetallwidgetsdataStateSuccess) _then) =
      _$GetallwidgetsdataStateSuccessCopyWithImpl;
  @useResult
  $Res call({List<LatestMeasurementDisplayModel> widgets});
}

/// @nodoc
class _$GetallwidgetsdataStateSuccessCopyWithImpl<$Res>
    implements $GetallwidgetsdataStateSuccessCopyWith<$Res> {
  _$GetallwidgetsdataStateSuccessCopyWithImpl(this._self, this._then);

  final GetallwidgetsdataStateSuccess _self;
  final $Res Function(GetallwidgetsdataStateSuccess) _then;

  /// Create a copy of GetallwidgetsdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? widgets = null,
  }) {
    return _then(GetallwidgetsdataStateSuccess(
      null == widgets
          ? _self._widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<LatestMeasurementDisplayModel>,
    ));
  }
}

// dart format on
