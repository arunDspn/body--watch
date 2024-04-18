// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_widgets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchWidgetsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LatestMeasurementDisplayModel> list) addData,
    required TResult Function(String key) keyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<LatestMeasurementDisplayModel> list)? addData,
    TResult? Function(String key)? keyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LatestMeasurementDisplayModel> list)? addData,
    TResult Function(String key)? keyChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddData value) addData,
    required TResult Function(_KeyChanged value) keyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddData value)? addData,
    TResult? Function(_KeyChanged value)? keyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddData value)? addData,
    TResult Function(_KeyChanged value)? keyChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchWidgetsEventCopyWith<$Res> {
  factory $SearchWidgetsEventCopyWith(
          SearchWidgetsEvent value, $Res Function(SearchWidgetsEvent) then) =
      _$SearchWidgetsEventCopyWithImpl<$Res, SearchWidgetsEvent>;
}

/// @nodoc
class _$SearchWidgetsEventCopyWithImpl<$Res, $Val extends SearchWidgetsEvent>
    implements $SearchWidgetsEventCopyWith<$Res> {
  _$SearchWidgetsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddDataImplCopyWith<$Res> {
  factory _$$AddDataImplCopyWith(
          _$AddDataImpl value, $Res Function(_$AddDataImpl) then) =
      __$$AddDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<LatestMeasurementDisplayModel> list});
}

/// @nodoc
class __$$AddDataImplCopyWithImpl<$Res>
    extends _$SearchWidgetsEventCopyWithImpl<$Res, _$AddDataImpl>
    implements _$$AddDataImplCopyWith<$Res> {
  __$$AddDataImplCopyWithImpl(
      _$AddDataImpl _value, $Res Function(_$AddDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$AddDataImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<LatestMeasurementDisplayModel>,
    ));
  }
}

/// @nodoc

class _$AddDataImpl implements _AddData {
  const _$AddDataImpl({required final List<LatestMeasurementDisplayModel> list})
      : _list = list;

  final List<LatestMeasurementDisplayModel> _list;
  @override
  List<LatestMeasurementDisplayModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'SearchWidgetsEvent.addData(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDataImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDataImplCopyWith<_$AddDataImpl> get copyWith =>
      __$$AddDataImplCopyWithImpl<_$AddDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LatestMeasurementDisplayModel> list) addData,
    required TResult Function(String key) keyChanged,
  }) {
    return addData(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<LatestMeasurementDisplayModel> list)? addData,
    TResult? Function(String key)? keyChanged,
  }) {
    return addData?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LatestMeasurementDisplayModel> list)? addData,
    TResult Function(String key)? keyChanged,
    required TResult orElse(),
  }) {
    if (addData != null) {
      return addData(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddData value) addData,
    required TResult Function(_KeyChanged value) keyChanged,
  }) {
    return addData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddData value)? addData,
    TResult? Function(_KeyChanged value)? keyChanged,
  }) {
    return addData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddData value)? addData,
    TResult Function(_KeyChanged value)? keyChanged,
    required TResult orElse(),
  }) {
    if (addData != null) {
      return addData(this);
    }
    return orElse();
  }
}

abstract class _AddData implements SearchWidgetsEvent {
  const factory _AddData(
          {required final List<LatestMeasurementDisplayModel> list}) =
      _$AddDataImpl;

  List<LatestMeasurementDisplayModel> get list;
  @JsonKey(ignore: true)
  _$$AddDataImplCopyWith<_$AddDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeyChangedImplCopyWith<$Res> {
  factory _$$KeyChangedImplCopyWith(
          _$KeyChangedImpl value, $Res Function(_$KeyChangedImpl) then) =
      __$$KeyChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$KeyChangedImplCopyWithImpl<$Res>
    extends _$SearchWidgetsEventCopyWithImpl<$Res, _$KeyChangedImpl>
    implements _$$KeyChangedImplCopyWith<$Res> {
  __$$KeyChangedImplCopyWithImpl(
      _$KeyChangedImpl _value, $Res Function(_$KeyChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$KeyChangedImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$KeyChangedImpl implements _KeyChanged {
  const _$KeyChangedImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'SearchWidgetsEvent.keyChanged(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyChangedImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyChangedImplCopyWith<_$KeyChangedImpl> get copyWith =>
      __$$KeyChangedImplCopyWithImpl<_$KeyChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LatestMeasurementDisplayModel> list) addData,
    required TResult Function(String key) keyChanged,
  }) {
    return keyChanged(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<LatestMeasurementDisplayModel> list)? addData,
    TResult? Function(String key)? keyChanged,
  }) {
    return keyChanged?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LatestMeasurementDisplayModel> list)? addData,
    TResult Function(String key)? keyChanged,
    required TResult orElse(),
  }) {
    if (keyChanged != null) {
      return keyChanged(key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddData value) addData,
    required TResult Function(_KeyChanged value) keyChanged,
  }) {
    return keyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddData value)? addData,
    TResult? Function(_KeyChanged value)? keyChanged,
  }) {
    return keyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddData value)? addData,
    TResult Function(_KeyChanged value)? keyChanged,
    required TResult orElse(),
  }) {
    if (keyChanged != null) {
      return keyChanged(this);
    }
    return orElse();
  }
}

abstract class _KeyChanged implements SearchWidgetsEvent {
  const factory _KeyChanged(final String key) = _$KeyChangedImpl;

  String get key;
  @JsonKey(ignore: true)
  _$$KeyChangedImplCopyWith<_$KeyChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchWidgetsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<LatestMeasurementDisplayModel> lists) loaded,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchWidgetsStateCopyWith<$Res> {
  factory $SearchWidgetsStateCopyWith(
          SearchWidgetsState value, $Res Function(SearchWidgetsState) then) =
      _$SearchWidgetsStateCopyWithImpl<$Res, SearchWidgetsState>;
}

/// @nodoc
class _$SearchWidgetsStateCopyWithImpl<$Res, $Val extends SearchWidgetsState>
    implements $SearchWidgetsStateCopyWith<$Res> {
  _$SearchWidgetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SearchWidgetsStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'SearchWidgetsState.loading()';
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
    required TResult Function() loading,
    required TResult Function(List<LatestMeasurementDisplayModel> lists) loaded,
    required TResult Function() failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult? Function()? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult Function()? failed,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchWidgetsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<LatestMeasurementDisplayModel> lists});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SearchWidgetsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lists = null,
  }) {
    return _then(_$LoadedImpl(
      lists: null == lists
          ? _value._lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<LatestMeasurementDisplayModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required final List<LatestMeasurementDisplayModel> lists})
      : _lists = lists;

  final List<LatestMeasurementDisplayModel> _lists;
  @override
  List<LatestMeasurementDisplayModel> get lists {
    if (_lists is EqualUnmodifiableListView) return _lists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lists);
  }

  @override
  String toString() {
    return 'SearchWidgetsState.loaded(lists: $lists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._lists, _lists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<LatestMeasurementDisplayModel> lists) loaded,
    required TResult Function() failed,
  }) {
    return loaded(lists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult? Function()? failed,
  }) {
    return loaded?.call(lists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(lists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SearchWidgetsState {
  const factory _Loaded(
          {required final List<LatestMeasurementDisplayModel> lists}) =
      _$LoadedImpl;

  List<LatestMeasurementDisplayModel> get lists;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$SearchWidgetsStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl();

  @override
  String toString() {
    return 'SearchWidgetsState.failed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<LatestMeasurementDisplayModel> lists) loaded,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<LatestMeasurementDisplayModel> lists)? loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements SearchWidgetsState {
  const factory _Failed() = _$FailedImpl;
}
