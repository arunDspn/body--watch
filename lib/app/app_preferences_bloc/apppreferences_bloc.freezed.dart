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

  _UpdatePreferences updatePreferences(
      {required AppPreferences appPreferences}) {
    return _UpdatePreferences(
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
    required TResult Function(AppPreferences appPreferences) updatePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? updatePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? updatePreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdatePreferences value) updatePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdatePreferences value)? updatePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdatePreferences value)? updatePreferences,
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
abstract class _$UpdatePreferencesCopyWith<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  factory _$UpdatePreferencesCopyWith(
          _UpdatePreferences value, $Res Function(_UpdatePreferences) then) =
      __$UpdatePreferencesCopyWithImpl<$Res>;
  @override
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$UpdatePreferencesCopyWithImpl<$Res>
    extends _$ApppreferencesEventCopyWithImpl<$Res>
    implements _$UpdatePreferencesCopyWith<$Res> {
  __$UpdatePreferencesCopyWithImpl(
      _UpdatePreferences _value, $Res Function(_UpdatePreferences) _then)
      : super(_value, (v) => _then(v as _UpdatePreferences));

  @override
  _UpdatePreferences get _value => super._value as _UpdatePreferences;

  @override
  $Res call({
    Object? appPreferences = freezed,
  }) {
    return _then(_UpdatePreferences(
      appPreferences: appPreferences == freezed
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc

class _$_UpdatePreferences implements _UpdatePreferences {
  const _$_UpdatePreferences({required this.appPreferences});

  @override
  final AppPreferences appPreferences;

  @override
  String toString() {
    return 'ApppreferencesEvent.updatePreferences(appPreferences: $appPreferences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePreferences &&
            const DeepCollectionEquality()
                .equals(other.appPreferences, appPreferences));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(appPreferences));

  @JsonKey(ignore: true)
  @override
  _$UpdatePreferencesCopyWith<_UpdatePreferences> get copyWith =>
      __$UpdatePreferencesCopyWithImpl<_UpdatePreferences>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppPreferences appPreferences) updatePreferences,
  }) {
    return updatePreferences(appPreferences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? updatePreferences,
  }) {
    return updatePreferences?.call(appPreferences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? updatePreferences,
    required TResult orElse(),
  }) {
    if (updatePreferences != null) {
      return updatePreferences(appPreferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdatePreferences value) updatePreferences,
  }) {
    return updatePreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdatePreferences value)? updatePreferences,
  }) {
    return updatePreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdatePreferences value)? updatePreferences,
    required TResult orElse(),
  }) {
    if (updatePreferences != null) {
      return updatePreferences(this);
    }
    return orElse();
  }
}

abstract class _UpdatePreferences implements ApppreferencesEvent {
  const factory _UpdatePreferences({required AppPreferences appPreferences}) =
      _$_UpdatePreferences;

  @override
  AppPreferences get appPreferences;
  @override
  @JsonKey(ignore: true)
  _$UpdatePreferencesCopyWith<_UpdatePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ApppreferencesStateTearOff {
  const _$ApppreferencesStateTearOff();

  _Initial initial() {
    return const _Initial();
  }
}

/// @nodoc
const $ApppreferencesState = _$ApppreferencesStateTearOff();

/// @nodoc
mixin _$ApppreferencesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApppreferencesStateCopyWith<$Res> {
  factory $ApppreferencesStateCopyWith(
          ApppreferencesState value, $Res Function(ApppreferencesState) then) =
      _$ApppreferencesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApppreferencesStateCopyWithImpl<$Res>
    implements $ApppreferencesStateCopyWith<$Res> {
  _$ApppreferencesStateCopyWithImpl(this._value, this._then);

  final ApppreferencesState _value;
  // ignore: unused_field
  final $Res Function(ApppreferencesState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ApppreferencesStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ApppreferencesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ApppreferencesState {
  const factory _Initial() = _$_Initial;
}
