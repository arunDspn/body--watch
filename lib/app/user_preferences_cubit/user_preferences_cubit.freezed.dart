// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPreferencesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserPreferencesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserPreferencesState()';
  }
}

/// @nodoc
class $UserPreferencesStateCopyWith<$Res> {
  $UserPreferencesStateCopyWith(
      UserPreferencesState _, $Res Function(UserPreferencesState) __);
}

/// Adds pattern-matching-related methods to [UserPreferencesState].
extension UserPreferencesStatePatterns on UserPreferencesState {
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
    TResult Function(UserPreferencesLoading value)? loading,
    TResult Function(UserPreferencesLoaded value)? loaded,
    TResult Function(UserPreferencesEmpty value)? empty,
    TResult Function(UserPreferencesError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case UserPreferencesLoading() when loading != null:
        return loading(_that);
      case UserPreferencesLoaded() when loaded != null:
        return loaded(_that);
      case UserPreferencesEmpty() when empty != null:
        return empty(_that);
      case UserPreferencesError() when error != null:
        return error(_that);
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
    required TResult Function(UserPreferencesLoading value) loading,
    required TResult Function(UserPreferencesLoaded value) loaded,
    required TResult Function(UserPreferencesEmpty value) empty,
    required TResult Function(UserPreferencesError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case UserPreferencesLoading():
        return loading(_that);
      case UserPreferencesLoaded():
        return loaded(_that);
      case UserPreferencesEmpty():
        return empty(_that);
      case UserPreferencesError():
        return error(_that);
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
    TResult? Function(UserPreferencesLoading value)? loading,
    TResult? Function(UserPreferencesLoaded value)? loaded,
    TResult? Function(UserPreferencesEmpty value)? empty,
    TResult? Function(UserPreferencesError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case UserPreferencesLoading() when loading != null:
        return loading(_that);
      case UserPreferencesLoaded() when loaded != null:
        return loaded(_that);
      case UserPreferencesEmpty() when empty != null:
        return empty(_that);
      case UserPreferencesError() when error != null:
        return error(_that);
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
    TResult Function()? loading,
    TResult Function(List<UserUnitPreferenceModel> preferences)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case UserPreferencesLoading() when loading != null:
        return loading();
      case UserPreferencesLoaded() when loaded != null:
        return loaded(_that.preferences);
      case UserPreferencesEmpty() when empty != null:
        return empty();
      case UserPreferencesError() when error != null:
        return error(_that.message);
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
    required TResult Function() loading,
    required TResult Function(List<UserUnitPreferenceModel> preferences) loaded,
    required TResult Function() empty,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case UserPreferencesLoading():
        return loading();
      case UserPreferencesLoaded():
        return loaded(_that.preferences);
      case UserPreferencesEmpty():
        return empty();
      case UserPreferencesError():
        return error(_that.message);
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
    TResult? Function()? loading,
    TResult? Function(List<UserUnitPreferenceModel> preferences)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case UserPreferencesLoading() when loading != null:
        return loading();
      case UserPreferencesLoaded() when loaded != null:
        return loaded(_that.preferences);
      case UserPreferencesEmpty() when empty != null:
        return empty();
      case UserPreferencesError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements UserPreferencesState {
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
    return 'UserPreferencesState.initial()';
  }
}

/// @nodoc

class UserPreferencesLoading implements UserPreferencesState {
  const UserPreferencesLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserPreferencesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserPreferencesState.loading()';
  }
}

/// @nodoc

class UserPreferencesLoaded implements UserPreferencesState {
  const UserPreferencesLoaded(
      {required final List<UserUnitPreferenceModel> preferences})
      : _preferences = preferences;

  final List<UserUnitPreferenceModel> _preferences;
  List<UserUnitPreferenceModel> get preferences {
    if (_preferences is EqualUnmodifiableListView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferences);
  }

  /// Create a copy of UserPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserPreferencesLoadedCopyWith<UserPreferencesLoaded> get copyWith =>
      _$UserPreferencesLoadedCopyWithImpl<UserPreferencesLoaded>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserPreferencesLoaded &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_preferences));

  @override
  String toString() {
    return 'UserPreferencesState.loaded(preferences: $preferences)';
  }
}

/// @nodoc
abstract mixin class $UserPreferencesLoadedCopyWith<$Res>
    implements $UserPreferencesStateCopyWith<$Res> {
  factory $UserPreferencesLoadedCopyWith(UserPreferencesLoaded value,
          $Res Function(UserPreferencesLoaded) _then) =
      _$UserPreferencesLoadedCopyWithImpl;
  @useResult
  $Res call({List<UserUnitPreferenceModel> preferences});
}

/// @nodoc
class _$UserPreferencesLoadedCopyWithImpl<$Res>
    implements $UserPreferencesLoadedCopyWith<$Res> {
  _$UserPreferencesLoadedCopyWithImpl(this._self, this._then);

  final UserPreferencesLoaded _self;
  final $Res Function(UserPreferencesLoaded) _then;

  /// Create a copy of UserPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? preferences = null,
  }) {
    return _then(UserPreferencesLoaded(
      preferences: null == preferences
          ? _self._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<UserUnitPreferenceModel>,
    ));
  }
}

/// @nodoc

class UserPreferencesEmpty implements UserPreferencesState {
  const UserPreferencesEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserPreferencesEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UserPreferencesState.empty()';
  }
}

/// @nodoc

class UserPreferencesError implements UserPreferencesState {
  const UserPreferencesError(this.message);

  final String message;

  /// Create a copy of UserPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserPreferencesErrorCopyWith<UserPreferencesError> get copyWith =>
      _$UserPreferencesErrorCopyWithImpl<UserPreferencesError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserPreferencesError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UserPreferencesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UserPreferencesErrorCopyWith<$Res>
    implements $UserPreferencesStateCopyWith<$Res> {
  factory $UserPreferencesErrorCopyWith(UserPreferencesError value,
          $Res Function(UserPreferencesError) _then) =
      _$UserPreferencesErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UserPreferencesErrorCopyWithImpl<$Res>
    implements $UserPreferencesErrorCopyWith<$Res> {
  _$UserPreferencesErrorCopyWithImpl(this._self, this._then);

  final UserPreferencesError _self;
  final $Res Function(UserPreferencesError) _then;

  /// Create a copy of UserPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UserPreferencesError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
