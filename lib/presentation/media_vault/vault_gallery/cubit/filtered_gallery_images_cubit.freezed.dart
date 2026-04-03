// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 List<VaultImageModel> get galleryImages;
/// Create a copy of FilteredGalleryImagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilteredGalleryImagesStateCopyWith<FilteredGalleryImagesState> get copyWith => _$FilteredGalleryImagesStateCopyWithImpl<FilteredGalleryImagesState>(this as FilteredGalleryImagesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilteredGalleryImagesState&&const DeepCollectionEquality().equals(other.galleryImages, galleryImages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(galleryImages));

@override
String toString() {
  return 'FilteredGalleryImagesState(galleryImages: $galleryImages)';
}


}

/// @nodoc
abstract mixin class $FilteredGalleryImagesStateCopyWith<$Res>  {
  factory $FilteredGalleryImagesStateCopyWith(FilteredGalleryImagesState value, $Res Function(FilteredGalleryImagesState) _then) = _$FilteredGalleryImagesStateCopyWithImpl;
@useResult
$Res call({
 List<VaultImageModel> galleryImages
});




}
/// @nodoc
class _$FilteredGalleryImagesStateCopyWithImpl<$Res>
    implements $FilteredGalleryImagesStateCopyWith<$Res> {
  _$FilteredGalleryImagesStateCopyWithImpl(this._self, this._then);

  final FilteredGalleryImagesState _self;
  final $Res Function(FilteredGalleryImagesState) _then;

/// Create a copy of FilteredGalleryImagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? galleryImages = null,}) {
  return _then(_self.copyWith(
galleryImages: null == galleryImages ? _self.galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<VaultImageModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FilteredGalleryImagesState].
extension FilteredGalleryImagesStatePatterns on FilteredGalleryImagesState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FilteredGalleryImagesData value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FilteredGalleryImagesData() when data != null:
return data(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FilteredGalleryImagesData value)  data,}){
final _that = this;
switch (_that) {
case FilteredGalleryImagesData():
return data(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FilteredGalleryImagesData value)?  data,}){
final _that = this;
switch (_that) {
case FilteredGalleryImagesData() when data != null:
return data(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<VaultImageModel> galleryImages)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FilteredGalleryImagesData() when data != null:
return data(_that.galleryImages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<VaultImageModel> galleryImages)  data,}) {final _that = this;
switch (_that) {
case FilteredGalleryImagesData():
return data(_that.galleryImages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<VaultImageModel> galleryImages)?  data,}) {final _that = this;
switch (_that) {
case FilteredGalleryImagesData() when data != null:
return data(_that.galleryImages);case _:
  return null;

}
}

}

/// @nodoc


class FilteredGalleryImagesData implements FilteredGalleryImagesState {
  const FilteredGalleryImagesData({required final  List<VaultImageModel> galleryImages}): _galleryImages = galleryImages;
  

 final  List<VaultImageModel> _galleryImages;
@override List<VaultImageModel> get galleryImages {
  if (_galleryImages is EqualUnmodifiableListView) return _galleryImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImages);
}


/// Create a copy of FilteredGalleryImagesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilteredGalleryImagesDataCopyWith<FilteredGalleryImagesData> get copyWith => _$FilteredGalleryImagesDataCopyWithImpl<FilteredGalleryImagesData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilteredGalleryImagesData&&const DeepCollectionEquality().equals(other._galleryImages, _galleryImages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_galleryImages));

@override
String toString() {
  return 'FilteredGalleryImagesState.data(galleryImages: $galleryImages)';
}


}

/// @nodoc
abstract mixin class $FilteredGalleryImagesDataCopyWith<$Res> implements $FilteredGalleryImagesStateCopyWith<$Res> {
  factory $FilteredGalleryImagesDataCopyWith(FilteredGalleryImagesData value, $Res Function(FilteredGalleryImagesData) _then) = _$FilteredGalleryImagesDataCopyWithImpl;
@override @useResult
$Res call({
 List<VaultImageModel> galleryImages
});




}
/// @nodoc
class _$FilteredGalleryImagesDataCopyWithImpl<$Res>
    implements $FilteredGalleryImagesDataCopyWith<$Res> {
  _$FilteredGalleryImagesDataCopyWithImpl(this._self, this._then);

  final FilteredGalleryImagesData _self;
  final $Res Function(FilteredGalleryImagesData) _then;

/// Create a copy of FilteredGalleryImagesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? galleryImages = null,}) {
  return _then(FilteredGalleryImagesData(
galleryImages: null == galleryImages ? _self._galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<VaultImageModel>,
  ));
}


}

// dart format on
