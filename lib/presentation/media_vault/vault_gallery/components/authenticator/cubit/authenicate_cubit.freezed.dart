// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenicate_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenicateState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthenicateState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenicateState()';
  }
}

/// @nodoc
class $AuthenicateStateCopyWith<$Res> {
  $AuthenicateStateCopyWith(
      AuthenicateState _, $Res Function(AuthenicateState) __);
}

/// @nodoc

class AuthenicateStateInitial implements AuthenicateState {
  const AuthenicateStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthenicateStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenicateState.initial()';
  }
}

/// @nodoc

class AuthenicateStateAuthenticated implements AuthenicateState {
  const AuthenicateStateAuthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenicateStateAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenicateState.authenticated()';
  }
}

/// @nodoc

class AuthenicateStateUnauthenticated implements AuthenicateState {
  const AuthenicateStateUnauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenicateStateUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenicateState.unauthenticated()';
  }
}

/// @nodoc

class AuthenicateStateLoading implements AuthenicateState {
  const AuthenicateStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthenicateStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthenicateState.loading()';
  }
}

/// @nodoc

class AuthenicateStateFailed implements AuthenicateState {
  const AuthenicateStateFailed(this.message);

  final String message;

  /// Create a copy of AuthenicateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthenicateStateFailedCopyWith<AuthenicateStateFailed> get copyWith =>
      _$AuthenicateStateFailedCopyWithImpl<AuthenicateStateFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenicateStateFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthenicateState.failed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthenicateStateFailedCopyWith<$Res>
    implements $AuthenicateStateCopyWith<$Res> {
  factory $AuthenicateStateFailedCopyWith(AuthenicateStateFailed value,
          $Res Function(AuthenicateStateFailed) _then) =
      _$AuthenicateStateFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthenicateStateFailedCopyWithImpl<$Res>
    implements $AuthenicateStateFailedCopyWith<$Res> {
  _$AuthenicateStateFailedCopyWithImpl(this._self, this._then);

  final AuthenicateStateFailed _self;
  final $Res Function(AuthenicateStateFailed) _then;

  /// Create a copy of AuthenicateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AuthenicateStateFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
