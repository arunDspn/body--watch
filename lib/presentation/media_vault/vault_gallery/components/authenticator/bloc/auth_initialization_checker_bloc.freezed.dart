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

class AuthInitializationCheckerStateInitial
    implements AuthInitializationCheckerState {
  const AuthInitializationCheckerStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthInitializationCheckerStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerState.initial()';
  }
}

/// @nodoc

class AuthInitializationCheckerStateNotInitialized
    implements AuthInitializationCheckerState {
  const AuthInitializationCheckerStateNotInitialized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthInitializationCheckerStateNotInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerState.notInitialized()';
  }
}

/// @nodoc

class AuthInitializationCheckerStateInitialized
    implements AuthInitializationCheckerState {
  const AuthInitializationCheckerStateInitialized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthInitializationCheckerStateInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerState.initialized()';
  }
}

/// @nodoc

class AuthInitializationCheckerStateLoading
    implements AuthInitializationCheckerState {
  const AuthInitializationCheckerStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthInitializationCheckerStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthInitializationCheckerState.loading()';
  }
}

/// @nodoc

class AuthInitializationCheckerStateFailed
    implements AuthInitializationCheckerState {
  const AuthInitializationCheckerStateFailed(this.message);

  final String message;

  /// Create a copy of AuthInitializationCheckerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthInitializationCheckerStateFailedCopyWith<
          AuthInitializationCheckerStateFailed>
      get copyWith => _$AuthInitializationCheckerStateFailedCopyWithImpl<
          AuthInitializationCheckerStateFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthInitializationCheckerStateFailed &&
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
abstract mixin class $AuthInitializationCheckerStateFailedCopyWith<$Res>
    implements $AuthInitializationCheckerStateCopyWith<$Res> {
  factory $AuthInitializationCheckerStateFailedCopyWith(
          AuthInitializationCheckerStateFailed value,
          $Res Function(AuthInitializationCheckerStateFailed) _then) =
      _$AuthInitializationCheckerStateFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthInitializationCheckerStateFailedCopyWithImpl<$Res>
    implements $AuthInitializationCheckerStateFailedCopyWith<$Res> {
  _$AuthInitializationCheckerStateFailedCopyWithImpl(this._self, this._then);

  final AuthInitializationCheckerStateFailed _self;
  final $Res Function(AuthInitializationCheckerStateFailed) _then;

  /// Create a copy of AuthInitializationCheckerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AuthInitializationCheckerStateFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
