// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackupRestoreDataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BackupRestoreDataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState()';
  }
}

/// @nodoc
class $BackupRestoreDataStateCopyWith<$Res> {
  $BackupRestoreDataStateCopyWith(
      BackupRestoreDataState _, $Res Function(BackupRestoreDataState) __);
}

/// @nodoc

class BackupRestoreDataStateInitial implements BackupRestoreDataState {
  const BackupRestoreDataStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState.initial()';
  }
}

/// @nodoc

class BackupRestoreDataStateSuccess implements BackupRestoreDataState {
  const BackupRestoreDataStateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState.success()';
  }
}

/// @nodoc

class BackupRestoreDataStateLoading implements BackupRestoreDataState {
  const BackupRestoreDataStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BackupRestoreDataState.loading()';
  }
}

/// @nodoc

class BackupRestoreDataStateFailed implements BackupRestoreDataState {
  const BackupRestoreDataStateFailed(this.msg);

  final String msg;

  /// Create a copy of BackupRestoreDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackupRestoreDataStateFailedCopyWith<BackupRestoreDataStateFailed>
      get copyWith => _$BackupRestoreDataStateFailedCopyWithImpl<
          BackupRestoreDataStateFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupRestoreDataStateFailed &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @override
  String toString() {
    return 'BackupRestoreDataState.failed(msg: $msg)';
  }
}

/// @nodoc
abstract mixin class $BackupRestoreDataStateFailedCopyWith<$Res>
    implements $BackupRestoreDataStateCopyWith<$Res> {
  factory $BackupRestoreDataStateFailedCopyWith(
          BackupRestoreDataStateFailed value,
          $Res Function(BackupRestoreDataStateFailed) _then) =
      _$BackupRestoreDataStateFailedCopyWithImpl;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$BackupRestoreDataStateFailedCopyWithImpl<$Res>
    implements $BackupRestoreDataStateFailedCopyWith<$Res> {
  _$BackupRestoreDataStateFailedCopyWithImpl(this._self, this._then);

  final BackupRestoreDataStateFailed _self;
  final $Res Function(BackupRestoreDataStateFailed) _then;

  /// Create a copy of BackupRestoreDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? msg = null,
  }) {
    return _then(BackupRestoreDataStateFailed(
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
