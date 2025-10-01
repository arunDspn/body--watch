// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_preferences_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppPreferencesFailure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppPreferencesFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppPreferencesFailure()';
  }
}

/// @nodoc
class $AppPreferencesFailureCopyWith<$Res> {
  $AppPreferencesFailureCopyWith(
      AppPreferencesFailure _, $Res Function(AppPreferencesFailure) __);
}

/// Adds pattern-matching-related methods to [AppPreferencesFailure].
extension AppPreferencesFailurePatterns on AppPreferencesFailure {
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
    TResult Function(NotPreferencesFound value)? notPreferencesFound,
    TResult Function(TypicalFailure value)? typicalFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotPreferencesFound() when notPreferencesFound != null:
        return notPreferencesFound(_that);
      case TypicalFailure() when typicalFailure != null:
        return typicalFailure(_that);
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
    required TResult Function(NotPreferencesFound value) notPreferencesFound,
    required TResult Function(TypicalFailure value) typicalFailure,
  }) {
    final _that = this;
    switch (_that) {
      case NotPreferencesFound():
        return notPreferencesFound(_that);
      case TypicalFailure():
        return typicalFailure(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(NotPreferencesFound value)? notPreferencesFound,
    TResult? Function(TypicalFailure value)? typicalFailure,
  }) {
    final _that = this;
    switch (_that) {
      case NotPreferencesFound() when notPreferencesFound != null:
        return notPreferencesFound(_that);
      case TypicalFailure() when typicalFailure != null:
        return typicalFailure(_that);
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
    TResult Function()? notPreferencesFound,
    TResult Function(String message)? typicalFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotPreferencesFound() when notPreferencesFound != null:
        return notPreferencesFound();
      case TypicalFailure() when typicalFailure != null:
        return typicalFailure(_that.message);
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
    required TResult Function() notPreferencesFound,
    required TResult Function(String message) typicalFailure,
  }) {
    final _that = this;
    switch (_that) {
      case NotPreferencesFound():
        return notPreferencesFound();
      case TypicalFailure():
        return typicalFailure(_that.message);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function()? notPreferencesFound,
    TResult? Function(String message)? typicalFailure,
  }) {
    final _that = this;
    switch (_that) {
      case NotPreferencesFound() when notPreferencesFound != null:
        return notPreferencesFound();
      case TypicalFailure() when typicalFailure != null:
        return typicalFailure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotPreferencesFound implements AppPreferencesFailure {
  const NotPreferencesFound();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotPreferencesFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppPreferencesFailure.notPreferencesFound()';
  }
}

/// @nodoc

class TypicalFailure implements AppPreferencesFailure {
  const TypicalFailure({required this.message});

  final String message;

  /// Create a copy of AppPreferencesFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TypicalFailureCopyWith<TypicalFailure> get copyWith =>
      _$TypicalFailureCopyWithImpl<TypicalFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TypicalFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AppPreferencesFailure.typicalFailure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TypicalFailureCopyWith<$Res>
    implements $AppPreferencesFailureCopyWith<$Res> {
  factory $TypicalFailureCopyWith(
          TypicalFailure value, $Res Function(TypicalFailure) _then) =
      _$TypicalFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TypicalFailureCopyWithImpl<$Res>
    implements $TypicalFailureCopyWith<$Res> {
  _$TypicalFailureCopyWithImpl(this._self, this._then);

  final TypicalFailure _self;
  final $Res Function(TypicalFailure) _then;

  /// Create a copy of AppPreferencesFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TypicalFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
