// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chartdata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartdataEvent {
  DurationsEnum get duration;
  AppPreferences get appPreferences;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartdataEventCopyWith<ChartdataEvent> get copyWith =>
      _$ChartdataEventCopyWithImpl<ChartdataEvent>(
          this as ChartdataEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartdataEvent &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, appPreferences);

  @override
  String toString() {
    return 'ChartdataEvent(duration: $duration, appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class $ChartdataEventCopyWith<$Res> {
  factory $ChartdataEventCopyWith(
          ChartdataEvent value, $Res Function(ChartdataEvent) _then) =
      _$ChartdataEventCopyWithImpl;
  @useResult
  $Res call({DurationsEnum duration, AppPreferences appPreferences});
}

/// @nodoc
class _$ChartdataEventCopyWithImpl<$Res>
    implements $ChartdataEventCopyWith<$Res> {
  _$ChartdataEventCopyWithImpl(this._self, this._then);

  final ChartdataEvent _self;
  final $Res Function(ChartdataEvent) _then;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? appPreferences = null,
  }) {
    return _then(_self.copyWith(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChartdataEvent].
extension ChartdataEventPatterns on ChartdataEvent {
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
    TResult Function(_FetchData value)? fetchData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchData() when fetchData != null:
        return fetchData(_that);
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
    required TResult Function(_FetchData value) fetchData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchData():
        return fetchData(_that);
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
    TResult? Function(_FetchData value)? fetchData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchData() when fetchData != null:
        return fetchData(_that);
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
    TResult Function(DurationsEnum duration, AppPreferences appPreferences)?
        fetchData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchData() when fetchData != null:
        return fetchData(_that.duration, _that.appPreferences);
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
    required TResult Function(
            DurationsEnum duration, AppPreferences appPreferences)
        fetchData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchData():
        return fetchData(_that.duration, _that.appPreferences);
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
    TResult? Function(DurationsEnum duration, AppPreferences appPreferences)?
        fetchData,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchData() when fetchData != null:
        return fetchData(_that.duration, _that.appPreferences);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FetchData implements ChartdataEvent {
  const _FetchData({required this.duration, required this.appPreferences});

  @override
  final DurationsEnum duration;
  @override
  final AppPreferences appPreferences;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchDataCopyWith<_FetchData> get copyWith =>
      __$FetchDataCopyWithImpl<_FetchData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchData &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, appPreferences);

  @override
  String toString() {
    return 'ChartdataEvent.fetchData(duration: $duration, appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$FetchDataCopyWith<$Res>
    implements $ChartdataEventCopyWith<$Res> {
  factory _$FetchDataCopyWith(
          _FetchData value, $Res Function(_FetchData) _then) =
      __$FetchDataCopyWithImpl;
  @override
  @useResult
  $Res call({DurationsEnum duration, AppPreferences appPreferences});
}

/// @nodoc
class __$FetchDataCopyWithImpl<$Res> implements _$FetchDataCopyWith<$Res> {
  __$FetchDataCopyWithImpl(this._self, this._then);

  final _FetchData _self;
  final $Res Function(_FetchData) _then;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? duration = null,
    Object? appPreferences = null,
  }) {
    return _then(_FetchData(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc
mixin _$ChartdataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChartdataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChartdataState()';
  }
}

/// @nodoc
class $ChartdataStateCopyWith<$Res> {
  $ChartdataStateCopyWith(ChartdataState _, $Res Function(ChartdataState) __);
}

/// Adds pattern-matching-related methods to [ChartdataState].
extension ChartdataStatePatterns on ChartdataState {
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
    TResult Function(ChartDataStateInitial value)? initial,
    TResult Function(ChartDataStateLoading value)? loading,
    TResult Function(ChartDataStateSuccess value)? success,
    TResult Function(ChartDataStateFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChartDataStateInitial() when initial != null:
        return initial(_that);
      case ChartDataStateLoading() when loading != null:
        return loading(_that);
      case ChartDataStateSuccess() when success != null:
        return success(_that);
      case ChartDataStateFailed() when failed != null:
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
    required TResult Function(ChartDataStateInitial value) initial,
    required TResult Function(ChartDataStateLoading value) loading,
    required TResult Function(ChartDataStateSuccess value) success,
    required TResult Function(ChartDataStateFailed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case ChartDataStateInitial():
        return initial(_that);
      case ChartDataStateLoading():
        return loading(_that);
      case ChartDataStateSuccess():
        return success(_that);
      case ChartDataStateFailed():
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
    TResult? Function(ChartDataStateInitial value)? initial,
    TResult? Function(ChartDataStateLoading value)? loading,
    TResult? Function(ChartDataStateSuccess value)? success,
    TResult? Function(ChartDataStateFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case ChartDataStateInitial() when initial != null:
        return initial(_that);
      case ChartDataStateLoading() when loading != null:
        return loading(_that);
      case ChartDataStateSuccess() when success != null:
        return success(_that);
      case ChartDataStateFailed() when failed != null:
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
    TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        success,
    TResult Function(String cause)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChartDataStateInitial() when initial != null:
        return initial();
      case ChartDataStateLoading() when loading != null:
        return loading();
      case ChartDataStateSuccess() when success != null:
        return success(
            _that.chartDisplayModelList, _that.durationsEnum, _that.startDate);
      case ChartDataStateFailed() when failed != null:
        return failed(_that.cause);
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
    required TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)
        success,
    required TResult Function(String cause) failed,
  }) {
    final _that = this;
    switch (_that) {
      case ChartDataStateInitial():
        return initial();
      case ChartDataStateLoading():
        return loading();
      case ChartDataStateSuccess():
        return success(
            _that.chartDisplayModelList, _that.durationsEnum, _that.startDate);
      case ChartDataStateFailed():
        return failed(_that.cause);
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
    TResult? Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        success,
    TResult? Function(String cause)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case ChartDataStateInitial() when initial != null:
        return initial();
      case ChartDataStateLoading() when loading != null:
        return loading();
      case ChartDataStateSuccess() when success != null:
        return success(
            _that.chartDisplayModelList, _that.durationsEnum, _that.startDate);
      case ChartDataStateFailed() when failed != null:
        return failed(_that.cause);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ChartDataStateInitial implements ChartdataState {
  const ChartDataStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChartDataStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChartdataState.initial()';
  }
}

/// @nodoc

class ChartDataStateLoading implements ChartdataState {
  const ChartDataStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChartDataStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChartdataState.loading()';
  }
}

/// @nodoc

class ChartDataStateSuccess implements ChartdataState {
  const ChartDataStateSuccess(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required this.durationsEnum,
      required this.startDate})
      : _chartDisplayModelList = chartDisplayModelList;

  final List<ChartDisplayModel> _chartDisplayModelList;
  List<ChartDisplayModel> get chartDisplayModelList {
    if (_chartDisplayModelList is EqualUnmodifiableListView)
      return _chartDisplayModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartDisplayModelList);
  }

  final DurationsEnum durationsEnum;
  final DateTime startDate;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartDataStateSuccessCopyWith<ChartDataStateSuccess> get copyWith =>
      _$ChartDataStateSuccessCopyWithImpl<ChartDataStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartDataStateSuccess &&
            const DeepCollectionEquality()
                .equals(other._chartDisplayModelList, _chartDisplayModelList) &&
            (identical(other.durationsEnum, durationsEnum) ||
                other.durationsEnum == durationsEnum) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chartDisplayModelList),
      durationsEnum,
      startDate);

  @override
  String toString() {
    return 'ChartdataState.success(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate)';
  }
}

/// @nodoc
abstract mixin class $ChartDataStateSuccessCopyWith<$Res>
    implements $ChartdataStateCopyWith<$Res> {
  factory $ChartDataStateSuccessCopyWith(ChartDataStateSuccess value,
          $Res Function(ChartDataStateSuccess) _then) =
      _$ChartDataStateSuccessCopyWithImpl;
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate});
}

/// @nodoc
class _$ChartDataStateSuccessCopyWithImpl<$Res>
    implements $ChartDataStateSuccessCopyWith<$Res> {
  _$ChartDataStateSuccessCopyWithImpl(this._self, this._then);

  final ChartDataStateSuccess _self;
  final $Res Function(ChartDataStateSuccess) _then;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
  }) {
    return _then(ChartDataStateSuccess(
      chartDisplayModelList: null == chartDisplayModelList
          ? _self._chartDisplayModelList
          : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
              as List<ChartDisplayModel>,
      durationsEnum: null == durationsEnum
          ? _self.durationsEnum
          : durationsEnum // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class ChartDataStateFailed implements ChartdataState {
  const ChartDataStateFailed({required this.cause});

  final String cause;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartDataStateFailedCopyWith<ChartDataStateFailed> get copyWith =>
      _$ChartDataStateFailedCopyWithImpl<ChartDataStateFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartDataStateFailed &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  @override
  String toString() {
    return 'ChartdataState.failed(cause: $cause)';
  }
}

/// @nodoc
abstract mixin class $ChartDataStateFailedCopyWith<$Res>
    implements $ChartdataStateCopyWith<$Res> {
  factory $ChartDataStateFailedCopyWith(ChartDataStateFailed value,
          $Res Function(ChartDataStateFailed) _then) =
      _$ChartDataStateFailedCopyWithImpl;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class _$ChartDataStateFailedCopyWithImpl<$Res>
    implements $ChartDataStateFailedCopyWith<$Res> {
  _$ChartDataStateFailedCopyWithImpl(this._self, this._then);

  final ChartDataStateFailed _self;
  final $Res Function(ChartDataStateFailed) _then;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cause = null,
  }) {
    return _then(ChartDataStateFailed(
      cause: null == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
