// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compare_picture_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComparePictureFormState {
  String get tag => throw _privateConstructorUsedError;
  DateTime? get firstDate => throw _privateConstructorUsedError;
  DateTime? get secondDate => throw _privateConstructorUsedError;
  bool get ready => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String tag, DateTime? firstDate, DateTime? secondDate, bool ready)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String tag, DateTime? firstDate, DateTime? secondDate, bool ready)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String tag, DateTime? firstDate, DateTime? secondDate, bool ready)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(State value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(State value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(State value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComparePictureFormStateCopyWith<ComparePictureFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparePictureFormStateCopyWith<$Res> {
  factory $ComparePictureFormStateCopyWith(ComparePictureFormState value,
          $Res Function(ComparePictureFormState) then) =
      _$ComparePictureFormStateCopyWithImpl<$Res, ComparePictureFormState>;
  @useResult
  $Res call(
      {String tag, DateTime? firstDate, DateTime? secondDate, bool ready});
}

/// @nodoc
class _$ComparePictureFormStateCopyWithImpl<$Res,
        $Val extends ComparePictureFormState>
    implements $ComparePictureFormStateCopyWith<$Res> {
  _$ComparePictureFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? firstDate = freezed,
    Object? secondDate = freezed,
    Object? ready = null,
  }) {
    return _then(_value.copyWith(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      firstDate: freezed == firstDate
          ? _value.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      secondDate: freezed == secondDate
          ? _value.secondDate
          : secondDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateImplCopyWith<$Res>
    implements $ComparePictureFormStateCopyWith<$Res> {
  factory _$$StateImplCopyWith(
          _$StateImpl value, $Res Function(_$StateImpl) then) =
      __$$StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tag, DateTime? firstDate, DateTime? secondDate, bool ready});
}

/// @nodoc
class __$$StateImplCopyWithImpl<$Res>
    extends _$ComparePictureFormStateCopyWithImpl<$Res, _$StateImpl>
    implements _$$StateImplCopyWith<$Res> {
  __$$StateImplCopyWithImpl(
      _$StateImpl _value, $Res Function(_$StateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? firstDate = freezed,
    Object? secondDate = freezed,
    Object? ready = null,
  }) {
    return _then(_$StateImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      firstDate: freezed == firstDate
          ? _value.firstDate
          : firstDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      secondDate: freezed == secondDate
          ? _value.secondDate
          : secondDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StateImpl implements State {
  const _$StateImpl(
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

  @override
  String toString() {
    return 'ComparePictureFormState.state(tag: $tag, firstDate: $firstDate, secondDate: $secondDate, ready: $ready)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      __$$StateImplCopyWithImpl<_$StateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String tag, DateTime? firstDate, DateTime? secondDate, bool ready)
        state,
  }) {
    return state(tag, firstDate, secondDate, ready);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String tag, DateTime? firstDate, DateTime? secondDate, bool ready)?
        state,
  }) {
    return state?.call(tag, firstDate, secondDate, ready);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String tag, DateTime? firstDate, DateTime? secondDate, bool ready)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(tag, firstDate, secondDate, ready);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(State value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(State value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(State value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class State implements ComparePictureFormState {
  const factory State(
      {required final String tag,
      required final DateTime? firstDate,
      required final DateTime? secondDate,
      required final bool ready}) = _$StateImpl;

  @override
  String get tag;
  @override
  DateTime? get firstDate;
  @override
  DateTime? get secondDate;
  @override
  bool get ready;
  @override
  @JsonKey(ignore: true)
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
