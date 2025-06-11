// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_picture_to_compare_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoadPictureToCompareState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPictureToCompareState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadPictureToCompareState()';
  }
}

/// @nodoc
class $LoadPictureToCompareStateCopyWith<$Res> {
  $LoadPictureToCompareStateCopyWith(
      LoadPictureToCompareState _, $Res Function(LoadPictureToCompareState) __);
}

/// @nodoc

class LoadPictureToCompareStateInitial implements LoadPictureToCompareState {
  const LoadPictureToCompareStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPictureToCompareStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadPictureToCompareState.initial()';
  }
}

/// @nodoc

class LoadPictureToCompareStateLoading implements LoadPictureToCompareState {
  const LoadPictureToCompareStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPictureToCompareStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadPictureToCompareState.loading()';
  }
}

/// @nodoc

class LoadPictureToCompareStateLoaded implements LoadPictureToCompareState {
  const LoadPictureToCompareStateLoaded({required this.compareImagesModel});

  final CompareImagesModel compareImagesModel;

  /// Create a copy of LoadPictureToCompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadPictureToCompareStateLoadedCopyWith<LoadPictureToCompareStateLoaded>
      get copyWith => _$LoadPictureToCompareStateLoadedCopyWithImpl<
          LoadPictureToCompareStateLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPictureToCompareStateLoaded &&
            (identical(other.compareImagesModel, compareImagesModel) ||
                other.compareImagesModel == compareImagesModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, compareImagesModel);

  @override
  String toString() {
    return 'LoadPictureToCompareState.loaded(compareImagesModel: $compareImagesModel)';
  }
}

/// @nodoc
abstract mixin class $LoadPictureToCompareStateLoadedCopyWith<$Res>
    implements $LoadPictureToCompareStateCopyWith<$Res> {
  factory $LoadPictureToCompareStateLoadedCopyWith(
          LoadPictureToCompareStateLoaded value,
          $Res Function(LoadPictureToCompareStateLoaded) _then) =
      _$LoadPictureToCompareStateLoadedCopyWithImpl;
  @useResult
  $Res call({CompareImagesModel compareImagesModel});
}

/// @nodoc
class _$LoadPictureToCompareStateLoadedCopyWithImpl<$Res>
    implements $LoadPictureToCompareStateLoadedCopyWith<$Res> {
  _$LoadPictureToCompareStateLoadedCopyWithImpl(this._self, this._then);

  final LoadPictureToCompareStateLoaded _self;
  final $Res Function(LoadPictureToCompareStateLoaded) _then;

  /// Create a copy of LoadPictureToCompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? compareImagesModel = null,
  }) {
    return _then(LoadPictureToCompareStateLoaded(
      compareImagesModel: null == compareImagesModel
          ? _self.compareImagesModel
          : compareImagesModel // ignore: cast_nullable_to_non_nullable
              as CompareImagesModel,
    ));
  }
}

/// @nodoc

class LoadPictureToCompareStateError implements LoadPictureToCompareState {
  const LoadPictureToCompareStateError(this.message);

  final String message;

  /// Create a copy of LoadPictureToCompareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadPictureToCompareStateErrorCopyWith<LoadPictureToCompareStateError>
      get copyWith => _$LoadPictureToCompareStateErrorCopyWithImpl<
          LoadPictureToCompareStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPictureToCompareStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LoadPictureToCompareState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LoadPictureToCompareStateErrorCopyWith<$Res>
    implements $LoadPictureToCompareStateCopyWith<$Res> {
  factory $LoadPictureToCompareStateErrorCopyWith(
          LoadPictureToCompareStateError value,
          $Res Function(LoadPictureToCompareStateError) _then) =
      _$LoadPictureToCompareStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LoadPictureToCompareStateErrorCopyWithImpl<$Res>
    implements $LoadPictureToCompareStateErrorCopyWith<$Res> {
  _$LoadPictureToCompareStateErrorCopyWithImpl(this._self, this._then);

  final LoadPictureToCompareStateError _self;
  final $Res Function(LoadPictureToCompareStateError) _then;

  /// Create a copy of LoadPictureToCompareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LoadPictureToCompareStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
