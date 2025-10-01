// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [AuthInitializationCheckerEvents].
extension AuthInitializationCheckerEventsPatterns
    on AuthInitializationCheckerEvents {
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
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckAuth() when checkAuth != null:
        return checkAuth(_that);
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
    required TResult Function(_CheckAuth value) checkAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckAuth():
        return checkAuth(_that);
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
    TResult? Function(_CheckAuth value)? checkAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckAuth() when checkAuth != null:
        return checkAuth(_that);
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
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CheckAuth() when checkAuth != null:
        return checkAuth();
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
    required TResult Function() checkAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckAuth():
        return checkAuth();
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
    TResult? Function()? checkAuth,
  }) {
    final _that = this;
    switch (_that) {
      case _CheckAuth() when checkAuth != null:
        return checkAuth();
      case _:
        return null;
    }
  }
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

/// Adds pattern-matching-related methods to [AuthInitializationCheckerState].
extension AuthInitializationCheckerStatePatterns
    on AuthInitializationCheckerState {
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
    TResult Function(AuthInitializationCheckerStateInitial value)? initial,
    TResult Function(AuthInitializationCheckerStateNotInitialized value)?
        notInitialized,
    TResult Function(AuthInitializationCheckerStateInitialized value)?
        initialized,
    TResult Function(AuthInitializationCheckerStateLoading value)? loading,
    TResult Function(AuthInitializationCheckerStateFailed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitializationCheckerStateInitial() when initial != null:
        return initial(_that);
      case AuthInitializationCheckerStateNotInitialized()
          when notInitialized != null:
        return notInitialized(_that);
      case AuthInitializationCheckerStateInitialized() when initialized != null:
        return initialized(_that);
      case AuthInitializationCheckerStateLoading() when loading != null:
        return loading(_that);
      case AuthInitializationCheckerStateFailed() when failed != null:
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
    required TResult Function(AuthInitializationCheckerStateInitial value)
        initial,
    required TResult Function(
            AuthInitializationCheckerStateNotInitialized value)
        notInitialized,
    required TResult Function(AuthInitializationCheckerStateInitialized value)
        initialized,
    required TResult Function(AuthInitializationCheckerStateLoading value)
        loading,
    required TResult Function(AuthInitializationCheckerStateFailed value)
        failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitializationCheckerStateInitial():
        return initial(_that);
      case AuthInitializationCheckerStateNotInitialized():
        return notInitialized(_that);
      case AuthInitializationCheckerStateInitialized():
        return initialized(_that);
      case AuthInitializationCheckerStateLoading():
        return loading(_that);
      case AuthInitializationCheckerStateFailed():
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
    TResult? Function(AuthInitializationCheckerStateInitial value)? initial,
    TResult? Function(AuthInitializationCheckerStateNotInitialized value)?
        notInitialized,
    TResult? Function(AuthInitializationCheckerStateInitialized value)?
        initialized,
    TResult? Function(AuthInitializationCheckerStateLoading value)? loading,
    TResult? Function(AuthInitializationCheckerStateFailed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitializationCheckerStateInitial() when initial != null:
        return initial(_that);
      case AuthInitializationCheckerStateNotInitialized()
          when notInitialized != null:
        return notInitialized(_that);
      case AuthInitializationCheckerStateInitialized() when initialized != null:
        return initialized(_that);
      case AuthInitializationCheckerStateLoading() when loading != null:
        return loading(_that);
      case AuthInitializationCheckerStateFailed() when failed != null:
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
    TResult Function()? notInitialized,
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitializationCheckerStateInitial() when initial != null:
        return initial();
      case AuthInitializationCheckerStateNotInitialized()
          when notInitialized != null:
        return notInitialized();
      case AuthInitializationCheckerStateInitialized() when initialized != null:
        return initialized();
      case AuthInitializationCheckerStateLoading() when loading != null:
        return loading();
      case AuthInitializationCheckerStateFailed() when failed != null:
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
    required TResult Function() notInitialized,
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitializationCheckerStateInitial():
        return initial();
      case AuthInitializationCheckerStateNotInitialized():
        return notInitialized();
      case AuthInitializationCheckerStateInitialized():
        return initialized();
      case AuthInitializationCheckerStateLoading():
        return loading();
      case AuthInitializationCheckerStateFailed():
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
    TResult? Function()? notInitialized,
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AuthInitializationCheckerStateInitial() when initial != null:
        return initial();
      case AuthInitializationCheckerStateNotInitialized()
          when notInitialized != null:
        return notInitialized();
      case AuthInitializationCheckerStateInitialized() when initialized != null:
        return initialized();
      case AuthInitializationCheckerStateLoading() when loading != null:
        return loading();
      case AuthInitializationCheckerStateFailed() when failed != null:
        return failed(_that.message);
      case _:
        return null;
    }
  }
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
