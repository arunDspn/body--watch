// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apppreferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApppreferencesEvent {
  AppPreferences get appPreferences;

  /// Create a copy of ApppreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApppreferencesEventCopyWith<ApppreferencesEvent> get copyWith =>
      _$ApppreferencesEventCopyWithImpl<ApppreferencesEvent>(
          this as ApppreferencesEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApppreferencesEvent &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'ApppreferencesEvent(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class $ApppreferencesEventCopyWith<$Res> {
  factory $ApppreferencesEventCopyWith(
          ApppreferencesEvent value, $Res Function(ApppreferencesEvent) _then) =
      _$ApppreferencesEventCopyWithImpl;
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class _$ApppreferencesEventCopyWithImpl<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  _$ApppreferencesEventCopyWithImpl(this._self, this._then);

  final ApppreferencesEvent _self;
  final $Res Function(ApppreferencesEvent) _then;

  /// Create a copy of ApppreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_self.copyWith(
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// Adds pattern-matching-related methods to [ApppreferencesEvent].
extension ApppreferencesEventPatterns on ApppreferencesEvent {
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
    TResult Function(_LoadSavedPreferences value)? savePreferences,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadSavedPreferences() when savePreferences != null:
        return savePreferences(_that);
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
    required TResult Function(_LoadSavedPreferences value) savePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadSavedPreferences():
        return savePreferences(_that);
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
    TResult? Function(_LoadSavedPreferences value)? savePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadSavedPreferences() when savePreferences != null:
        return savePreferences(_that);
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
    TResult Function(AppPreferences appPreferences)? savePreferences,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadSavedPreferences() when savePreferences != null:
        return savePreferences(_that.appPreferences);
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
    required TResult Function(AppPreferences appPreferences) savePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadSavedPreferences():
        return savePreferences(_that.appPreferences);
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
    TResult? Function(AppPreferences appPreferences)? savePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadSavedPreferences() when savePreferences != null:
        return savePreferences(_that.appPreferences);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadSavedPreferences implements ApppreferencesEvent {
  const _LoadSavedPreferences({required this.appPreferences});

  @override
  final AppPreferences appPreferences;

  /// Create a copy of ApppreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadSavedPreferencesCopyWith<_LoadSavedPreferences> get copyWith =>
      __$LoadSavedPreferencesCopyWithImpl<_LoadSavedPreferences>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSavedPreferences &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'ApppreferencesEvent.savePreferences(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$LoadSavedPreferencesCopyWith<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  factory _$LoadSavedPreferencesCopyWith(_LoadSavedPreferences value,
          $Res Function(_LoadSavedPreferences) _then) =
      __$LoadSavedPreferencesCopyWithImpl;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$LoadSavedPreferencesCopyWithImpl<$Res>
    implements _$LoadSavedPreferencesCopyWith<$Res> {
  __$LoadSavedPreferencesCopyWithImpl(this._self, this._then);

  final _LoadSavedPreferences _self;
  final $Res Function(_LoadSavedPreferences) _then;

  /// Create a copy of ApppreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_LoadSavedPreferences(
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

// dart format on
