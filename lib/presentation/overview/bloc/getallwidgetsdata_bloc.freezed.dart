// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
