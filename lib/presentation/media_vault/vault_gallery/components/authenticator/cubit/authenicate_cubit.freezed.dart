// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [AuthenicateState].
extension AuthenicateStatePatterns on AuthenicateState {
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
    TResult Function(AuthenicateStateInitial value)? initial,
    TResult Function(AuthenicateStateAuthenticated value)? authenticated,
    TResult Function(AuthenicateStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthenicateStateLoading value)? loading,
    TResult Function(AuthenicateStateFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthenicateStateInitial() when initial != null:
        return initial(_that);
      case AuthenicateStateAuthenticated() when authenticated != null:
        return authenticated(_that);
      case AuthenicateStateUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case AuthenicateStateLoading() when loading != null:
        return loading(_that);
      case AuthenicateStateFailed() when failed != null:
        return failed(_that);
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
    required TResult Function(AuthenicateStateInitial value) initial,
    required TResult Function(AuthenicateStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenicateStateUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenicateStateLoading value) loading,
    required TResult Function(AuthenicateStateFailed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthenicateStateInitial():
        return initial(_that);
      case AuthenicateStateAuthenticated():
        return authenticated(_that);
      case AuthenicateStateUnauthenticated():
        return unauthenticated(_that);
      case AuthenicateStateLoading():
        return loading(_that);
      case AuthenicateStateFailed():
        return failed(_that);
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
    TResult? Function(AuthenicateStateInitial value)? initial,
    TResult? Function(AuthenicateStateAuthenticated value)? authenticated,
    TResult? Function(AuthenicateStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthenicateStateLoading value)? loading,
    TResult? Function(AuthenicateStateFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthenicateStateInitial() when initial != null:
        return initial(_that);
      case AuthenicateStateAuthenticated() when authenticated != null:
        return authenticated(_that);
      case AuthenicateStateUnauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case AuthenicateStateLoading() when loading != null:
        return loading(_that);
      case AuthenicateStateFailed() when failed != null:
        return failed(_that);
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
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthenicateStateInitial() when initial != null:
        return initial();
      case AuthenicateStateAuthenticated() when authenticated != null:
        return authenticated();
      case AuthenicateStateUnauthenticated() when unauthenticated != null:
        return unauthenticated();
      case AuthenicateStateLoading() when loading != null:
        return loading();
      case AuthenicateStateFailed() when failed != null:
        return failed(_that.message);
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
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthenicateStateInitial():
        return initial();
      case AuthenicateStateAuthenticated():
        return authenticated();
      case AuthenicateStateUnauthenticated():
        return unauthenticated();
      case AuthenicateStateLoading():
        return loading();
      case AuthenicateStateFailed():
        return failed(_that.message);
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
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthenicateStateInitial() when initial != null:
        return initial();
      case AuthenicateStateAuthenticated() when authenticated != null:
        return authenticated();
      case AuthenicateStateUnauthenticated() when unauthenticated != null:
        return unauthenticated();
      case AuthenicateStateLoading() when loading != null:
        return loading();
      case AuthenicateStateFailed() when failed != null:
        return failed(_that.message);
      case _:
        return null;
    }
  }
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
