// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [AuthGateKeeperEvent].
extension AuthGateKeeperEventPatterns on AuthGateKeeperEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriggerAuth value)? triggerAuth,
    TResult Function(_TriggerUnAuth value)? triggerUnAuth,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TriggerAuth() when triggerAuth != null:
        return triggerAuth(_that);
      case _TriggerUnAuth() when triggerUnAuth != null:
        return triggerUnAuth(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriggerAuth value) triggerAuth,
    required TResult Function(_TriggerUnAuth value) triggerUnAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _TriggerAuth():
        return triggerAuth(_that);
      case _TriggerUnAuth():
        return triggerUnAuth(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TriggerAuth value)? triggerAuth,
    TResult? Function(_TriggerUnAuth value)? triggerUnAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _TriggerAuth() when triggerAuth != null:
        return triggerAuth(_that);
      case _TriggerUnAuth() when triggerUnAuth != null:
        return triggerUnAuth(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? triggerAuth,
    TResult Function()? triggerUnAuth,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TriggerAuth() when triggerAuth != null:
        return triggerAuth();
      case _TriggerUnAuth() when triggerUnAuth != null:
        return triggerUnAuth();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() triggerAuth,
    required TResult Function() triggerUnAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _TriggerAuth():
        return triggerAuth();
      case _TriggerUnAuth():
        return triggerUnAuth();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? triggerAuth,
    TResult? Function()? triggerUnAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _TriggerAuth() when triggerAuth != null:
        return triggerAuth();
      case _TriggerUnAuth() when triggerUnAuth != null:
        return triggerUnAuth();
      case _:
        return null;
    }
  }
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

/// Adds pattern-matching-related methods to [AuthGateKeeperState].
extension AuthGateKeeperStatePatterns on AuthGateKeeperState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthGateKeeperStateLoading value)? loading,
    TResult Function(AuthGateKeeperStateAuthenticated value)? authenticated,
    TResult Function(AuthGateKeeperStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthGateKeeperStateLoading() when loading != null:
        return loading(_that);
      case AuthGateKeeperStateAuthenticated() when authenticated != null:
        return authenticated(_that);
      case AuthGateKeeperStateUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthGateKeeperStateLoading value) loading,
    required TResult Function(AuthGateKeeperStateAuthenticated value)
        authenticated,
    required TResult Function(AuthGateKeeperStateUnauthenticated value)
        unauthenticated,
  }) {
    final _that = this;
    switch (_that) {
      case AuthGateKeeperStateLoading():
        return loading(_that);
      case AuthGateKeeperStateAuthenticated():
        return authenticated(_that);
      case AuthGateKeeperStateUnauthenticated():
        return unauthenticated(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthGateKeeperStateLoading value)? loading,
    TResult? Function(AuthGateKeeperStateAuthenticated value)? authenticated,
    TResult? Function(AuthGateKeeperStateUnauthenticated value)?
        unauthenticated,
  }) {
    final _that = this;
    switch (_that) {
      case AuthGateKeeperStateLoading() when loading != null:
        return loading(_that);
      case AuthGateKeeperStateAuthenticated() when authenticated != null:
        return authenticated(_that);
      case AuthGateKeeperStateUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthGateKeeperStateLoading() when loading != null:
        return loading();
      case AuthGateKeeperStateAuthenticated() when authenticated != null:
        return authenticated();
      case AuthGateKeeperStateUnauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    final _that = this;
    switch (_that) {
      case AuthGateKeeperStateLoading():
        return loading();
      case AuthGateKeeperStateAuthenticated():
        return authenticated();
      case AuthGateKeeperStateUnauthenticated():
        return unauthenticated();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    final _that = this;
    switch (_that) {
      case AuthGateKeeperStateLoading() when loading != null:
        return loading();
      case AuthGateKeeperStateAuthenticated() when authenticated != null:
        return authenticated();
      case AuthGateKeeperStateUnauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _:
        return null;
    }
  }
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
