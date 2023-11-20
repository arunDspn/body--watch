// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apppreferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function(AppPreferences appPreferences)? updatePreferences,
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
    TResult? Function(_UpdatePreferences value)? updatePreferences,
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
      _$ApppreferencesEventCopyWithImpl<$Res, ApppreferencesEvent>;
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class _$ApppreferencesEventCopyWithImpl<$Res, $Val extends ApppreferencesEvent>
    implements $ApppreferencesEventCopyWith<$Res> {
  _$ApppreferencesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_value.copyWith(
      appPreferences: null == appPreferences
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePreferencesImplCopyWith<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  factory _$$UpdatePreferencesImplCopyWith(_$UpdatePreferencesImpl value,
          $Res Function(_$UpdatePreferencesImpl) then) =
      __$$UpdatePreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$$UpdatePreferencesImplCopyWithImpl<$Res>
    extends _$ApppreferencesEventCopyWithImpl<$Res, _$UpdatePreferencesImpl>
    implements _$$UpdatePreferencesImplCopyWith<$Res> {
  __$$UpdatePreferencesImplCopyWithImpl(_$UpdatePreferencesImpl _value,
      $Res Function(_$UpdatePreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_$UpdatePreferencesImpl(
      appPreferences: null == appPreferences
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc

class _$UpdatePreferencesImpl implements _UpdatePreferences {
  const _$UpdatePreferencesImpl({required this.appPreferences});

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
            other is _$UpdatePreferencesImpl &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePreferencesImplCopyWith<_$UpdatePreferencesImpl> get copyWith =>
      __$$UpdatePreferencesImplCopyWithImpl<_$UpdatePreferencesImpl>(
          this, _$identity);

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
    TResult? Function(AppPreferences appPreferences)? updatePreferences,
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
    TResult? Function(_UpdatePreferences value)? updatePreferences,
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
  const factory _UpdatePreferences(
      {required final AppPreferences appPreferences}) = _$UpdatePreferencesImpl;

  @override
  AppPreferences get appPreferences;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePreferencesImplCopyWith<_$UpdatePreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApppreferencesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppPreferences appPreferences) savedAndReady,
    required TResult Function() notSavedOrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppPreferences appPreferences)? savedAndReady,
    TResult? Function()? notSavedOrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? savedAndReady,
    TResult Function()? notSavedOrReady,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavedAndReady value) savedAndReady,
    required TResult Function(NotSavedOrReady value) notSavedOrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavedAndReady value)? savedAndReady,
    TResult? Function(NotSavedOrReady value)? notSavedOrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavedAndReady value)? savedAndReady,
    TResult Function(NotSavedOrReady value)? notSavedOrReady,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApppreferencesStateCopyWith<$Res> {
  factory $ApppreferencesStateCopyWith(
          ApppreferencesState value, $Res Function(ApppreferencesState) then) =
      _$ApppreferencesStateCopyWithImpl<$Res, ApppreferencesState>;
}

/// @nodoc
class _$ApppreferencesStateCopyWithImpl<$Res, $Val extends ApppreferencesState>
    implements $ApppreferencesStateCopyWith<$Res> {
  _$ApppreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SavedAndReadyImplCopyWith<$Res> {
  factory _$$SavedAndReadyImplCopyWith(
          _$SavedAndReadyImpl value, $Res Function(_$SavedAndReadyImpl) then) =
      __$$SavedAndReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$$SavedAndReadyImplCopyWithImpl<$Res>
    extends _$ApppreferencesStateCopyWithImpl<$Res, _$SavedAndReadyImpl>
    implements _$$SavedAndReadyImplCopyWith<$Res> {
  __$$SavedAndReadyImplCopyWithImpl(
      _$SavedAndReadyImpl _value, $Res Function(_$SavedAndReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_$SavedAndReadyImpl(
      appPreferences: null == appPreferences
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc

class _$SavedAndReadyImpl implements SavedAndReady {
  const _$SavedAndReadyImpl({required this.appPreferences});

  @override
  final AppPreferences appPreferences;

  @override
  String toString() {
    return 'ApppreferencesState.savedAndReady(appPreferences: $appPreferences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedAndReadyImpl &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedAndReadyImplCopyWith<_$SavedAndReadyImpl> get copyWith =>
      __$$SavedAndReadyImplCopyWithImpl<_$SavedAndReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppPreferences appPreferences) savedAndReady,
    required TResult Function() notSavedOrReady,
  }) {
    return savedAndReady(appPreferences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppPreferences appPreferences)? savedAndReady,
    TResult? Function()? notSavedOrReady,
  }) {
    return savedAndReady?.call(appPreferences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? savedAndReady,
    TResult Function()? notSavedOrReady,
    required TResult orElse(),
  }) {
    if (savedAndReady != null) {
      return savedAndReady(appPreferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavedAndReady value) savedAndReady,
    required TResult Function(NotSavedOrReady value) notSavedOrReady,
  }) {
    return savedAndReady(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavedAndReady value)? savedAndReady,
    TResult? Function(NotSavedOrReady value)? notSavedOrReady,
  }) {
    return savedAndReady?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavedAndReady value)? savedAndReady,
    TResult Function(NotSavedOrReady value)? notSavedOrReady,
    required TResult orElse(),
  }) {
    if (savedAndReady != null) {
      return savedAndReady(this);
    }
    return orElse();
  }
}

abstract class SavedAndReady implements ApppreferencesState {
  const factory SavedAndReady({required final AppPreferences appPreferences}) =
      _$SavedAndReadyImpl;

  AppPreferences get appPreferences;
  @JsonKey(ignore: true)
  _$$SavedAndReadyImplCopyWith<_$SavedAndReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotSavedOrReadyImplCopyWith<$Res> {
  factory _$$NotSavedOrReadyImplCopyWith(_$NotSavedOrReadyImpl value,
          $Res Function(_$NotSavedOrReadyImpl) then) =
      __$$NotSavedOrReadyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotSavedOrReadyImplCopyWithImpl<$Res>
    extends _$ApppreferencesStateCopyWithImpl<$Res, _$NotSavedOrReadyImpl>
    implements _$$NotSavedOrReadyImplCopyWith<$Res> {
  __$$NotSavedOrReadyImplCopyWithImpl(
      _$NotSavedOrReadyImpl _value, $Res Function(_$NotSavedOrReadyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotSavedOrReadyImpl implements NotSavedOrReady {
  const _$NotSavedOrReadyImpl();

  @override
  String toString() {
    return 'ApppreferencesState.notSavedOrReady()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotSavedOrReadyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppPreferences appPreferences) savedAndReady,
    required TResult Function() notSavedOrReady,
  }) {
    return notSavedOrReady();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppPreferences appPreferences)? savedAndReady,
    TResult? Function()? notSavedOrReady,
  }) {
    return notSavedOrReady?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppPreferences appPreferences)? savedAndReady,
    TResult Function()? notSavedOrReady,
    required TResult orElse(),
  }) {
    if (notSavedOrReady != null) {
      return notSavedOrReady();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavedAndReady value) savedAndReady,
    required TResult Function(NotSavedOrReady value) notSavedOrReady,
  }) {
    return notSavedOrReady(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavedAndReady value)? savedAndReady,
    TResult? Function(NotSavedOrReady value)? notSavedOrReady,
  }) {
    return notSavedOrReady?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavedAndReady value)? savedAndReady,
    TResult Function(NotSavedOrReady value)? notSavedOrReady,
    required TResult orElse(),
  }) {
    if (notSavedOrReady != null) {
      return notSavedOrReady(this);
    }
    return orElse();
  }
}

abstract class NotSavedOrReady implements ApppreferencesState {
  const factory NotSavedOrReady() = _$NotSavedOrReadyImpl;
}
