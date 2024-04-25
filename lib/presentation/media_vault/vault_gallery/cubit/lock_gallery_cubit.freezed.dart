// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_gallery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LockGalleryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() locked,
    required TResult Function() unlocked,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? locked,
    TResult? Function()? unlocked,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? locked,
    TResult Function()? unlocked,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Locked value) locked,
    required TResult Function(_Unlocked value) unlocked,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Locked value)? locked,
    TResult? Function(_Unlocked value)? unlocked,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Locked value)? locked,
    TResult Function(_Unlocked value)? unlocked,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LockGalleryStateCopyWith<$Res> {
  factory $LockGalleryStateCopyWith(
          LockGalleryState value, $Res Function(LockGalleryState) then) =
      _$LockGalleryStateCopyWithImpl<$Res, LockGalleryState>;
}

/// @nodoc
class _$LockGalleryStateCopyWithImpl<$Res, $Val extends LockGalleryState>
    implements $LockGalleryStateCopyWith<$Res> {
  _$LockGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LockedImplCopyWith<$Res> {
  factory _$$LockedImplCopyWith(
          _$LockedImpl value, $Res Function(_$LockedImpl) then) =
      __$$LockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LockedImplCopyWithImpl<$Res>
    extends _$LockGalleryStateCopyWithImpl<$Res, _$LockedImpl>
    implements _$$LockedImplCopyWith<$Res> {
  __$$LockedImplCopyWithImpl(
      _$LockedImpl _value, $Res Function(_$LockedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LockedImpl implements _Locked {
  const _$LockedImpl();

  @override
  String toString() {
    return 'LockGalleryState.locked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() locked,
    required TResult Function() unlocked,
    required TResult Function() initial,
  }) {
    return locked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? locked,
    TResult? Function()? unlocked,
    TResult? Function()? initial,
  }) {
    return locked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? locked,
    TResult Function()? unlocked,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (locked != null) {
      return locked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Locked value) locked,
    required TResult Function(_Unlocked value) unlocked,
    required TResult Function(_Initial value) initial,
  }) {
    return locked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Locked value)? locked,
    TResult? Function(_Unlocked value)? unlocked,
    TResult? Function(_Initial value)? initial,
  }) {
    return locked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Locked value)? locked,
    TResult Function(_Unlocked value)? unlocked,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (locked != null) {
      return locked(this);
    }
    return orElse();
  }
}

abstract class _Locked implements LockGalleryState {
  const factory _Locked() = _$LockedImpl;
}

/// @nodoc
abstract class _$$UnlockedImplCopyWith<$Res> {
  factory _$$UnlockedImplCopyWith(
          _$UnlockedImpl value, $Res Function(_$UnlockedImpl) then) =
      __$$UnlockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnlockedImplCopyWithImpl<$Res>
    extends _$LockGalleryStateCopyWithImpl<$Res, _$UnlockedImpl>
    implements _$$UnlockedImplCopyWith<$Res> {
  __$$UnlockedImplCopyWithImpl(
      _$UnlockedImpl _value, $Res Function(_$UnlockedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnlockedImpl implements _Unlocked {
  const _$UnlockedImpl();

  @override
  String toString() {
    return 'LockGalleryState.unlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnlockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() locked,
    required TResult Function() unlocked,
    required TResult Function() initial,
  }) {
    return unlocked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? locked,
    TResult? Function()? unlocked,
    TResult? Function()? initial,
  }) {
    return unlocked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? locked,
    TResult Function()? unlocked,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (unlocked != null) {
      return unlocked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Locked value) locked,
    required TResult Function(_Unlocked value) unlocked,
    required TResult Function(_Initial value) initial,
  }) {
    return unlocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Locked value)? locked,
    TResult? Function(_Unlocked value)? unlocked,
    TResult? Function(_Initial value)? initial,
  }) {
    return unlocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Locked value)? locked,
    TResult Function(_Unlocked value)? unlocked,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (unlocked != null) {
      return unlocked(this);
    }
    return orElse();
  }
}

abstract class _Unlocked implements LockGalleryState {
  const factory _Unlocked() = _$UnlockedImpl;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LockGalleryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LockGalleryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() locked,
    required TResult Function() unlocked,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? locked,
    TResult? Function()? unlocked,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? locked,
    TResult Function()? unlocked,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Locked value) locked,
    required TResult Function(_Unlocked value) unlocked,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Locked value)? locked,
    TResult? Function(_Unlocked value)? unlocked,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Locked value)? locked,
    TResult Function(_Unlocked value)? unlocked,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LockGalleryState {
  const factory _Initial() = _$InitialImpl;
}
