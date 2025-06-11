// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  const GetAllWidgetSuccess(final List<MeasurementType> widgets)
      : _widgets = widgets;

  final List<MeasurementType> _widgets;
  List<MeasurementType> get widgets {
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
  $Res call({List<MeasurementType> widgets});
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
      null == widgets
          ? _self._widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<MeasurementType>,
    ));
  }
}

// dart format on
