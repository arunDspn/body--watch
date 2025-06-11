// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_pictures_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoadPicturesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadPicturesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadPicturesState()';
  }
}

/// @nodoc
class $LoadPicturesStateCopyWith<$Res> {
  $LoadPicturesStateCopyWith(
      LoadPicturesState _, $Res Function(LoadPicturesState) __);
}

/// @nodoc

class LoadPicturesStateLoading implements LoadPicturesState {
  const LoadPicturesStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadPicturesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadPicturesState.loading()';
  }
}

/// @nodoc

class LoadPicturesStateLoaded implements LoadPicturesState {
  const LoadPicturesStateLoaded(final List<VaultImage> pictures)
      : _pictures = pictures;

  final List<VaultImage> _pictures;
  List<VaultImage> get pictures {
    if (_pictures is EqualUnmodifiableListView) return _pictures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pictures);
  }

  /// Create a copy of LoadPicturesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadPicturesStateLoadedCopyWith<LoadPicturesStateLoaded> get copyWith =>
      _$LoadPicturesStateLoadedCopyWithImpl<LoadPicturesStateLoaded>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPicturesStateLoaded &&
            const DeepCollectionEquality().equals(other._pictures, _pictures));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pictures));

  @override
  String toString() {
    return 'LoadPicturesState.loaded(pictures: $pictures)';
  }
}

/// @nodoc
abstract mixin class $LoadPicturesStateLoadedCopyWith<$Res>
    implements $LoadPicturesStateCopyWith<$Res> {
  factory $LoadPicturesStateLoadedCopyWith(LoadPicturesStateLoaded value,
          $Res Function(LoadPicturesStateLoaded) _then) =
      _$LoadPicturesStateLoadedCopyWithImpl;
  @useResult
  $Res call({List<VaultImage> pictures});
}

/// @nodoc
class _$LoadPicturesStateLoadedCopyWithImpl<$Res>
    implements $LoadPicturesStateLoadedCopyWith<$Res> {
  _$LoadPicturesStateLoadedCopyWithImpl(this._self, this._then);

  final LoadPicturesStateLoaded _self;
  final $Res Function(LoadPicturesStateLoaded) _then;

  /// Create a copy of LoadPicturesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pictures = null,
  }) {
    return _then(LoadPicturesStateLoaded(
      null == pictures
          ? _self._pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<VaultImage>,
    ));
  }
}

/// @nodoc

class LoadPicturesStateFailed implements LoadPicturesState {
  const LoadPicturesStateFailed(this.message);

  final String message;

  /// Create a copy of LoadPicturesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadPicturesStateFailedCopyWith<LoadPicturesStateFailed> get copyWith =>
      _$LoadPicturesStateFailedCopyWithImpl<LoadPicturesStateFailed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPicturesStateFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LoadPicturesState.failed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LoadPicturesStateFailedCopyWith<$Res>
    implements $LoadPicturesStateCopyWith<$Res> {
  factory $LoadPicturesStateFailedCopyWith(LoadPicturesStateFailed value,
          $Res Function(LoadPicturesStateFailed) _then) =
      _$LoadPicturesStateFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LoadPicturesStateFailedCopyWithImpl<$Res>
    implements $LoadPicturesStateFailedCopyWith<$Res> {
  _$LoadPicturesStateFailedCopyWithImpl(this._self, this._then);

  final LoadPicturesStateFailed _self;
  final $Res Function(LoadPicturesStateFailed) _then;

  /// Create a copy of LoadPicturesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LoadPicturesStateFailed(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
