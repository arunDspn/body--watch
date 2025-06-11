// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compare_picture_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComparePictureFormState {
  String get tag;
  DateTime? get firstDate;
  DateTime? get secondDate;
  bool get ready;

  /// Create a copy of ComparePictureFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComparePictureFormStateCopyWith<ComparePictureFormState> get copyWith =>
      _$ComparePictureFormStateCopyWithImpl<ComparePictureFormState>(
          this as ComparePictureFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparePictureFormState &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.firstDate, firstDate) ||
                other.firstDate == firstDate) &&
            (identical(other.secondDate, secondDate) ||
                other.secondDate == secondDate) &&
            (identical(other.ready, ready) || other.ready == ready));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tag, firstDate, secondDate, ready);

  @override
  String toString() {
    return 'ComparePictureFormState(tag: $tag, firstDate: $firstDate, secondDate: $secondDate, ready: $ready)';
  }
}

/// @nodoc
abstract mixin class $ComparePictureFormStateCopyWith<$Res> {
  factory $ComparePictureFormStateCopyWith(ComparePictureFormState value,
          $Res Function(ComparePictureFormState) _then) =
      _$ComparePictureFormStateCopyWithImpl;
  @useResult
  $Res call(
      {String tag, DateTime? firstDate, DateTime? secondDate, bool ready});
}

/// @nodoc
class _$ComparePictureFormStateCopyWithImpl<$Res>
    implements $ComparePictureFormStateCopyWith<$Res> {
  _$ComparePictureFormStateCopyWithImpl(this._self, this._then);

  final ComparePictureFormState _self;
  final $Res Function(ComparePictureFormState) _then;

  /// Create a copy of ComparePictureFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? firstDate = freezed,
    Object? secondDate = freezed,
    Object? ready = null,
  }) {
    return _then(_self.copyWith(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      firstDate: freezed == firstDate
          ? _self.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      secondDate: freezed == secondDate
          ? _self.secondDate
          : secondDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ready: null == ready
          ? _self.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ComparePictureFormStateData implements ComparePictureFormState {
  const ComparePictureFormStateData(
      {required this.tag,
      required this.firstDate,
      required this.secondDate,
      required this.ready});

  @override
  final String tag;
  @override
  final DateTime? firstDate;
  @override
  final DateTime? secondDate;
  @override
  final bool ready;

  /// Create a copy of ComparePictureFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComparePictureFormStateDataCopyWith<ComparePictureFormStateData>
      get copyWith => _$ComparePictureFormStateDataCopyWithImpl<
          ComparePictureFormStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparePictureFormStateData &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.firstDate, firstDate) ||
                other.firstDate == firstDate) &&
            (identical(other.secondDate, secondDate) ||
                other.secondDate == secondDate) &&
            (identical(other.ready, ready) || other.ready == ready));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tag, firstDate, secondDate, ready);

  @override
  String toString() {
    return 'ComparePictureFormState.state(tag: $tag, firstDate: $firstDate, secondDate: $secondDate, ready: $ready)';
  }
}

/// @nodoc
abstract mixin class $ComparePictureFormStateDataCopyWith<$Res>
    implements $ComparePictureFormStateCopyWith<$Res> {
  factory $ComparePictureFormStateDataCopyWith(
          ComparePictureFormStateData value,
          $Res Function(ComparePictureFormStateData) _then) =
      _$ComparePictureFormStateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String tag, DateTime? firstDate, DateTime? secondDate, bool ready});
}

/// @nodoc
class _$ComparePictureFormStateDataCopyWithImpl<$Res>
    implements $ComparePictureFormStateDataCopyWith<$Res> {
  _$ComparePictureFormStateDataCopyWithImpl(this._self, this._then);

  final ComparePictureFormStateData _self;
  final $Res Function(ComparePictureFormStateData) _then;

  /// Create a copy of ComparePictureFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tag = null,
    Object? firstDate = freezed,
    Object? secondDate = freezed,
    Object? ready = null,
  }) {
    return _then(ComparePictureFormStateData(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      firstDate: freezed == firstDate
          ? _self.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      secondDate: freezed == secondDate
          ? _self.secondDate
          : secondDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ready: null == ready
          ? _self.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
