// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filtered_gallery_images_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilteredGalleryImagesState {
  List<VaultImage> get galleryImages;

  /// Create a copy of FilteredGalleryImagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilteredGalleryImagesStateCopyWith<FilteredGalleryImagesState>
      get copyWith =>
          _$FilteredGalleryImagesStateCopyWithImpl<FilteredGalleryImagesState>(
              this as FilteredGalleryImagesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilteredGalleryImagesState &&
            const DeepCollectionEquality()
                .equals(other.galleryImages, galleryImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(galleryImages));

  @override
  String toString() {
    return 'FilteredGalleryImagesState(galleryImages: $galleryImages)';
  }
}

/// @nodoc
abstract mixin class $FilteredGalleryImagesStateCopyWith<$Res> {
  factory $FilteredGalleryImagesStateCopyWith(FilteredGalleryImagesState value,
          $Res Function(FilteredGalleryImagesState) _then) =
      _$FilteredGalleryImagesStateCopyWithImpl;
  @useResult
  $Res call({List<VaultImage> galleryImages});
}

/// @nodoc
class _$FilteredGalleryImagesStateCopyWithImpl<$Res>
    implements $FilteredGalleryImagesStateCopyWith<$Res> {
  _$FilteredGalleryImagesStateCopyWithImpl(this._self, this._then);

  final FilteredGalleryImagesState _self;
  final $Res Function(FilteredGalleryImagesState) _then;

  /// Create a copy of FilteredGalleryImagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleryImages = null,
  }) {
    return _then(_self.copyWith(
      galleryImages: null == galleryImages
          ? _self.galleryImages
          : galleryImages // ignore: cast_nullable_to_non_nullable
              as List<VaultImage>,
    ));
  }
}

/// @nodoc

class FilteredGalleryImagesData implements FilteredGalleryImagesState {
  const FilteredGalleryImagesData(
      {required final List<VaultImage> galleryImages})
      : _galleryImages = galleryImages;

  final List<VaultImage> _galleryImages;
  @override
  List<VaultImage> get galleryImages {
    if (_galleryImages is EqualUnmodifiableListView) return _galleryImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_galleryImages);
  }

  /// Create a copy of FilteredGalleryImagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilteredGalleryImagesDataCopyWith<FilteredGalleryImagesData> get copyWith =>
      _$FilteredGalleryImagesDataCopyWithImpl<FilteredGalleryImagesData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilteredGalleryImagesData &&
            const DeepCollectionEquality()
                .equals(other._galleryImages, _galleryImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_galleryImages));

  @override
  String toString() {
    return 'FilteredGalleryImagesState.data(galleryImages: $galleryImages)';
  }
}

/// @nodoc
abstract mixin class $FilteredGalleryImagesDataCopyWith<$Res>
    implements $FilteredGalleryImagesStateCopyWith<$Res> {
  factory $FilteredGalleryImagesDataCopyWith(FilteredGalleryImagesData value,
          $Res Function(FilteredGalleryImagesData) _then) =
      _$FilteredGalleryImagesDataCopyWithImpl;
  @override
  @useResult
  $Res call({List<VaultImage> galleryImages});
}

/// @nodoc
class _$FilteredGalleryImagesDataCopyWithImpl<$Res>
    implements $FilteredGalleryImagesDataCopyWith<$Res> {
  _$FilteredGalleryImagesDataCopyWithImpl(this._self, this._then);

  final FilteredGalleryImagesData _self;
  final $Res Function(FilteredGalleryImagesData) _then;

  /// Create a copy of FilteredGalleryImagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? galleryImages = null,
  }) {
    return _then(FilteredGalleryImagesData(
      galleryImages: null == galleryImages
          ? _self._galleryImages
          : galleryImages // ignore: cast_nullable_to_non_nullable
              as List<VaultImage>,
    ));
  }
}

// dart format on
