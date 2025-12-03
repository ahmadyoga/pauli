// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pauli_test_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PauliTestState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PauliTestState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PauliTestState()';
  }
}

/// @nodoc
class $PauliTestStateCopyWith<$Res> {
  $PauliTestStateCopyWith(PauliTestState _, $Res Function(PauliTestState) __);
}

/// Adds pattern-matching-related methods to [PauliTestState].
extension PauliTestStatePatterns on PauliTestState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Running() when running != null:
        return running(_that);
      case _Finished() when finished != null:
        return finished(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
    required TResult Function(_Finished value) finished,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Running():
        return running(_that);
      case _Finished():
        return finished(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
    TResult? Function(_Finished value)? finished,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Running() when running != null:
        return running(_that);
      case _Finished() when finished != null:
        return finished(_that);
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
    TResult Function()? initial,
    TResult Function(
            PauliConfig config,
            DateTime startedAt,
            Duration elapsed,
            Duration remaining,
            List<PauliAnswer> answers,
            PauliProblem currentProblem,
            DateTime problemStartTime,
            List<List<PauliProblem>> columns,
            int currentColumn,
            int currentRow,
            Map<String, AnsweredCell> answeredCells)?
        running,
    TResult Function(PauliResult result)? finished,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Running() when running != null:
        return running(
            _that.config,
            _that.startedAt,
            _that.elapsed,
            _that.remaining,
            _that.answers,
            _that.currentProblem,
            _that.problemStartTime,
            _that.columns,
            _that.currentColumn,
            _that.currentRow,
            _that.answeredCells);
      case _Finished() when finished != null:
        return finished(_that.result);
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
    required TResult Function() initial,
    required TResult Function(
            PauliConfig config,
            DateTime startedAt,
            Duration elapsed,
            Duration remaining,
            List<PauliAnswer> answers,
            PauliProblem currentProblem,
            DateTime problemStartTime,
            List<List<PauliProblem>> columns,
            int currentColumn,
            int currentRow,
            Map<String, AnsweredCell> answeredCells)
        running,
    required TResult Function(PauliResult result) finished,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Running():
        return running(
            _that.config,
            _that.startedAt,
            _that.elapsed,
            _that.remaining,
            _that.answers,
            _that.currentProblem,
            _that.problemStartTime,
            _that.columns,
            _that.currentColumn,
            _that.currentRow,
            _that.answeredCells);
      case _Finished():
        return finished(_that.result);
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
    TResult? Function()? initial,
    TResult? Function(
            PauliConfig config,
            DateTime startedAt,
            Duration elapsed,
            Duration remaining,
            List<PauliAnswer> answers,
            PauliProblem currentProblem,
            DateTime problemStartTime,
            List<List<PauliProblem>> columns,
            int currentColumn,
            int currentRow,
            Map<String, AnsweredCell> answeredCells)?
        running,
    TResult? Function(PauliResult result)? finished,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Running() when running != null:
        return running(
            _that.config,
            _that.startedAt,
            _that.elapsed,
            _that.remaining,
            _that.answers,
            _that.currentProblem,
            _that.problemStartTime,
            _that.columns,
            _that.currentColumn,
            _that.currentRow,
            _that.answeredCells);
      case _Finished() when finished != null:
        return finished(_that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements PauliTestState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PauliTestState.initial()';
  }
}

/// @nodoc

class _Running implements PauliTestState {
  const _Running(
      {required this.config,
      required this.startedAt,
      required this.elapsed,
      required this.remaining,
      required final List<PauliAnswer> answers,
      required this.currentProblem,
      required this.problemStartTime,
      required final List<List<PauliProblem>> columns,
      required this.currentColumn,
      required this.currentRow,
      required final Map<String, AnsweredCell> answeredCells})
      : _answers = answers,
        _columns = columns,
        _answeredCells = answeredCells;

  final PauliConfig config;
  final DateTime startedAt;
  final Duration elapsed;
  final Duration remaining;
  final List<PauliAnswer> _answers;
  List<PauliAnswer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

// For single problem format
  final PauliProblem currentProblem;
  final DateTime problemStartTime;
// For column format
  final List<List<PauliProblem>> _columns;
// For column format
  List<List<PauliProblem>> get columns {
    if (_columns is EqualUnmodifiableListView) return _columns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_columns);
  }

  final int currentColumn;
  final int currentRow;
// For column/grid format - track answered cells with results
  final Map<String, AnsweredCell> _answeredCells;
// For column/grid format - track answered cells with results
  Map<String, AnsweredCell> get answeredCells {
    if (_answeredCells is EqualUnmodifiableMapView) return _answeredCells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answeredCells);
  }

  /// Create a copy of PauliTestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RunningCopyWith<_Running> get copyWith =>
      __$RunningCopyWithImpl<_Running>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Running &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.currentProblem, currentProblem) ||
                other.currentProblem == currentProblem) &&
            (identical(other.problemStartTime, problemStartTime) ||
                other.problemStartTime == problemStartTime) &&
            const DeepCollectionEquality().equals(other._columns, _columns) &&
            (identical(other.currentColumn, currentColumn) ||
                other.currentColumn == currentColumn) &&
            (identical(other.currentRow, currentRow) ||
                other.currentRow == currentRow) &&
            const DeepCollectionEquality()
                .equals(other._answeredCells, _answeredCells));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      config,
      startedAt,
      elapsed,
      remaining,
      const DeepCollectionEquality().hash(_answers),
      currentProblem,
      problemStartTime,
      const DeepCollectionEquality().hash(_columns),
      currentColumn,
      currentRow,
      const DeepCollectionEquality().hash(_answeredCells));

  @override
  String toString() {
    return 'PauliTestState.running(config: $config, startedAt: $startedAt, elapsed: $elapsed, remaining: $remaining, answers: $answers, currentProblem: $currentProblem, problemStartTime: $problemStartTime, columns: $columns, currentColumn: $currentColumn, currentRow: $currentRow, answeredCells: $answeredCells)';
  }
}

/// @nodoc
abstract mixin class _$RunningCopyWith<$Res>
    implements $PauliTestStateCopyWith<$Res> {
  factory _$RunningCopyWith(_Running value, $Res Function(_Running) _then) =
      __$RunningCopyWithImpl;
  @useResult
  $Res call(
      {PauliConfig config,
      DateTime startedAt,
      Duration elapsed,
      Duration remaining,
      List<PauliAnswer> answers,
      PauliProblem currentProblem,
      DateTime problemStartTime,
      List<List<PauliProblem>> columns,
      int currentColumn,
      int currentRow,
      Map<String, AnsweredCell> answeredCells});

  $PauliConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$RunningCopyWithImpl<$Res> implements _$RunningCopyWith<$Res> {
  __$RunningCopyWithImpl(this._self, this._then);

  final _Running _self;
  final $Res Function(_Running) _then;

  /// Create a copy of PauliTestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
    Object? startedAt = null,
    Object? elapsed = null,
    Object? remaining = null,
    Object? answers = null,
    Object? currentProblem = null,
    Object? problemStartTime = null,
    Object? columns = null,
    Object? currentColumn = null,
    Object? currentRow = null,
    Object? answeredCells = null,
  }) {
    return _then(_Running(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as PauliConfig,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      elapsed: null == elapsed
          ? _self.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as Duration,
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as Duration,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<PauliAnswer>,
      currentProblem: null == currentProblem
          ? _self.currentProblem
          : currentProblem // ignore: cast_nullable_to_non_nullable
              as PauliProblem,
      problemStartTime: null == problemStartTime
          ? _self.problemStartTime
          : problemStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      columns: null == columns
          ? _self._columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<List<PauliProblem>>,
      currentColumn: null == currentColumn
          ? _self.currentColumn
          : currentColumn // ignore: cast_nullable_to_non_nullable
              as int,
      currentRow: null == currentRow
          ? _self.currentRow
          : currentRow // ignore: cast_nullable_to_non_nullable
              as int,
      answeredCells: null == answeredCells
          ? _self._answeredCells
          : answeredCells // ignore: cast_nullable_to_non_nullable
              as Map<String, AnsweredCell>,
    ));
  }

  /// Create a copy of PauliTestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PauliConfigCopyWith<$Res> get config {
    return $PauliConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// @nodoc

class _Finished implements PauliTestState {
  const _Finished({required this.result});

  final PauliResult result;

  /// Create a copy of PauliTestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FinishedCopyWith<_Finished> get copyWith =>
      __$FinishedCopyWithImpl<_Finished>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Finished &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'PauliTestState.finished(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$FinishedCopyWith<$Res>
    implements $PauliTestStateCopyWith<$Res> {
  factory _$FinishedCopyWith(_Finished value, $Res Function(_Finished) _then) =
      __$FinishedCopyWithImpl;
  @useResult
  $Res call({PauliResult result});

  $PauliResultCopyWith<$Res> get result;
}

/// @nodoc
class __$FinishedCopyWithImpl<$Res> implements _$FinishedCopyWith<$Res> {
  __$FinishedCopyWithImpl(this._self, this._then);

  final _Finished _self;
  final $Res Function(_Finished) _then;

  /// Create a copy of PauliTestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_Finished(
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as PauliResult,
    ));
  }

  /// Create a copy of PauliTestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PauliResultCopyWith<$Res> get result {
    return $PauliResultCopyWith<$Res>(_self.result, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc
mixin _$PauliTestEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PauliTestEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PauliTestEvent()';
  }
}

/// @nodoc
class $PauliTestEventCopyWith<$Res> {
  $PauliTestEventCopyWith(PauliTestEvent _, $Res Function(PauliTestEvent) __);
}

/// Adds pattern-matching-related methods to [PauliTestEvent].
extension PauliTestEventPatterns on PauliTestEvent {
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
    TResult Function(_StartTest value)? startTest,
    TResult Function(_SubmitAnswer value)? submitAnswer,
    TResult Function(_Tick value)? tick,
    TResult Function(_FinishTest value)? finishTest,
    TResult Function(_Reset value)? reset,
    TResult Function(_SelectCell value)? selectCell,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartTest() when startTest != null:
        return startTest(_that);
      case _SubmitAnswer() when submitAnswer != null:
        return submitAnswer(_that);
      case _Tick() when tick != null:
        return tick(_that);
      case _FinishTest() when finishTest != null:
        return finishTest(_that);
      case _Reset() when reset != null:
        return reset(_that);
      case _SelectCell() when selectCell != null:
        return selectCell(_that);
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
    required TResult Function(_StartTest value) startTest,
    required TResult Function(_SubmitAnswer value) submitAnswer,
    required TResult Function(_Tick value) tick,
    required TResult Function(_FinishTest value) finishTest,
    required TResult Function(_Reset value) reset,
    required TResult Function(_SelectCell value) selectCell,
  }) {
    final _that = this;
    switch (_that) {
      case _StartTest():
        return startTest(_that);
      case _SubmitAnswer():
        return submitAnswer(_that);
      case _Tick():
        return tick(_that);
      case _FinishTest():
        return finishTest(_that);
      case _Reset():
        return reset(_that);
      case _SelectCell():
        return selectCell(_that);
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
    TResult? Function(_StartTest value)? startTest,
    TResult? Function(_SubmitAnswer value)? submitAnswer,
    TResult? Function(_Tick value)? tick,
    TResult? Function(_FinishTest value)? finishTest,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_SelectCell value)? selectCell,
  }) {
    final _that = this;
    switch (_that) {
      case _StartTest() when startTest != null:
        return startTest(_that);
      case _SubmitAnswer() when submitAnswer != null:
        return submitAnswer(_that);
      case _Tick() when tick != null:
        return tick(_that);
      case _FinishTest() when finishTest != null:
        return finishTest(_that);
      case _Reset() when reset != null:
        return reset(_that);
      case _SelectCell() when selectCell != null:
        return selectCell(_that);
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
    TResult Function(PauliConfig config)? startTest,
    TResult Function(int answer)? submitAnswer,
    TResult Function()? tick,
    TResult Function()? finishTest,
    TResult Function()? reset,
    TResult Function(int columnIndex, int rowIndex)? selectCell,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartTest() when startTest != null:
        return startTest(_that.config);
      case _SubmitAnswer() when submitAnswer != null:
        return submitAnswer(_that.answer);
      case _Tick() when tick != null:
        return tick();
      case _FinishTest() when finishTest != null:
        return finishTest();
      case _Reset() when reset != null:
        return reset();
      case _SelectCell() when selectCell != null:
        return selectCell(_that.columnIndex, _that.rowIndex);
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
    required TResult Function(PauliConfig config) startTest,
    required TResult Function(int answer) submitAnswer,
    required TResult Function() tick,
    required TResult Function() finishTest,
    required TResult Function() reset,
    required TResult Function(int columnIndex, int rowIndex) selectCell,
  }) {
    final _that = this;
    switch (_that) {
      case _StartTest():
        return startTest(_that.config);
      case _SubmitAnswer():
        return submitAnswer(_that.answer);
      case _Tick():
        return tick();
      case _FinishTest():
        return finishTest();
      case _Reset():
        return reset();
      case _SelectCell():
        return selectCell(_that.columnIndex, _that.rowIndex);
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
    TResult? Function(PauliConfig config)? startTest,
    TResult? Function(int answer)? submitAnswer,
    TResult? Function()? tick,
    TResult? Function()? finishTest,
    TResult? Function()? reset,
    TResult? Function(int columnIndex, int rowIndex)? selectCell,
  }) {
    final _that = this;
    switch (_that) {
      case _StartTest() when startTest != null:
        return startTest(_that.config);
      case _SubmitAnswer() when submitAnswer != null:
        return submitAnswer(_that.answer);
      case _Tick() when tick != null:
        return tick();
      case _FinishTest() when finishTest != null:
        return finishTest();
      case _Reset() when reset != null:
        return reset();
      case _SelectCell() when selectCell != null:
        return selectCell(_that.columnIndex, _that.rowIndex);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StartTest implements PauliTestEvent {
  const _StartTest(this.config);

  final PauliConfig config;

  /// Create a copy of PauliTestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartTestCopyWith<_StartTest> get copyWith =>
      __$StartTestCopyWithImpl<_StartTest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartTest &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @override
  String toString() {
    return 'PauliTestEvent.startTest(config: $config)';
  }
}

/// @nodoc
abstract mixin class _$StartTestCopyWith<$Res>
    implements $PauliTestEventCopyWith<$Res> {
  factory _$StartTestCopyWith(
          _StartTest value, $Res Function(_StartTest) _then) =
      __$StartTestCopyWithImpl;
  @useResult
  $Res call({PauliConfig config});

  $PauliConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$StartTestCopyWithImpl<$Res> implements _$StartTestCopyWith<$Res> {
  __$StartTestCopyWithImpl(this._self, this._then);

  final _StartTest _self;
  final $Res Function(_StartTest) _then;

  /// Create a copy of PauliTestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
  }) {
    return _then(_StartTest(
      null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as PauliConfig,
    ));
  }

  /// Create a copy of PauliTestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PauliConfigCopyWith<$Res> get config {
    return $PauliConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// @nodoc

class _SubmitAnswer implements PauliTestEvent {
  const _SubmitAnswer(this.answer);

  final int answer;

  /// Create a copy of PauliTestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubmitAnswerCopyWith<_SubmitAnswer> get copyWith =>
      __$SubmitAnswerCopyWithImpl<_SubmitAnswer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubmitAnswer &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answer);

  @override
  String toString() {
    return 'PauliTestEvent.submitAnswer(answer: $answer)';
  }
}

/// @nodoc
abstract mixin class _$SubmitAnswerCopyWith<$Res>
    implements $PauliTestEventCopyWith<$Res> {
  factory _$SubmitAnswerCopyWith(
          _SubmitAnswer value, $Res Function(_SubmitAnswer) _then) =
      __$SubmitAnswerCopyWithImpl;
  @useResult
  $Res call({int answer});
}

/// @nodoc
class __$SubmitAnswerCopyWithImpl<$Res>
    implements _$SubmitAnswerCopyWith<$Res> {
  __$SubmitAnswerCopyWithImpl(this._self, this._then);

  final _SubmitAnswer _self;
  final $Res Function(_SubmitAnswer) _then;

  /// Create a copy of PauliTestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? answer = null,
  }) {
    return _then(_SubmitAnswer(
      null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _Tick implements PauliTestEvent {
  const _Tick();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Tick);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PauliTestEvent.tick()';
  }
}

/// @nodoc

class _FinishTest implements PauliTestEvent {
  const _FinishTest();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FinishTest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PauliTestEvent.finishTest()';
  }
}

/// @nodoc

class _Reset implements PauliTestEvent {
  const _Reset();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PauliTestEvent.reset()';
  }
}

/// @nodoc

class _SelectCell implements PauliTestEvent {
  const _SelectCell(this.columnIndex, this.rowIndex);

  final int columnIndex;
  final int rowIndex;

  /// Create a copy of PauliTestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCellCopyWith<_SelectCell> get copyWith =>
      __$SelectCellCopyWithImpl<_SelectCell>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectCell &&
            (identical(other.columnIndex, columnIndex) ||
                other.columnIndex == columnIndex) &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, columnIndex, rowIndex);

  @override
  String toString() {
    return 'PauliTestEvent.selectCell(columnIndex: $columnIndex, rowIndex: $rowIndex)';
  }
}

/// @nodoc
abstract mixin class _$SelectCellCopyWith<$Res>
    implements $PauliTestEventCopyWith<$Res> {
  factory _$SelectCellCopyWith(
          _SelectCell value, $Res Function(_SelectCell) _then) =
      __$SelectCellCopyWithImpl;
  @useResult
  $Res call({int columnIndex, int rowIndex});
}

/// @nodoc
class __$SelectCellCopyWithImpl<$Res> implements _$SelectCellCopyWith<$Res> {
  __$SelectCellCopyWithImpl(this._self, this._then);

  final _SelectCell _self;
  final $Res Function(_SelectCell) _then;

  /// Create a copy of PauliTestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? columnIndex = null,
    Object? rowIndex = null,
  }) {
    return _then(_SelectCell(
      null == columnIndex
          ? _self.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == rowIndex
          ? _self.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
