// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adddata_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdddataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AdddataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AdddataState()';
  }
}

/// @nodoc
class $AdddataStateCopyWith<$Res> {
  $AdddataStateCopyWith(AdddataState _, $Res Function(AdddataState) __);
}

/// @nodoc

class AddDataInitial implements AdddataState {
  const AddDataInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddDataInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AdddataState.initial()';
  }
}

/// @nodoc

class AddDataLoading implements AdddataState {
  const AddDataLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddDataLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AdddataState.loading()';
  }
}

/// @nodoc

class AddDataFailure implements AdddataState {
  const AddDataFailure(this.message);

  final String message;

  /// Create a copy of AdddataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddDataFailureCopyWith<AddDataFailure> get copyWith =>
      _$AddDataFailureCopyWithImpl<AddDataFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddDataFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AdddataState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AddDataFailureCopyWith<$Res>
    implements $AdddataStateCopyWith<$Res> {
  factory $AddDataFailureCopyWith(
          AddDataFailure value, $Res Function(AddDataFailure) _then) =
      _$AddDataFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AddDataFailureCopyWithImpl<$Res>
    implements $AddDataFailureCopyWith<$Res> {
  _$AddDataFailureCopyWithImpl(this._self, this._then);

  final AddDataFailure _self;
  final $Res Function(AddDataFailure) _then;

  /// Create a copy of AdddataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AddDataFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddDataSuccess implements AdddataState {
  const AddDataSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddDataSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AdddataState.success()';
  }
}

// dart format on
