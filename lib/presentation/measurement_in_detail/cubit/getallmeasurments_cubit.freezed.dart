// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

/// @nodoc

class _Initial implements GetSingleMeasurmentsDetailsState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetSingleMeasurmentsDetailsState.initial()';
  }
}

/// @nodoc

class _Loading implements GetSingleMeasurmentsDetailsState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetSingleMeasurmentsDetailsState.loading()';
  }
}

/// @nodoc

class _Failed implements GetSingleMeasurmentsDetailsState {
  const _Failed({required this.cause});

  final String cause;

  /// Create a copy of GetSingleMeasurmentsDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailedCopyWith<_Failed> get copyWith =>
      __$FailedCopyWithImpl<_Failed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failed &&
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
abstract mixin class _$FailedCopyWith<$Res>
    implements $GetSingleMeasurmentsDetailsStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) =
      __$FailedCopyWithImpl;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

  /// Create a copy of GetSingleMeasurmentsDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cause = null,
  }) {
    return _then(_Failed(
      cause: null == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AllMeasurementsLoaded implements GetSingleMeasurmentsDetailsState {
  const AllMeasurementsLoaded({required final List<Measurement> list})
      : _list = list;

  final List<Measurement> _list;
  List<Measurement> get list {
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
  $Res call({List<Measurement> list});
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
              as List<Measurement>,
    ));
  }
}

// dart format on
