// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pauli_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PauliAnswer {
  int get firstNumber;
  int get secondNumber;
  int get userAnswer;
  int get correctAnswer;
  Duration get timeTaken;
  DateTime get answeredAt;

  /// Create a copy of PauliAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PauliAnswerCopyWith<PauliAnswer> get copyWith =>
      _$PauliAnswerCopyWithImpl<PauliAnswer>(this as PauliAnswer, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PauliAnswer &&
            (identical(other.firstNumber, firstNumber) ||
                other.firstNumber == firstNumber) &&
            (identical(other.secondNumber, secondNumber) ||
                other.secondNumber == secondNumber) &&
            (identical(other.userAnswer, userAnswer) ||
                other.userAnswer == userAnswer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.timeTaken, timeTaken) ||
                other.timeTaken == timeTaken) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstNumber, secondNumber,
      userAnswer, correctAnswer, timeTaken, answeredAt);

  @override
  String toString() {
    return 'PauliAnswer(firstNumber: $firstNumber, secondNumber: $secondNumber, userAnswer: $userAnswer, correctAnswer: $correctAnswer, timeTaken: $timeTaken, answeredAt: $answeredAt)';
  }
}

/// @nodoc
abstract mixin class $PauliAnswerCopyWith<$Res> {
  factory $PauliAnswerCopyWith(
          PauliAnswer value, $Res Function(PauliAnswer) _then) =
      _$PauliAnswerCopyWithImpl;
  @useResult
  $Res call(
      {int firstNumber,
      int secondNumber,
      int userAnswer,
      int correctAnswer,
      Duration timeTaken,
      DateTime answeredAt});
}

/// @nodoc
class _$PauliAnswerCopyWithImpl<$Res> implements $PauliAnswerCopyWith<$Res> {
  _$PauliAnswerCopyWithImpl(this._self, this._then);

  final PauliAnswer _self;
  final $Res Function(PauliAnswer) _then;

  /// Create a copy of PauliAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstNumber = null,
    Object? secondNumber = null,
    Object? userAnswer = null,
    Object? correctAnswer = null,
    Object? timeTaken = null,
    Object? answeredAt = null,
  }) {
    return _then(_self.copyWith(
      firstNumber: null == firstNumber
          ? _self.firstNumber
          : firstNumber // ignore: cast_nullable_to_non_nullable
              as int,
      secondNumber: null == secondNumber
          ? _self.secondNumber
          : secondNumber // ignore: cast_nullable_to_non_nullable
              as int,
      userAnswer: null == userAnswer
          ? _self.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswer: null == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      timeTaken: null == timeTaken
          ? _self.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      answeredAt: null == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [PauliAnswer].
extension PauliAnswerPatterns on PauliAnswer {
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
    TResult Function(_PauliAnswer value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauliAnswer() when $default != null:
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
    TResult Function(_PauliAnswer value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliAnswer():
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
    TResult? Function(_PauliAnswer value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliAnswer() when $default != null:
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
    TResult Function(int firstNumber, int secondNumber, int userAnswer,
            int correctAnswer, Duration timeTaken, DateTime answeredAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauliAnswer() when $default != null:
        return $default(_that.firstNumber, _that.secondNumber, _that.userAnswer,
            _that.correctAnswer, _that.timeTaken, _that.answeredAt);
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
    TResult Function(int firstNumber, int secondNumber, int userAnswer,
            int correctAnswer, Duration timeTaken, DateTime answeredAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliAnswer():
        return $default(_that.firstNumber, _that.secondNumber, _that.userAnswer,
            _that.correctAnswer, _that.timeTaken, _that.answeredAt);
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
    TResult? Function(int firstNumber, int secondNumber, int userAnswer,
            int correctAnswer, Duration timeTaken, DateTime answeredAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliAnswer() when $default != null:
        return $default(_that.firstNumber, _that.secondNumber, _that.userAnswer,
            _that.correctAnswer, _that.timeTaken, _that.answeredAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PauliAnswer extends PauliAnswer {
  const _PauliAnswer(
      {required this.firstNumber,
      required this.secondNumber,
      required this.userAnswer,
      required this.correctAnswer,
      required this.timeTaken,
      required this.answeredAt})
      : super._();

  @override
  final int firstNumber;
  @override
  final int secondNumber;
  @override
  final int userAnswer;
  @override
  final int correctAnswer;
  @override
  final Duration timeTaken;
  @override
  final DateTime answeredAt;

  /// Create a copy of PauliAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauliAnswerCopyWith<_PauliAnswer> get copyWith =>
      __$PauliAnswerCopyWithImpl<_PauliAnswer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauliAnswer &&
            (identical(other.firstNumber, firstNumber) ||
                other.firstNumber == firstNumber) &&
            (identical(other.secondNumber, secondNumber) ||
                other.secondNumber == secondNumber) &&
            (identical(other.userAnswer, userAnswer) ||
                other.userAnswer == userAnswer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.timeTaken, timeTaken) ||
                other.timeTaken == timeTaken) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstNumber, secondNumber,
      userAnswer, correctAnswer, timeTaken, answeredAt);

  @override
  String toString() {
    return 'PauliAnswer(firstNumber: $firstNumber, secondNumber: $secondNumber, userAnswer: $userAnswer, correctAnswer: $correctAnswer, timeTaken: $timeTaken, answeredAt: $answeredAt)';
  }
}

/// @nodoc
abstract mixin class _$PauliAnswerCopyWith<$Res>
    implements $PauliAnswerCopyWith<$Res> {
  factory _$PauliAnswerCopyWith(
          _PauliAnswer value, $Res Function(_PauliAnswer) _then) =
      __$PauliAnswerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int firstNumber,
      int secondNumber,
      int userAnswer,
      int correctAnswer,
      Duration timeTaken,
      DateTime answeredAt});
}

/// @nodoc
class __$PauliAnswerCopyWithImpl<$Res> implements _$PauliAnswerCopyWith<$Res> {
  __$PauliAnswerCopyWithImpl(this._self, this._then);

  final _PauliAnswer _self;
  final $Res Function(_PauliAnswer) _then;

  /// Create a copy of PauliAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstNumber = null,
    Object? secondNumber = null,
    Object? userAnswer = null,
    Object? correctAnswer = null,
    Object? timeTaken = null,
    Object? answeredAt = null,
  }) {
    return _then(_PauliAnswer(
      firstNumber: null == firstNumber
          ? _self.firstNumber
          : firstNumber // ignore: cast_nullable_to_non_nullable
              as int,
      secondNumber: null == secondNumber
          ? _self.secondNumber
          : secondNumber // ignore: cast_nullable_to_non_nullable
              as int,
      userAnswer: null == userAnswer
          ? _self.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswer: null == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      timeTaken: null == timeTaken
          ? _self.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as Duration,
      answeredAt: null == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$PauliResult {
  List<PauliAnswer> get answers;
  Duration get totalDuration;
  DateTime get startedAt;
  DateTime get finishedAt;

  /// Create a copy of PauliResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PauliResultCopyWith<PauliResult> get copyWith =>
      _$PauliResultCopyWithImpl<PauliResult>(this as PauliResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PauliResult &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(answers),
      totalDuration,
      startedAt,
      finishedAt);

  @override
  String toString() {
    return 'PauliResult(answers: $answers, totalDuration: $totalDuration, startedAt: $startedAt, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class $PauliResultCopyWith<$Res> {
  factory $PauliResultCopyWith(
          PauliResult value, $Res Function(PauliResult) _then) =
      _$PauliResultCopyWithImpl;
  @useResult
  $Res call(
      {List<PauliAnswer> answers,
      Duration totalDuration,
      DateTime startedAt,
      DateTime finishedAt});
}

/// @nodoc
class _$PauliResultCopyWithImpl<$Res> implements $PauliResultCopyWith<$Res> {
  _$PauliResultCopyWithImpl(this._self, this._then);

  final PauliResult _self;
  final $Res Function(PauliResult) _then;

  /// Create a copy of PauliResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answers = null,
    Object? totalDuration = null,
    Object? startedAt = null,
    Object? finishedAt = null,
  }) {
    return _then(_self.copyWith(
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<PauliAnswer>,
      totalDuration: null == totalDuration
          ? _self.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: null == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [PauliResult].
extension PauliResultPatterns on PauliResult {
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
    TResult Function(_PauliResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauliResult() when $default != null:
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
    TResult Function(_PauliResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliResult():
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
    TResult? Function(_PauliResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliResult() when $default != null:
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
    TResult Function(List<PauliAnswer> answers, Duration totalDuration,
            DateTime startedAt, DateTime finishedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PauliResult() when $default != null:
        return $default(_that.answers, _that.totalDuration, _that.startedAt,
            _that.finishedAt);
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
    TResult Function(List<PauliAnswer> answers, Duration totalDuration,
            DateTime startedAt, DateTime finishedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliResult():
        return $default(_that.answers, _that.totalDuration, _that.startedAt,
            _that.finishedAt);
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
    TResult? Function(List<PauliAnswer> answers, Duration totalDuration,
            DateTime startedAt, DateTime finishedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PauliResult() when $default != null:
        return $default(_that.answers, _that.totalDuration, _that.startedAt,
            _that.finishedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PauliResult extends PauliResult {
  const _PauliResult(
      {required final List<PauliAnswer> answers,
      required this.totalDuration,
      required this.startedAt,
      required this.finishedAt})
      : _answers = answers,
        super._();

  final List<PauliAnswer> _answers;
  @override
  List<PauliAnswer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final Duration totalDuration;
  @override
  final DateTime startedAt;
  @override
  final DateTime finishedAt;

  /// Create a copy of PauliResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PauliResultCopyWith<_PauliResult> get copyWith =>
      __$PauliResultCopyWithImpl<_PauliResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PauliResult &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_answers),
      totalDuration,
      startedAt,
      finishedAt);

  @override
  String toString() {
    return 'PauliResult(answers: $answers, totalDuration: $totalDuration, startedAt: $startedAt, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class _$PauliResultCopyWith<$Res>
    implements $PauliResultCopyWith<$Res> {
  factory _$PauliResultCopyWith(
          _PauliResult value, $Res Function(_PauliResult) _then) =
      __$PauliResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PauliAnswer> answers,
      Duration totalDuration,
      DateTime startedAt,
      DateTime finishedAt});
}

/// @nodoc
class __$PauliResultCopyWithImpl<$Res> implements _$PauliResultCopyWith<$Res> {
  __$PauliResultCopyWithImpl(this._self, this._then);

  final _PauliResult _self;
  final $Res Function(_PauliResult) _then;

  /// Create a copy of PauliResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? answers = null,
    Object? totalDuration = null,
    Object? startedAt = null,
    Object? finishedAt = null,
  }) {
    return _then(_PauliResult(
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<PauliAnswer>,
      totalDuration: null == totalDuration
          ? _self.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: null == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
