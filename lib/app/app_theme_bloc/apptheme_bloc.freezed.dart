// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apptheme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppthemeEvent {
  AppTheme get appTheme;

  /// Create a copy of AppthemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppthemeEventCopyWith<AppthemeEvent> get copyWith =>
      _$AppthemeEventCopyWithImpl<AppthemeEvent>(
          this as AppthemeEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppthemeEvent &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appTheme);

  @override
  String toString() {
    return 'AppthemeEvent(appTheme: $appTheme)';
  }
}

/// @nodoc
abstract mixin class $AppthemeEventCopyWith<$Res> {
  factory $AppthemeEventCopyWith(
          AppthemeEvent value, $Res Function(AppthemeEvent) _then) =
      _$AppthemeEventCopyWithImpl;
  @useResult
  $Res call({AppTheme appTheme});
}

/// @nodoc
class _$AppthemeEventCopyWithImpl<$Res>
    implements $AppthemeEventCopyWith<$Res> {
  _$AppthemeEventCopyWithImpl(this._self, this._then);

  final AppthemeEvent _self;
  final $Res Function(AppthemeEvent) _then;

  /// Create a copy of AppthemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appTheme = null,
  }) {
    return _then(_self.copyWith(
      appTheme: null == appTheme
          ? _self.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppthemeEvent].
extension AppthemeEventPatterns on AppthemeEvent {
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
    TResult Function(AppThemeEventChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AppThemeEventChangeTheme() when changeTheme != null:
        return changeTheme(_that);
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
    required TResult Function(AppThemeEventChangeTheme value) changeTheme,
  }) {
    final _that = this;
    switch (_that) {
      case AppThemeEventChangeTheme():
        return changeTheme(_that);
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
    TResult? Function(AppThemeEventChangeTheme value)? changeTheme,
  }) {
    final _that = this;
    switch (_that) {
      case AppThemeEventChangeTheme() when changeTheme != null:
        return changeTheme(_that);
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
    TResult Function(AppTheme appTheme)? changeTheme,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AppThemeEventChangeTheme() when changeTheme != null:
        return changeTheme(_that.appTheme);
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
    required TResult Function(AppTheme appTheme) changeTheme,
  }) {
    final _that = this;
    switch (_that) {
      case AppThemeEventChangeTheme():
        return changeTheme(_that.appTheme);
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
    TResult? Function(AppTheme appTheme)? changeTheme,
  }) {
    final _that = this;
    switch (_that) {
      case AppThemeEventChangeTheme() when changeTheme != null:
        return changeTheme(_that.appTheme);
      case _:
        return null;
    }
  }
}

/// @nodoc

class AppThemeEventChangeTheme implements AppthemeEvent {
  const AppThemeEventChangeTheme({required this.appTheme});

  @override
  final AppTheme appTheme;

  /// Create a copy of AppthemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppThemeEventChangeThemeCopyWith<AppThemeEventChangeTheme> get copyWith =>
      _$AppThemeEventChangeThemeCopyWithImpl<AppThemeEventChangeTheme>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeEventChangeTheme &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appTheme);

  @override
  String toString() {
    return 'AppthemeEvent.changeTheme(appTheme: $appTheme)';
  }
}

/// @nodoc
abstract mixin class $AppThemeEventChangeThemeCopyWith<$Res>
    implements $AppthemeEventCopyWith<$Res> {
  factory $AppThemeEventChangeThemeCopyWith(AppThemeEventChangeTheme value,
          $Res Function(AppThemeEventChangeTheme) _then) =
      _$AppThemeEventChangeThemeCopyWithImpl;
  @override
  @useResult
  $Res call({AppTheme appTheme});
}

/// @nodoc
class _$AppThemeEventChangeThemeCopyWithImpl<$Res>
    implements $AppThemeEventChangeThemeCopyWith<$Res> {
  _$AppThemeEventChangeThemeCopyWithImpl(this._self, this._then);

  final AppThemeEventChangeTheme _self;
  final $Res Function(AppThemeEventChangeTheme) _then;

  /// Create a copy of AppthemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appTheme = null,
  }) {
    return _then(AppThemeEventChangeTheme(
      appTheme: null == appTheme
          ? _self.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc
mixin _$AppthemeState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppthemeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppthemeState()';
  }
}

/// @nodoc
class $AppthemeStateCopyWith<$Res> {
  $AppthemeStateCopyWith(AppthemeState _, $Res Function(AppthemeState) __);
}

/// Adds pattern-matching-related methods to [AppthemeState].
extension AppthemeStatePatterns on AppthemeState {
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
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
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
    required TResult Function(_Initial value) initial,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_Initial value)? initial,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
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
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
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
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _:
        throw StateError('Unexpected subclass');
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
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements AppthemeState {
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
    return 'AppthemeState.initial()';
  }
}

// dart format on
