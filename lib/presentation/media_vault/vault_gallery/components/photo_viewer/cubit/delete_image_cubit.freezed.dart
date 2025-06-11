// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_image_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteImageState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteImageState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteImageState()';
  }
}

/// @nodoc
class $DeleteImageStateCopyWith<$Res> {
  $DeleteImageStateCopyWith(
      DeleteImageState _, $Res Function(DeleteImageState) __);
}

/// @nodoc

class DeleteImageStateInitial implements DeleteImageState {
  const DeleteImageStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteImageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteImageState.initial()';
  }
}

/// @nodoc

class DeleteImageStateLoading implements DeleteImageState {
  const DeleteImageStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeleteImageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeleteImageState.loading()';
  }
}

/// @nodoc

class DeleteImageStateSuccess implements DeleteImageState {
  const DeleteImageStateSuccess({required this.deletedItemId});

  final String deletedItemId;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteImageStateSuccessCopyWith<DeleteImageStateSuccess> get copyWith =>
      _$DeleteImageStateSuccessCopyWithImpl<DeleteImageStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteImageStateSuccess &&
            (identical(other.deletedItemId, deletedItemId) ||
                other.deletedItemId == deletedItemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deletedItemId);

  @override
  String toString() {
    return 'DeleteImageState.success(deletedItemId: $deletedItemId)';
  }
}

/// @nodoc
abstract mixin class $DeleteImageStateSuccessCopyWith<$Res>
    implements $DeleteImageStateCopyWith<$Res> {
  factory $DeleteImageStateSuccessCopyWith(DeleteImageStateSuccess value,
          $Res Function(DeleteImageStateSuccess) _then) =
      _$DeleteImageStateSuccessCopyWithImpl;
  @useResult
  $Res call({String deletedItemId});
}

/// @nodoc
class _$DeleteImageStateSuccessCopyWithImpl<$Res>
    implements $DeleteImageStateSuccessCopyWith<$Res> {
  _$DeleteImageStateSuccessCopyWithImpl(this._self, this._then);

  final DeleteImageStateSuccess _self;
  final $Res Function(DeleteImageStateSuccess) _then;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? deletedItemId = null,
  }) {
    return _then(DeleteImageStateSuccess(
      deletedItemId: null == deletedItemId
          ? _self.deletedItemId
          : deletedItemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeleteImageStateFailed implements DeleteImageState {
  const DeleteImageStateFailed(this.message);

  final String message;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteImageStateFailedCopyWith<DeleteImageStateFailed> get copyWith =>
      _$DeleteImageStateFailedCopyWithImpl<DeleteImageStateFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteImageStateFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DeleteImageState.failed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DeleteImageStateFailedCopyWith<$Res>
    implements $DeleteImageStateCopyWith<$Res> {
  factory $DeleteImageStateFailedCopyWith(DeleteImageStateFailed value,
          $Res Function(DeleteImageStateFailed) _then) =
      _$DeleteImageStateFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DeleteImageStateFailedCopyWithImpl<$Res>
    implements $DeleteImageStateFailedCopyWith<$Res> {
  _$DeleteImageStateFailedCopyWithImpl(this._self, this._then);

  final DeleteImageStateFailed _self;
  final $Res Function(DeleteImageStateFailed) _then;

  /// Create a copy of DeleteImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DeleteImageStateFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
