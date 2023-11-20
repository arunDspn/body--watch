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
    required TResult Function(AppPreferences appPreferences) savePreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppPreferences appPreferences)? savePreferences,
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
    TResult? Function(_LoadSavedPreferences value)? savePreferences,
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
abstract class _$$LoadSavedPreferencesImplCopyWith<$Res>
    implements $ApppreferencesEventCopyWith<$Res> {
  factory _$$LoadSavedPreferencesImplCopyWith(_$LoadSavedPreferencesImpl value,
          $Res Function(_$LoadSavedPreferencesImpl) then) =
      __$$LoadSavedPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppPreferences appPreferences});
}

/// @nodoc
class __$$LoadSavedPreferencesImplCopyWithImpl<$Res>
    extends _$ApppreferencesEventCopyWithImpl<$Res, _$LoadSavedPreferencesImpl>
    implements _$$LoadSavedPreferencesImplCopyWith<$Res> {
  __$$LoadSavedPreferencesImplCopyWithImpl(_$LoadSavedPreferencesImpl _value,
      $Res Function(_$LoadSavedPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPreferences = null,
  }) {
    return _then(_$LoadSavedPreferencesImpl(
      appPreferences: null == appPreferences
          ? _value.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc

class _$LoadSavedPreferencesImpl implements _LoadSavedPreferences {
  const _$LoadSavedPreferencesImpl({required this.appPreferences});

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
            other is _$LoadSavedPreferencesImpl &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPreferences);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSavedPreferencesImplCopyWith<_$LoadSavedPreferencesImpl>
      get copyWith =>
          __$$LoadSavedPreferencesImplCopyWithImpl<_$LoadSavedPreferencesImpl>(
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
    TResult? Function(AppPreferences appPreferences)? savePreferences,
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
    TResult? Function(_LoadSavedPreferences value)? savePreferences,
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
          {required final AppPreferences appPreferences}) =
      _$LoadSavedPreferencesImpl;

  @override
  AppPreferences get appPreferences;
  @override
  @JsonKey(ignore: true)
  _$$LoadSavedPreferencesImplCopyWith<_$LoadSavedPreferencesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
