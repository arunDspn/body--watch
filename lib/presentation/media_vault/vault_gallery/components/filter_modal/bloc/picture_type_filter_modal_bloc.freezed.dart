// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_type_filter_modal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PictureTypeFilterModalEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PictureTypeFilterModalEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PictureTypeFilterModalEvent()';
  }
}

/// @nodoc
class $PictureTypeFilterModalEventCopyWith<$Res> {
  $PictureTypeFilterModalEventCopyWith(PictureTypeFilterModalEvent _,
      $Res Function(PictureTypeFilterModalEvent) __);
}

/// @nodoc

class _Started implements PictureTypeFilterModalEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PictureTypeFilterModalEvent.started()';
  }
}

/// @nodoc

class _Toggle implements PictureTypeFilterModalEvent {
  const _Toggle({required this.type, required this.value});

  final String type;
  final bool value;

  /// Create a copy of PictureTypeFilterModalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToggleCopyWith<_Toggle> get copyWith =>
      __$ToggleCopyWithImpl<_Toggle>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Toggle &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @override
  String toString() {
    return 'PictureTypeFilterModalEvent.toggle(type: $type, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$ToggleCopyWith<$Res>
    implements $PictureTypeFilterModalEventCopyWith<$Res> {
  factory _$ToggleCopyWith(_Toggle value, $Res Function(_Toggle) _then) =
      __$ToggleCopyWithImpl;
  @useResult
  $Res call({String type, bool value});
}

/// @nodoc
class __$ToggleCopyWithImpl<$Res> implements _$ToggleCopyWith<$Res> {
  __$ToggleCopyWithImpl(this._self, this._then);

  final _Toggle _self;
  final $Res Function(_Toggle) _then;

  /// Create a copy of PictureTypeFilterModalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_Toggle(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Search implements PictureTypeFilterModalEvent {
  const _Search({required this.query});

  final String query;

  /// Create a copy of PictureTypeFilterModalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Search &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'PictureTypeFilterModalEvent.search(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res>
    implements $PictureTypeFilterModalEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) =
      __$SearchCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

  /// Create a copy of PictureTypeFilterModalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_Search(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Clear implements PictureTypeFilterModalEvent {
  const _Clear();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Clear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PictureTypeFilterModalEvent.clear()';
  }
}

/// @nodoc
mixin _$PictureTypeFilterModalState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PictureTypeFilterModalState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PictureTypeFilterModalState()';
  }
}

/// @nodoc
class $PictureTypeFilterModalStateCopyWith<$Res> {
  $PictureTypeFilterModalStateCopyWith(PictureTypeFilterModalState _,
      $Res Function(PictureTypeFilterModalState) __);
}

/// @nodoc

class PictureTypeFilterModalStateLoading
    implements PictureTypeFilterModalState {
  const PictureTypeFilterModalStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PictureTypeFilterModalStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PictureTypeFilterModalState.loading()';
  }
}

/// @nodoc

class PictureTypeFilterModalStateFailed implements PictureTypeFilterModalState {
  const PictureTypeFilterModalStateFailed({required this.message});

  final String message;

  /// Create a copy of PictureTypeFilterModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PictureTypeFilterModalStateFailedCopyWith<PictureTypeFilterModalStateFailed>
      get copyWith => _$PictureTypeFilterModalStateFailedCopyWithImpl<
          PictureTypeFilterModalStateFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PictureTypeFilterModalStateFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PictureTypeFilterModalState.failed(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PictureTypeFilterModalStateFailedCopyWith<$Res>
    implements $PictureTypeFilterModalStateCopyWith<$Res> {
  factory $PictureTypeFilterModalStateFailedCopyWith(
          PictureTypeFilterModalStateFailed value,
          $Res Function(PictureTypeFilterModalStateFailed) _then) =
      _$PictureTypeFilterModalStateFailedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PictureTypeFilterModalStateFailedCopyWithImpl<$Res>
    implements $PictureTypeFilterModalStateFailedCopyWith<$Res> {
  _$PictureTypeFilterModalStateFailedCopyWithImpl(this._self, this._then);

  final PictureTypeFilterModalStateFailed _self;
  final $Res Function(PictureTypeFilterModalStateFailed) _then;

  /// Create a copy of PictureTypeFilterModalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PictureTypeFilterModalStateFailed(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PictureTypeFilterModalStateSuccess
    implements PictureTypeFilterModalState {
  const PictureTypeFilterModalStateSuccess(
      {required final List<String> allTypes,
      required final List<String> selectedTypes})
      : _allTypes = allTypes,
        _selectedTypes = selectedTypes;

  final List<String> _allTypes;
  List<String> get allTypes {
    if (_allTypes is EqualUnmodifiableListView) return _allTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTypes);
  }

  final List<String> _selectedTypes;
  List<String> get selectedTypes {
    if (_selectedTypes is EqualUnmodifiableListView) return _selectedTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTypes);
  }

  /// Create a copy of PictureTypeFilterModalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PictureTypeFilterModalStateSuccessCopyWith<
          PictureTypeFilterModalStateSuccess>
      get copyWith => _$PictureTypeFilterModalStateSuccessCopyWithImpl<
          PictureTypeFilterModalStateSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PictureTypeFilterModalStateSuccess &&
            const DeepCollectionEquality().equals(other._allTypes, _allTypes) &&
            const DeepCollectionEquality()
                .equals(other._selectedTypes, _selectedTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTypes),
      const DeepCollectionEquality().hash(_selectedTypes));

  @override
  String toString() {
    return 'PictureTypeFilterModalState.success(allTypes: $allTypes, selectedTypes: $selectedTypes)';
  }
}

/// @nodoc
abstract mixin class $PictureTypeFilterModalStateSuccessCopyWith<$Res>
    implements $PictureTypeFilterModalStateCopyWith<$Res> {
  factory $PictureTypeFilterModalStateSuccessCopyWith(
          PictureTypeFilterModalStateSuccess value,
          $Res Function(PictureTypeFilterModalStateSuccess) _then) =
      _$PictureTypeFilterModalStateSuccessCopyWithImpl;
  @useResult
  $Res call({List<String> allTypes, List<String> selectedTypes});
}

/// @nodoc
class _$PictureTypeFilterModalStateSuccessCopyWithImpl<$Res>
    implements $PictureTypeFilterModalStateSuccessCopyWith<$Res> {
  _$PictureTypeFilterModalStateSuccessCopyWithImpl(this._self, this._then);

  final PictureTypeFilterModalStateSuccess _self;
  final $Res Function(PictureTypeFilterModalStateSuccess) _then;

  /// Create a copy of PictureTypeFilterModalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? allTypes = null,
    Object? selectedTypes = null,
  }) {
    return _then(PictureTypeFilterModalStateSuccess(
      allTypes: null == allTypes
          ? _self._allTypes
          : allTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTypes: null == selectedTypes
          ? _self._selectedTypes
          : selectedTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
