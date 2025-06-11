// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePasswordState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CreatePasswordState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreatePasswordState()';
  }
}

/// @nodoc
class $CreatePasswordStateCopyWith<$Res> {
  $CreatePasswordStateCopyWith(
      CreatePasswordState _, $Res Function(CreatePasswordState) __);
}

/// @nodoc

class CreatePasswordStateInitial implements CreatePasswordState {
  const CreatePasswordStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatePasswordStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreatePasswordState.initial()';
  }
}

/// @nodoc

class CreatePasswordStateLoading implements CreatePasswordState {
  const CreatePasswordStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatePasswordStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreatePasswordState.loading()';
  }
}

/// @nodoc

class CreatePasswordStateSuccess implements CreatePasswordState {
  const CreatePasswordStateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatePasswordStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreatePasswordState.success()';
  }
}

/// @nodoc

class CreatePasswordStateFailed implements CreatePasswordState {
  const CreatePasswordStateFailed(this.message);

  final String message;

  /// Create a copy of CreatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreatePasswordStateFailedCopyWith<CreatePasswordStateFailed> get copyWith =>
      _$CreatePasswordStateFailedCopyWithImpl<CreatePasswordStateFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatePasswordStateFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CreatePasswordState.failed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CreatePasswordStateFailedCopyWith<$Res>
    implements $CreatePasswordStateCopyWith<$Res> {
  factory $CreatePasswordStateFailedCopyWith(CreatePasswordStateFailed value,
          $Res Function(CreatePasswordStateFailed) _then) =
      _$CreatePasswordStateFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CreatePasswordStateFailedCopyWithImpl<$Res>
    implements $CreatePasswordStateFailedCopyWith<$Res> {
  _$CreatePasswordStateFailedCopyWithImpl(this._self, this._then);

  final CreatePasswordStateFailed _self;
  final $Res Function(CreatePasswordStateFailed) _then;

  /// Create a copy of CreatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CreatePasswordStateFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
