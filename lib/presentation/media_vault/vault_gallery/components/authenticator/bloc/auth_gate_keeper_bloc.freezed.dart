// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_gate_keeper_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthGateKeeperEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() triggerAuth,
    required TResult Function() triggerUnAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? triggerAuth,
    TResult? Function()? triggerUnAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? triggerAuth,
    TResult Function()? triggerUnAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriggerAuth value) triggerAuth,
    required TResult Function(_TriggerUnAuth value) triggerUnAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TriggerAuth value)? triggerAuth,
    TResult? Function(_TriggerUnAuth value)? triggerUnAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriggerAuth value)? triggerAuth,
    TResult Function(_TriggerUnAuth value)? triggerUnAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthGateKeeperEventCopyWith<$Res> {
  factory $AuthGateKeeperEventCopyWith(
          AuthGateKeeperEvent value, $Res Function(AuthGateKeeperEvent) then) =
      _$AuthGateKeeperEventCopyWithImpl<$Res, AuthGateKeeperEvent>;
}

/// @nodoc
class _$AuthGateKeeperEventCopyWithImpl<$Res, $Val extends AuthGateKeeperEvent>
    implements $AuthGateKeeperEventCopyWith<$Res> {
  _$AuthGateKeeperEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TriggerAuthImplCopyWith<$Res> {
  factory _$$TriggerAuthImplCopyWith(
          _$TriggerAuthImpl value, $Res Function(_$TriggerAuthImpl) then) =
      __$$TriggerAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TriggerAuthImplCopyWithImpl<$Res>
    extends _$AuthGateKeeperEventCopyWithImpl<$Res, _$TriggerAuthImpl>
    implements _$$TriggerAuthImplCopyWith<$Res> {
  __$$TriggerAuthImplCopyWithImpl(
      _$TriggerAuthImpl _value, $Res Function(_$TriggerAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TriggerAuthImpl implements _TriggerAuth {
  const _$TriggerAuthImpl();

  @override
  String toString() {
    return 'AuthGateKeeperEvent.triggerAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TriggerAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() triggerAuth,
    required TResult Function() triggerUnAuth,
  }) {
    return triggerAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? triggerAuth,
    TResult? Function()? triggerUnAuth,
  }) {
    return triggerAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? triggerAuth,
    TResult Function()? triggerUnAuth,
    required TResult orElse(),
  }) {
    if (triggerAuth != null) {
      return triggerAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriggerAuth value) triggerAuth,
    required TResult Function(_TriggerUnAuth value) triggerUnAuth,
  }) {
    return triggerAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TriggerAuth value)? triggerAuth,
    TResult? Function(_TriggerUnAuth value)? triggerUnAuth,
  }) {
    return triggerAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriggerAuth value)? triggerAuth,
    TResult Function(_TriggerUnAuth value)? triggerUnAuth,
    required TResult orElse(),
  }) {
    if (triggerAuth != null) {
      return triggerAuth(this);
    }
    return orElse();
  }
}

abstract class _TriggerAuth implements AuthGateKeeperEvent {
  const factory _TriggerAuth() = _$TriggerAuthImpl;
}

/// @nodoc
abstract class _$$TriggerUnAuthImplCopyWith<$Res> {
  factory _$$TriggerUnAuthImplCopyWith(
          _$TriggerUnAuthImpl value, $Res Function(_$TriggerUnAuthImpl) then) =
      __$$TriggerUnAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TriggerUnAuthImplCopyWithImpl<$Res>
    extends _$AuthGateKeeperEventCopyWithImpl<$Res, _$TriggerUnAuthImpl>
    implements _$$TriggerUnAuthImplCopyWith<$Res> {
  __$$TriggerUnAuthImplCopyWithImpl(
      _$TriggerUnAuthImpl _value, $Res Function(_$TriggerUnAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TriggerUnAuthImpl implements _TriggerUnAuth {
  const _$TriggerUnAuthImpl();

  @override
  String toString() {
    return 'AuthGateKeeperEvent.triggerUnAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TriggerUnAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() triggerAuth,
    required TResult Function() triggerUnAuth,
  }) {
    return triggerUnAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? triggerAuth,
    TResult? Function()? triggerUnAuth,
  }) {
    return triggerUnAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? triggerAuth,
    TResult Function()? triggerUnAuth,
    required TResult orElse(),
  }) {
    if (triggerUnAuth != null) {
      return triggerUnAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriggerAuth value) triggerAuth,
    required TResult Function(_TriggerUnAuth value) triggerUnAuth,
  }) {
    return triggerUnAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TriggerAuth value)? triggerAuth,
    TResult? Function(_TriggerUnAuth value)? triggerUnAuth,
  }) {
    return triggerUnAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriggerAuth value)? triggerAuth,
    TResult Function(_TriggerUnAuth value)? triggerUnAuth,
    required TResult orElse(),
  }) {
    if (triggerUnAuth != null) {
      return triggerUnAuth(this);
    }
    return orElse();
  }
}

abstract class _TriggerUnAuth implements AuthGateKeeperEvent {
  const factory _TriggerUnAuth() = _$TriggerUnAuthImpl;
}

/// @nodoc
mixin _$AuthGateKeeperState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthGateKeeperStateCopyWith<$Res> {
  factory $AuthGateKeeperStateCopyWith(
          AuthGateKeeperState value, $Res Function(AuthGateKeeperState) then) =
      _$AuthGateKeeperStateCopyWithImpl<$Res, AuthGateKeeperState>;
}

/// @nodoc
class _$AuthGateKeeperStateCopyWithImpl<$Res, $Val extends AuthGateKeeperState>
    implements $AuthGateKeeperStateCopyWith<$Res> {
  _$AuthGateKeeperStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthGateKeeperStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthGateKeeperState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthGateKeeperState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthGateKeeperStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl();

  @override
  String toString() {
    return 'AuthGateKeeperState.authenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthGateKeeperState {
  const factory _Authenticated() = _$AuthenticatedImpl;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthGateKeeperStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthGateKeeperState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthGateKeeperState {
  const factory _Unauthenticated() = _$UnauthenticatedImpl;
}
