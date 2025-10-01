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
    TResult Function(_UpdatePreferences value)? updatePreferences,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that);
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
    required TResult Function(_UpdatePreferences value) updatePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _UpdatePreferences():
        return updatePreferences(_that);
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
    TResult? Function(_UpdatePreferences value)? updatePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that);
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
    TResult Function(AppPreferences appPreferences)? updatePreferences,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that.appPreferences);
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
    required TResult Function(AppPreferences appPreferences) updatePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _UpdatePreferences():
        return updatePreferences(_that.appPreferences);
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
    TResult? Function(AppPreferences appPreferences)? updatePreferences,
  }) {
    final _that = this;
    switch (_that) {
      case _UpdatePreferences() when updatePreferences != null:
        return updatePreferences(_that.appPreferences);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpdatePreferences implements ApppreferencesEvent {
  const _UpdatePreferences({required this.appPreferences});

  @override
  final AppPreferences appPreferences;

  /// Create a copy of ApppreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatePreferencesCopyWith<_UpdatePreferences> get copyWith =>
      __$UpdatePreferencesCopyWithImpl<_UpdatePreferences>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePreferences &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'ApppreferencesEvent.updatePreferences(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$UpdatePreferencesCopyWith<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  factory _$UpdatePreferencesCopyWith(
          _UpdatePreferences value, $Res Function(_UpdatePreferences) _then) =
      __$UpdatePreferencesCopyWithImpl;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$UpdatePreferencesCopyWithImpl<$Res>
    implements _$UpdatePreferencesCopyWith<$Res> {
  __$UpdatePreferencesCopyWithImpl(this._self, this._then);

  final _UpdatePreferences _self;
  final $Res Function(_UpdatePreferences) _then;

  /// Create a copy of ApppreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_UpdatePreferences(
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc
mixin _$ApppreferencesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApppreferencesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApppreferencesState()';
  }
}

/// @nodoc
class $ApppreferencesStateCopyWith<$Res> {
  $ApppreferencesStateCopyWith(
      ApppreferencesState _, $Res Function(ApppreferencesState) __);
}

/// Adds pattern-matching-related methods to [ApppreferencesState].
extension ApppreferencesStatePatterns on ApppreferencesState {
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
    TResult Function(SavedAndReady value)? savedAndReady,
    TResult Function(NotSavedOrReady value)? notSavedOrReady,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SavedAndReady() when savedAndReady != null:
        return savedAndReady(_that);
      case NotSavedOrReady() when notSavedOrReady != null:
        return notSavedOrReady(_that);
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
    required TResult Function(SavedAndReady value) savedAndReady,
    required TResult Function(NotSavedOrReady value) notSavedOrReady,
  }) {
    final _that = this;
    switch (_that) {
      case SavedAndReady():
        return savedAndReady(_that);
      case NotSavedOrReady():
        return notSavedOrReady(_that);
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
    TResult? Function(SavedAndReady value)? savedAndReady,
    TResult? Function(NotSavedOrReady value)? notSavedOrReady,
  }) {
    final _that = this;
    switch (_that) {
      case SavedAndReady() when savedAndReady != null:
        return savedAndReady(_that);
      case NotSavedOrReady() when notSavedOrReady != null:
        return notSavedOrReady(_that);
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
    TResult Function(AppPreferences appPreferences)? savedAndReady,
    TResult Function()? notSavedOrReady,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SavedAndReady() when savedAndReady != null:
        return savedAndReady(_that.appPreferences);
      case NotSavedOrReady() when notSavedOrReady != null:
        return notSavedOrReady();
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
    required TResult Function(AppPreferences appPreferences) savedAndReady,
    required TResult Function() notSavedOrReady,
  }) {
    final _that = this;
    switch (_that) {
      case SavedAndReady():
        return savedAndReady(_that.appPreferences);
      case NotSavedOrReady():
        return notSavedOrReady();
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
    TResult? Function(AppPreferences appPreferences)? savedAndReady,
    TResult? Function()? notSavedOrReady,
  }) {
    final _that = this;
    switch (_that) {
      case SavedAndReady() when savedAndReady != null:
        return savedAndReady(_that.appPreferences);
      case NotSavedOrReady() when notSavedOrReady != null:
        return notSavedOrReady();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SavedAndReady implements ApppreferencesState {
  const SavedAndReady({required this.appPreferences});

  final AppPreferences appPreferences;

  /// Create a copy of ApppreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedAndReadyCopyWith<SavedAndReady> get copyWith =>
      _$SavedAndReadyCopyWithImpl<SavedAndReady>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedAndReady &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @override
  String toString() {
    return 'ApppreferencesState.savedAndReady(appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class $SavedAndReadyCopyWith<$Res>
    implements $ApppreferencesStateCopyWith<$Res> {
  factory $SavedAndReadyCopyWith(
          SavedAndReady value, $Res Function(SavedAndReady) _then) =
      _$SavedAndReadyCopyWithImpl;
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class _$SavedAndReadyCopyWithImpl<$Res>
    implements $SavedAndReadyCopyWith<$Res> {
  _$SavedAndReadyCopyWithImpl(this._self, this._then);

  final SavedAndReady _self;
  final $Res Function(SavedAndReady) _then;

  /// Create a copy of ApppreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(SavedAndReady(
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc

class NotSavedOrReady implements ApppreferencesState {
  const NotSavedOrReady();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotSavedOrReady);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApppreferencesState.notSavedOrReady()';
  }
}

// dart format on
