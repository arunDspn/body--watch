// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_gate_keeper_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthGateKeeperEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthGateKeeperEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthGateKeeperEvent()';
  }
}

/// @nodoc
class $AuthGateKeeperEventCopyWith<$Res> {
  $AuthGateKeeperEventCopyWith(
      AuthGateKeeperEvent _, $Res Function(AuthGateKeeperEvent) __);
}

/// @nodoc

class _TriggerAuth implements AuthGateKeeperEvent {
  const _TriggerAuth();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TriggerAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthGateKeeperEvent.triggerAuth()';
  }
}

/// @nodoc

class _TriggerUnAuth implements AuthGateKeeperEvent {
  const _TriggerUnAuth();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TriggerUnAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthGateKeeperEvent.triggerUnAuth()';
  }
}

/// @nodoc
mixin _$AuthGateKeeperState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthGateKeeperState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthGateKeeperState()';
  }
}

/// @nodoc
class $AuthGateKeeperStateCopyWith<$Res> {
  $AuthGateKeeperStateCopyWith(
      AuthGateKeeperState _, $Res Function(AuthGateKeeperState) __);
}

/// @nodoc

class AuthGateKeeperStateLoading implements AuthGateKeeperState {
  const AuthGateKeeperStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthGateKeeperStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthGateKeeperState.loading()';
  }
}

/// @nodoc

class AuthGateKeeperStateAuthenticated implements AuthGateKeeperState {
  const AuthGateKeeperStateAuthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthGateKeeperStateAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthGateKeeperState.authenticated()';
  }
}

/// @nodoc

class AuthGateKeeperStateUnauthenticated implements AuthGateKeeperState {
  const AuthGateKeeperStateUnauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthGateKeeperStateUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthGateKeeperState.unauthenticated()';
  }
}

// dart format on
