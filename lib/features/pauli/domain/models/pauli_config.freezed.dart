// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pauli_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PauliConfig {
  int get durationMinutes;
  DisplayFormat get displayFormat;
  int get columnCount; // For column format
  int get rowsPerColumn;

  /// Create a copy of PauliConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PauliConfigCopyWith<PauliConfig> get copyWith =>
      _$PauliConfigCopyWithImpl<PauliConfig>(this as PauliConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PauliConfig &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.displayFormat, displayFormat) ||
                other.displayFormat == displayFormat) &&
            (identical(other.columnCount, columnCount) ||
                other.columnCount == columnCount) &&
            (identical(other.rowsPerColumn, rowsPerColumn) ||
                other.rowsPerColumn == rowsPerColumn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, durationMinutes, displayFormat, columnCount, rowsPerColumn);

  @override
  String toString() {
    return 'PauliConfig(durationMinutes: $durationMinutes, displayFormat: $displayFormat, columnCount: $columnCount, rowsPerColumn: $rowsPerColumn)';
  }
}

/// @nodoc
abstract mixin class $PauliConfigCopyWith<$Res> {
  factory $PauliConfigCopyWith(
          PauliConfig value, $Res Function(PauliConfig) _then) =
      _$PauliConfigCopyWithImpl;
  @useResult
  $Res call(
      {int durationMinutes,
      DisplayFormat displayFormat,
      int columnCount,
      int rowsPerColumn});
}

/// @nodoc
class _$PauliConfigCopyWithImpl<$Res> implements $PauliConfigCopyWith<$Res> {
  _$PauliConfigCopyWithImpl(this._self, this._then);

  final PauliConfig _self;
  final $Res Function(PauliConfig) _then;

  /// Create a copy of PauliConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durationMinutes = null,
    Object? displayFormat = null,
    Object? columnCount = null,
    Object? rowsPerColumn = null,
  }) {
    return _then(_self.copyWith(
      durationMinutes: null == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      displayFormat: null == displayFormat
          ? _self.displayFormat
          : displayFormat // ignore: cast_nullable_to_non_nullable
              as DisplayFormat,
      columnCount: null == columnCount
          ? _self.columnCount
          : columnCount // ignore: cast_nullable_to_non_nullable
              as int,
      rowsPerColumn: null == rowsPerColumn
          ? _self.rowsPerColumn
          : rowsPerColumn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PauliConfig].
extension PauliConfigPatterns on PauliConfig {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PauliConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauliConfig() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_PauliConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliConfig():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PauliConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliConfig() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int durationMinutes, DisplayFormat displayFormat,
            int columnCount, int rowsPerColumn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauliConfig() when $default != null:
        return $default(_that.durationMinutes, _that.displayFormat,
            _that.columnCount, _that.rowsPerColumn);
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
  TResult when<TResult extends Object?>(
    TResult Function(int durationMinutes, DisplayFormat displayFormat,
            int columnCount, int rowsPerColumn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliConfig():
        return $default(_that.durationMinutes, _that.displayFormat,
            _that.columnCount, _that.rowsPerColumn);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int durationMinutes, DisplayFormat displayFormat,
            int columnCount, int rowsPerColumn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliConfig() when $default != null:
        return $default(_that.durationMinutes, _that.displayFormat,
            _that.columnCount, _that.rowsPerColumn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PauliConfig implements PauliConfig {
  const _PauliConfig(
      {this.durationMinutes = 5,
      this.displayFormat = DisplayFormat.singleProblem,
      this.columnCount = 8,
      this.rowsPerColumn = 15});

  @override
  @JsonKey()
  final int durationMinutes;
  @override
  @JsonKey()
  final DisplayFormat displayFormat;
  @override
  @JsonKey()
  final int columnCount;
// For column format
  @override
  @JsonKey()
  final int rowsPerColumn;

  /// Create a copy of PauliConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauliConfigCopyWith<_PauliConfig> get copyWith =>
      __$PauliConfigCopyWithImpl<_PauliConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauliConfig &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.displayFormat, displayFormat) ||
                other.displayFormat == displayFormat) &&
            (identical(other.columnCount, columnCount) ||
                other.columnCount == columnCount) &&
            (identical(other.rowsPerColumn, rowsPerColumn) ||
                other.rowsPerColumn == rowsPerColumn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, durationMinutes, displayFormat, columnCount, rowsPerColumn);

  @override
  String toString() {
    return 'PauliConfig(durationMinutes: $durationMinutes, displayFormat: $displayFormat, columnCount: $columnCount, rowsPerColumn: $rowsPerColumn)';
  }
}

/// @nodoc
abstract mixin class _$PauliConfigCopyWith<$Res>
    implements $PauliConfigCopyWith<$Res> {
  factory _$PauliConfigCopyWith(
          _PauliConfig value, $Res Function(_PauliConfig) _then) =
      __$PauliConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int durationMinutes,
      DisplayFormat displayFormat,
      int columnCount,
      int rowsPerColumn});
}

/// @nodoc
class __$PauliConfigCopyWithImpl<$Res> implements _$PauliConfigCopyWith<$Res> {
  __$PauliConfigCopyWithImpl(this._self, this._then);

  final _PauliConfig _self;
  final $Res Function(_PauliConfig) _then;

  /// Create a copy of PauliConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? durationMinutes = null,
    Object? displayFormat = null,
    Object? columnCount = null,
    Object? rowsPerColumn = null,
  }) {
    return _then(_PauliConfig(
      durationMinutes: null == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      displayFormat: null == displayFormat
          ? _self.displayFormat
          : displayFormat // ignore: cast_nullable_to_non_nullable
              as DisplayFormat,
      columnCount: null == columnCount
          ? _self.columnCount
          : columnCount // ignore: cast_nullable_to_non_nullable
              as int,
      rowsPerColumn: null == rowsPerColumn
          ? _self.rowsPerColumn
          : rowsPerColumn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
