// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_initialization_checker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthInitializationCheckerEvents {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthInitializationCheckerEvents);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerEvents()';
  }
}

/// @nodoc
class $AuthInitializationCheckerEventsCopyWith<$Res> {
  $AuthInitializationCheckerEventsCopyWith(AuthInitializationCheckerEvents _,
      $Res Function(AuthInitializationCheckerEvents) __);
}

/// @nodoc

class _CheckAuth implements AuthInitializationCheckerEvents {
  const _CheckAuth();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerEvents.checkAuth()';
  }
}

/// @nodoc
mixin _$AuthInitializationCheckerState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthInitializationCheckerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerState()';
  }
}

/// @nodoc
class $AuthInitializationCheckerStateCopyWith<$Res> {
  $AuthInitializationCheckerStateCopyWith(AuthInitializationCheckerState _,
      $Res Function(AuthInitializationCheckerState) __);
}

/// @nodoc

class _Initial implements AuthInitializationCheckerState {
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
    return 'AuthInitializationCheckerState.initial()';
  }
}

/// @nodoc

class _NotInitialized implements AuthInitializationCheckerState {
  const _NotInitialized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NotInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerState.notInitialized()';
  }
}

/// @nodoc

class _Initialized implements AuthInitializationCheckerState {
  const _Initialized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerState.initialized()';
  }
}

/// @nodoc

class _Loading implements AuthInitializationCheckerState {
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
    return 'AuthInitializationCheckerState.loading()';
  }
}

/// @nodoc

class _Failed implements AuthInitializationCheckerState {
  const _Failed(this.message);

  final String message;

  /// Create a copy of AuthInitializationCheckerState
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
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthInitializationCheckerState.failed(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res>
    implements $AuthInitializationCheckerStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) =
      __$FailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

  /// Create a copy of AuthInitializationCheckerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Failed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
