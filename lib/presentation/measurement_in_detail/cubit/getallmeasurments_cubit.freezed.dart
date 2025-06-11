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
