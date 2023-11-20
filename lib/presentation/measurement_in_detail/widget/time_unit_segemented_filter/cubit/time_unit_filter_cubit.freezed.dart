// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_unit_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimeUnitFilterState {
  TimeUnit get timeUnit => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimeUnit timeUnit) on,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimeUnit timeUnit)? on,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimeUnit timeUnit)? on,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_On value) on,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_On value)? on,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_On value)? on,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeUnitFilterStateCopyWith<TimeUnitFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeUnitFilterStateCopyWith<$Res> {
  factory $TimeUnitFilterStateCopyWith(
          TimeUnitFilterState value, $Res Function(TimeUnitFilterState) then) =
      _$TimeUnitFilterStateCopyWithImpl<$Res, TimeUnitFilterState>;
  @useResult
  $Res call({TimeUnit timeUnit});
}

/// @nodoc
class _$TimeUnitFilterStateCopyWithImpl<$Res, $Val extends TimeUnitFilterState>
    implements $TimeUnitFilterStateCopyWith<$Res> {
  _$TimeUnitFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeUnit = null,
  }) {
    return _then(_value.copyWith(
      timeUnit: null == timeUnit
          ? _value.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as TimeUnit,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnImplCopyWith<$Res>
    implements $TimeUnitFilterStateCopyWith<$Res> {
  factory _$$OnImplCopyWith(_$OnImpl value, $Res Function(_$OnImpl) then) =
      __$$OnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimeUnit timeUnit});
}

/// @nodoc
class __$$OnImplCopyWithImpl<$Res>
    extends _$TimeUnitFilterStateCopyWithImpl<$Res, _$OnImpl>
    implements _$$OnImplCopyWith<$Res> {
  __$$OnImplCopyWithImpl(_$OnImpl _value, $Res Function(_$OnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeUnit = null,
  }) {
    return _then(_$OnImpl(
      timeUnit: null == timeUnit
          ? _value.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as TimeUnit,
    ));
  }
}

/// @nodoc

class _$OnImpl implements _On {
  const _$OnImpl({required this.timeUnit});

  @override
  final TimeUnit timeUnit;

  @override
  String toString() {
    return 'TimeUnitFilterState.on(timeUnit: $timeUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnImpl &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnImplCopyWith<_$OnImpl> get copyWith =>
      __$$OnImplCopyWithImpl<_$OnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimeUnit timeUnit) on,
  }) {
    return on(timeUnit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimeUnit timeUnit)? on,
  }) {
    return on?.call(timeUnit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimeUnit timeUnit)? on,
    required TResult orElse(),
  }) {
    if (on != null) {
      return on(timeUnit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_On value) on,
  }) {
    return on(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_On value)? on,
  }) {
    return on?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_On value)? on,
    required TResult orElse(),
  }) {
    if (on != null) {
      return on(this);
    }
    return orElse();
  }
}

abstract class _On implements TimeUnitFilterState {
  const factory _On({required final TimeUnit timeUnit}) = _$OnImpl;

  @override
  TimeUnit get timeUnit;
  @override
  @JsonKey(ignore: true)
  _$$OnImplCopyWith<_$OnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
