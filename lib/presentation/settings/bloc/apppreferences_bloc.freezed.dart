// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apppreferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApppreferencesEventTearOff {
  const _$ApppreferencesEventTearOff();

  _LoadSavedPreferences savePreferences(
      {required AppPreferences appPreferences}) {
    return _LoadSavedPreferences(
      appPreferences: appPreferences,
    );
  }
}

/// @nodoc
const $ApppreferencesEvent = _$ApppreferencesEventTearOff();

/// @nodoc
mixin _$ApppreferencesEvent {
  AppPreferences get appPreferences => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppPreferences appPreferences) savePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? savePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? savePreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSavedPreferences value) savePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadSavedPreferences value)? savePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSavedPreferences value)? savePreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApppreferencesEventCopyWith<ApppreferencesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApppreferencesEventCopyWith<$Res> {
  factory $ApppreferencesEventCopyWith(
          ApppreferencesEvent value, $Res Function(ApppreferencesEvent) then) =
      _$ApppreferencesEventCopyWithImpl<$Res>;
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class _$ApppreferencesEventCopyWithImpl<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  _$ApppreferencesEventCopyWithImpl(this._value, this._then);

  final ApppreferencesEvent _value;
  // ignore: unused_field
  final $Res Function(ApppreferencesEvent) _then;

  @override
  $Res call({
    Object? appPreferences = freezed,
  }) {
    return _then(_value.copyWith(
      appPreferences: appPreferences == freezed
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc
abstract class _$LoadSavedPreferencesCopyWith<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  factory _$LoadSavedPreferencesCopyWith(_LoadSavedPreferences value,
          $Res Function(_LoadSavedPreferences) then) =
      __$LoadSavedPreferencesCopyWithImpl<$Res>;
  @override
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$LoadSavedPreferencesCopyWithImpl<$Res>
    extends _$ApppreferencesEventCopyWithImpl<$Res>
    implements _$LoadSavedPreferencesCopyWith<$Res> {
  __$LoadSavedPreferencesCopyWithImpl(
      _LoadSavedPreferences _value, $Res Function(_LoadSavedPreferences) _then)
      : super(_value, (v) => _then(v as _LoadSavedPreferences));

  @override
  _LoadSavedPreferences get _value => super._value as _LoadSavedPreferences;

  @override
  $Res call({
    Object? appPreferences = freezed,
  }) {
    return _then(_LoadSavedPreferences(
      appPreferences: appPreferences == freezed
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc

class _$_LoadSavedPreferences implements _LoadSavedPreferences {
  const _$_LoadSavedPreferences({required this.appPreferences});

  @override
  final AppPreferences appPreferences;

  @override
  String toString() {
    return 'ApppreferencesEvent.savePreferences(appPreferences: $appPreferences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSavedPreferences &&
            const DeepCollectionEquality()
                .equals(other.appPreferences, appPreferences));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(appPreferences));

  @JsonKey(ignore: true)
  @override
  _$LoadSavedPreferencesCopyWith<_LoadSavedPreferences> get copyWith =>
      __$LoadSavedPreferencesCopyWithImpl<_LoadSavedPreferences>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppPreferences appPreferences) savePreferences,
  }) {
    return savePreferences(appPreferences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? savePreferences,
  }) {
    return savePreferences?.call(appPreferences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? savePreferences,
    required TResult orElse(),
  }) {
    if (savePreferences != null) {
      return savePreferences(appPreferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSavedPreferences value) savePreferences,
  }) {
    return savePreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadSavedPreferences value)? savePreferences,
  }) {
    return savePreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSavedPreferences value)? savePreferences,
    required TResult orElse(),
  }) {
    if (savePreferences != null) {
      return savePreferences(this);
    }
    return orElse();
  }
}

abstract class _LoadSavedPreferences implements ApppreferencesEvent {
  const factory _LoadSavedPreferences(
      {required AppPreferences appPreferences}) = _$_LoadSavedPreferences;

  @override
  AppPreferences get appPreferences;
  @override
  @JsonKey(ignore: true)
  _$LoadSavedPreferencesCopyWith<_LoadSavedPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
