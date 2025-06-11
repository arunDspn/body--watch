// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComparisonDataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ComparisonDataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ComparisonDataState()';
  }
}

/// @nodoc
class $ComparisonDataStateCopyWith<$Res> {
  $ComparisonDataStateCopyWith(
      ComparisonDataState _, $Res Function(ComparisonDataState) __);
}

/// @nodoc

class ComparisonDataStateInitial implements ComparisonDataState {
  const ComparisonDataStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparisonDataStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ComparisonDataState.initial()';
  }
}

/// @nodoc

class ComparisonDataStateLoading implements ComparisonDataState {
  const ComparisonDataStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparisonDataStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ComparisonDataState.loading()';
  }
}

/// @nodoc

class ComparisonDataStateSuccess implements ComparisonDataState {
  const ComparisonDataStateSuccess(
      {required final List<TwoDatesRecord> records})
      : _records = records;

  final List<TwoDatesRecord> _records;
  List<TwoDatesRecord> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  /// Create a copy of ComparisonDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComparisonDataStateSuccessCopyWith<ComparisonDataStateSuccess>
      get copyWith =>
          _$ComparisonDataStateSuccessCopyWithImpl<ComparisonDataStateSuccess>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparisonDataStateSuccess &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_records));

  @override
  String toString() {
    return 'ComparisonDataState.success(records: $records)';
  }
}

/// @nodoc
abstract mixin class $ComparisonDataStateSuccessCopyWith<$Res>
    implements $ComparisonDataStateCopyWith<$Res> {
  factory $ComparisonDataStateSuccessCopyWith(ComparisonDataStateSuccess value,
          $Res Function(ComparisonDataStateSuccess) _then) =
      _$ComparisonDataStateSuccessCopyWithImpl;
  @useResult
  $Res call({List<TwoDatesRecord> records});
}

/// @nodoc
class _$ComparisonDataStateSuccessCopyWithImpl<$Res>
    implements $ComparisonDataStateSuccessCopyWith<$Res> {
  _$ComparisonDataStateSuccessCopyWithImpl(this._self, this._then);

  final ComparisonDataStateSuccess _self;
  final $Res Function(ComparisonDataStateSuccess) _then;

  /// Create a copy of ComparisonDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? records = null,
  }) {
    return _then(ComparisonDataStateSuccess(
      records: null == records
          ? _self._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<TwoDatesRecord>,
    ));
  }
}

/// @nodoc

class ComparisonDataStateFailure implements ComparisonDataState {
  const ComparisonDataStateFailure({required this.message});

  final String message;

  /// Create a copy of ComparisonDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComparisonDataStateFailureCopyWith<ComparisonDataStateFailure>
      get copyWith =>
          _$ComparisonDataStateFailureCopyWithImpl<ComparisonDataStateFailure>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparisonDataStateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ComparisonDataState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ComparisonDataStateFailureCopyWith<$Res>
    implements $ComparisonDataStateCopyWith<$Res> {
  factory $ComparisonDataStateFailureCopyWith(ComparisonDataStateFailure value,
          $Res Function(ComparisonDataStateFailure) _then) =
      _$ComparisonDataStateFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ComparisonDataStateFailureCopyWithImpl<$Res>
    implements $ComparisonDataStateFailureCopyWith<$Res> {
  _$ComparisonDataStateFailureCopyWithImpl(this._self, this._then);

  final ComparisonDataStateFailure _self;
  final $Res Function(ComparisonDataStateFailure) _then;

  /// Create a copy of ComparisonDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ComparisonDataStateFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
