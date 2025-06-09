// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_preferences_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppPreferencesFailure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppPreferencesFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppPreferencesFailure()';
  }
}

/// @nodoc
class $AppPreferencesFailureCopyWith<$Res> {
  $AppPreferencesFailureCopyWith(
      AppPreferencesFailure _, $Res Function(AppPreferencesFailure) __);
}

/// @nodoc

class NotPreferencesFound implements AppPreferencesFailure {
  const NotPreferencesFound();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotPreferencesFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppPreferencesFailure.notPreferencesFound()';
  }
}

/// @nodoc

class TypicalFailure implements AppPreferencesFailure {
  const TypicalFailure({required this.message});

  final String message;

  /// Create a copy of AppPreferencesFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TypicalFailureCopyWith<TypicalFailure> get copyWith =>
      _$TypicalFailureCopyWithImpl<TypicalFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TypicalFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AppPreferencesFailure.typicalFailure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TypicalFailureCopyWith<$Res>
    implements $AppPreferencesFailureCopyWith<$Res> {
  factory $TypicalFailureCopyWith(
          TypicalFailure value, $Res Function(TypicalFailure) _then) =
      _$TypicalFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TypicalFailureCopyWithImpl<$Res>
    implements $TypicalFailureCopyWith<$Res> {
  _$TypicalFailureCopyWithImpl(this._self, this._then);

  final TypicalFailure _self;
  final $Res Function(TypicalFailure) _then;

  /// Create a copy of AppPreferencesFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TypicalFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
