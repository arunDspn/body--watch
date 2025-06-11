// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_all_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteAllDataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteAllDataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteAllDataState()';
  }
}

/// @nodoc
class $DeleteAllDataStateCopyWith<$Res> {
  $DeleteAllDataStateCopyWith(
      DeleteAllDataState _, $Res Function(DeleteAllDataState) __);
}

/// @nodoc

class DeleteAllDataStateInitial implements DeleteAllDataState {
  const DeleteAllDataStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteAllDataStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteAllDataState.initial()';
  }
}

/// @nodoc

class DeleteAllDataStateLoading implements DeleteAllDataState {
  const DeleteAllDataStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteAllDataStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteAllDataState.loading()';
  }
}

/// @nodoc

class DeleteAllDataStateSuccess implements DeleteAllDataState {
  const DeleteAllDataStateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteAllDataStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteAllDataState.success()';
  }
}

/// @nodoc

class DeleteAllDataStateFailed implements DeleteAllDataState {
  const DeleteAllDataStateFailed(this.msg);

  final String msg;

  /// Create a copy of DeleteAllDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteAllDataStateFailedCopyWith<DeleteAllDataStateFailed> get copyWith =>
      _$DeleteAllDataStateFailedCopyWithImpl<DeleteAllDataStateFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteAllDataStateFailed &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @override
  String toString() {
    return 'DeleteAllDataState.failed(msg: $msg)';
  }
}

/// @nodoc
abstract mixin class $DeleteAllDataStateFailedCopyWith<$Res>
    implements $DeleteAllDataStateCopyWith<$Res> {
  factory $DeleteAllDataStateFailedCopyWith(DeleteAllDataStateFailed value,
          $Res Function(DeleteAllDataStateFailed) _then) =
      _$DeleteAllDataStateFailedCopyWithImpl;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$DeleteAllDataStateFailedCopyWithImpl<$Res>
    implements $DeleteAllDataStateFailedCopyWith<$Res> {
  _$DeleteAllDataStateFailedCopyWithImpl(this._self, this._then);

  final DeleteAllDataStateFailed _self;
  final $Res Function(DeleteAllDataStateFailed) _then;

  /// Create a copy of DeleteAllDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? msg = null,
  }) {
    return _then(DeleteAllDataStateFailed(
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
