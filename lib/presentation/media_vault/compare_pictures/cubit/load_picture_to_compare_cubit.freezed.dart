// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [LoadPictureToCompareState].
extension LoadPictureToCompareStatePatterns on LoadPictureToCompareState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPictureToCompareStateInitial value)? initial,
    TResult Function(LoadPictureToCompareStateLoading value)? loading,
    TResult Function(LoadPictureToCompareStateLoaded value)? loaded,
    TResult Function(LoadPictureToCompareStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadPictureToCompareStateInitial() when initial != null:
        return initial(_that);
      case LoadPictureToCompareStateLoading() when loading != null:
        return loading(_that);
      case LoadPictureToCompareStateLoaded() when loaded != null:
        return loaded(_that);
      case LoadPictureToCompareStateError() when error != null:
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPictureToCompareStateInitial value) initial,
    required TResult Function(LoadPictureToCompareStateLoading value) loading,
    required TResult Function(LoadPictureToCompareStateLoaded value) loaded,
    required TResult Function(LoadPictureToCompareStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPictureToCompareStateInitial():
        return initial(_that);
      case LoadPictureToCompareStateLoading():
        return loading(_that);
      case LoadPictureToCompareStateLoaded():
        return loaded(_that);
      case LoadPictureToCompareStateError():
        return error(_that);
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPictureToCompareStateInitial value)? initial,
    TResult? Function(LoadPictureToCompareStateLoading value)? loading,
    TResult? Function(LoadPictureToCompareStateLoaded value)? loaded,
    TResult? Function(LoadPictureToCompareStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPictureToCompareStateInitial() when initial != null:
        return initial(_that);
      case LoadPictureToCompareStateLoading() when loading != null:
        return loading(_that);
      case LoadPictureToCompareStateLoaded() when loaded != null:
        return loaded(_that);
      case LoadPictureToCompareStateError() when error != null:
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CompareImagesModel compareImagesModel)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadPictureToCompareStateInitial() when initial != null:
        return initial();
      case LoadPictureToCompareStateLoading() when loading != null:
        return loading();
      case LoadPictureToCompareStateLoaded() when loaded != null:
        return loaded(_that.compareImagesModel);
      case LoadPictureToCompareStateError() when error != null:
        return error(_that.message);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CompareImagesModel compareImagesModel) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPictureToCompareStateInitial():
        return initial();
      case LoadPictureToCompareStateLoading():
        return loading();
      case LoadPictureToCompareStateLoaded():
        return loaded(_that.compareImagesModel);
      case LoadPictureToCompareStateError():
        return error(_that.message);
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CompareImagesModel compareImagesModel)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LoadPictureToCompareStateInitial() when initial != null:
        return initial();
      case LoadPictureToCompareStateLoading() when loading != null:
        return loading();
      case LoadPictureToCompareStateLoaded() when loaded != null:
        return loaded(_that.compareImagesModel);
      case LoadPictureToCompareStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
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
