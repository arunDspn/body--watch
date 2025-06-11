// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_widgets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchWidgetsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchWidgetsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchWidgetsEvent()';
  }
}

/// @nodoc
class $SearchWidgetsEventCopyWith<$Res> {
  $SearchWidgetsEventCopyWith(
      SearchWidgetsEvent _, $Res Function(SearchWidgetsEvent) __);
}

/// @nodoc

class _AddData implements SearchWidgetsEvent {
  const _AddData({required final List<LatestMeasurementDisplayModel> list})
      : _list = list;

  final List<LatestMeasurementDisplayModel> _list;
  List<LatestMeasurementDisplayModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  /// Create a copy of SearchWidgetsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddDataCopyWith<_AddData> get copyWith =>
      __$AddDataCopyWithImpl<_AddData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddData &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @override
  String toString() {
    return 'SearchWidgetsEvent.addData(list: $list)';
  }
}

/// @nodoc
abstract mixin class _$AddDataCopyWith<$Res>
    implements $SearchWidgetsEventCopyWith<$Res> {
  factory _$AddDataCopyWith(_AddData value, $Res Function(_AddData) _then) =
      __$AddDataCopyWithImpl;
  @useResult
  $Res call({List<LatestMeasurementDisplayModel> list});
}

/// @nodoc
class __$AddDataCopyWithImpl<$Res> implements _$AddDataCopyWith<$Res> {
  __$AddDataCopyWithImpl(this._self, this._then);

  final _AddData _self;
  final $Res Function(_AddData) _then;

  /// Create a copy of SearchWidgetsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? list = null,
  }) {
    return _then(_AddData(
      list: null == list
          ? _self._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<LatestMeasurementDisplayModel>,
    ));
  }
}

/// @nodoc

class _KeyChanged implements SearchWidgetsEvent {
  const _KeyChanged(this.key);

  final String key;

  /// Create a copy of SearchWidgetsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KeyChangedCopyWith<_KeyChanged> get copyWith =>
      __$KeyChangedCopyWithImpl<_KeyChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KeyChanged &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @override
  String toString() {
    return 'SearchWidgetsEvent.keyChanged(key: $key)';
  }
}

/// @nodoc
abstract mixin class _$KeyChangedCopyWith<$Res>
    implements $SearchWidgetsEventCopyWith<$Res> {
  factory _$KeyChangedCopyWith(
          _KeyChanged value, $Res Function(_KeyChanged) _then) =
      __$KeyChangedCopyWithImpl;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$KeyChangedCopyWithImpl<$Res> implements _$KeyChangedCopyWith<$Res> {
  __$KeyChangedCopyWithImpl(this._self, this._then);

  final _KeyChanged _self;
  final $Res Function(_KeyChanged) _then;

  /// Create a copy of SearchWidgetsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
  }) {
    return _then(_KeyChanged(
      null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SearchWidgetsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchWidgetsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchWidgetsState()';
  }
}

/// @nodoc
class $SearchWidgetsStateCopyWith<$Res> {
  $SearchWidgetsStateCopyWith(
      SearchWidgetsState _, $Res Function(SearchWidgetsState) __);
}

/// @nodoc

class SearchWidgetsStateLoading implements SearchWidgetsState {
  const SearchWidgetsStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchWidgetsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchWidgetsState.loading()';
  }
}

/// @nodoc

class SearchWidgetsStateLoaded implements SearchWidgetsState {
  const SearchWidgetsStateLoaded(
      {required final List<LatestMeasurementDisplayModel> lists})
      : _lists = lists;

  final List<LatestMeasurementDisplayModel> _lists;
  List<LatestMeasurementDisplayModel> get lists {
    if (_lists is EqualUnmodifiableListView) return _lists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lists);
  }

  /// Create a copy of SearchWidgetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchWidgetsStateLoadedCopyWith<SearchWidgetsStateLoaded> get copyWith =>
      _$SearchWidgetsStateLoadedCopyWithImpl<SearchWidgetsStateLoaded>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchWidgetsStateLoaded &&
            const DeepCollectionEquality().equals(other._lists, _lists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lists));

  @override
  String toString() {
    return 'SearchWidgetsState.loaded(lists: $lists)';
  }
}

/// @nodoc
abstract mixin class $SearchWidgetsStateLoadedCopyWith<$Res>
    implements $SearchWidgetsStateCopyWith<$Res> {
  factory $SearchWidgetsStateLoadedCopyWith(SearchWidgetsStateLoaded value,
          $Res Function(SearchWidgetsStateLoaded) _then) =
      _$SearchWidgetsStateLoadedCopyWithImpl;
  @useResult
  $Res call({List<LatestMeasurementDisplayModel> lists});
}

/// @nodoc
class _$SearchWidgetsStateLoadedCopyWithImpl<$Res>
    implements $SearchWidgetsStateLoadedCopyWith<$Res> {
  _$SearchWidgetsStateLoadedCopyWithImpl(this._self, this._then);

  final SearchWidgetsStateLoaded _self;
  final $Res Function(SearchWidgetsStateLoaded) _then;

  /// Create a copy of SearchWidgetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lists = null,
  }) {
    return _then(SearchWidgetsStateLoaded(
      lists: null == lists
          ? _self._lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<LatestMeasurementDisplayModel>,
    ));
  }
}

/// @nodoc

class SearchWidgetsStateFailed implements SearchWidgetsState {
  const SearchWidgetsStateFailed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchWidgetsStateFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchWidgetsState.failed()';
  }
}

// dart format on
