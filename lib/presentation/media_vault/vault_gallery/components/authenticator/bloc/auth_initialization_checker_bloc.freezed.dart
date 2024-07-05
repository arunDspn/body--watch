// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_initialization_checker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthInitializationCheckerEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInitializationCheckerEventsCopyWith<$Res> {
  factory $AuthInitializationCheckerEventsCopyWith(
          AuthInitializationCheckerEvents value,
          $Res Function(AuthInitializationCheckerEvents) then) =
      _$AuthInitializationCheckerEventsCopyWithImpl<$Res,
          AuthInitializationCheckerEvents>;
}

/// @nodoc
class _$AuthInitializationCheckerEventsCopyWithImpl<$Res,
        $Val extends AuthInitializationCheckerEvents>
    implements $AuthInitializationCheckerEventsCopyWith<$Res> {
  _$AuthInitializationCheckerEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckAuthImplCopyWith<$Res> {
  factory _$$CheckAuthImplCopyWith(
          _$CheckAuthImpl value, $Res Function(_$CheckAuthImpl) then) =
      __$$CheckAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthImplCopyWithImpl<$Res>
    extends _$AuthInitializationCheckerEventsCopyWithImpl<$Res, _$CheckAuthImpl>
    implements _$$CheckAuthImplCopyWith<$Res> {
  __$$CheckAuthImplCopyWithImpl(
      _$CheckAuthImpl _value, $Res Function(_$CheckAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAuthImpl implements _CheckAuth {
  const _$CheckAuthImpl();

  @override
  String toString() {
    return 'AuthInitializationCheckerEvents.checkAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
  }) {
    return checkAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
  }) {
    return checkAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckAuth implements AuthInitializationCheckerEvents {
  const factory _CheckAuth() = _$CheckAuthImpl;
}

/// @nodoc
mixin _$AuthInitializationCheckerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notInitialized,
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notInitialized,
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notInitialized,
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NotInitialized value) notInitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NotInitialized value)? notInitialized,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NotInitialized value)? notInitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInitializationCheckerStateCopyWith<$Res> {
  factory $AuthInitializationCheckerStateCopyWith(
          AuthInitializationCheckerState value,
          $Res Function(AuthInitializationCheckerState) then) =
      _$AuthInitializationCheckerStateCopyWithImpl<$Res,
          AuthInitializationCheckerState>;
}

/// @nodoc
class _$AuthInitializationCheckerStateCopyWithImpl<$Res,
        $Val extends AuthInitializationCheckerState>
    implements $AuthInitializationCheckerStateCopyWith<$Res> {
  _$AuthInitializationCheckerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthInitializationCheckerStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AuthInitializationCheckerState.initial()';
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
    required TResult Function() initial,
    required TResult Function() notInitialized,
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notInitialized,
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notInitialized,
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function(String message)? failed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_NotInitialized value) notInitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NotInitialized value)? notInitialized,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NotInitialized value)? notInitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthInitializationCheckerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NotInitializedImplCopyWith<$Res> {
  factory _$$NotInitializedImplCopyWith(_$NotInitializedImpl value,
          $Res Function(_$NotInitializedImpl) then) =
      __$$NotInitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotInitializedImplCopyWithImpl<$Res>
    extends _$AuthInitializationCheckerStateCopyWithImpl<$Res,
        _$NotInitializedImpl> implements _$$NotInitializedImplCopyWith<$Res> {
  __$$NotInitializedImplCopyWithImpl(
      _$NotInitializedImpl _value, $Res Function(_$NotInitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotInitializedImpl implements _NotInitialized {
  const _$NotInitializedImpl();

  @override
  String toString() {
    return 'AuthInitializationCheckerState.notInitialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotInitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notInitialized,
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) {
    return notInitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notInitialized,
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) {
    return notInitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notInitialized,
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (notInitialized != null) {
      return notInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NotInitialized value) notInitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
  }) {
    return notInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NotInitialized value)? notInitialized,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
  }) {
    return notInitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NotInitialized value)? notInitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (notInitialized != null) {
      return notInitialized(this);
    }
    return orElse();
  }
}

abstract class _NotInitialized implements AuthInitializationCheckerState {
  const factory _NotInitialized() = _$NotInitializedImpl;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$AuthInitializationCheckerStateCopyWithImpl<$Res,
        _$InitializedImpl> implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'AuthInitializationCheckerState.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notInitialized,
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notInitialized,
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notInitialized,
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NotInitialized value) notInitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NotInitialized value)? notInitialized,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NotInitialized value)? notInitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements AuthInitializationCheckerState {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthInitializationCheckerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthInitializationCheckerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notInitialized,
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notInitialized,
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notInitialized,
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NotInitialized value) notInitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NotInitialized value)? notInitialized,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NotInitialized value)? notInitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthInitializationCheckerState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$AuthInitializationCheckerStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthInitializationCheckerState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notInitialized,
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notInitialized,
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notInitialized,
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NotInitialized value) notInitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NotInitialized value)? notInitialized,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NotInitialized value)? notInitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AuthInitializationCheckerState {
  const factory _Failed(final String message) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
