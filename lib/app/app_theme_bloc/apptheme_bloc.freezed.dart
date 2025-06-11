// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
