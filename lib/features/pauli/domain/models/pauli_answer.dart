import 'package:freezed_annotation/freezed_annotation.dart';

part 'pauli_answer.freezed.dart';

@freezed
sealed class PauliAnswer with _$PauliAnswer {
  const factory PauliAnswer({
    required int firstNumber,
    required int secondNumber,
    required int userAnswer,
    required int correctAnswer,
    required Duration timeTaken,
    required DateTime answeredAt,
  }) = _PauliAnswer;

  const PauliAnswer._();

  bool get isCorrect => userAnswer == (correctAnswer % 10);
}

@freezed
sealed class PauliResult with _$PauliResult {
  const factory PauliResult({
    required List<PauliAnswer> answers,
    required Duration totalDuration,
    required DateTime startedAt,
    required DateTime finishedAt,
  }) = _PauliResult;

  const PauliResult._();

  int get totalAnswered => answers.length;
  int get correctCount => answers.where((a) => a.isCorrect).length;
  int get wrongCount => answers.where((a) => !a.isCorrect).length;

  double get accuracy =>
      totalAnswered > 0 ? (correctCount / totalAnswered) * 100 : 0;

  double get averageTimePerAnswer {
    if (answers.isEmpty) return 0;
    final totalMs = answers.fold<int>(
      0,
      (sum, a) => sum + a.timeTaken.inMilliseconds,
    );
    return totalMs / answers.length / 1000; // in seconds
  }

  // Calculate answers per minute intervals for graph
  List<int> get answersPerMinute {
    if (answers.isEmpty) return [];

    final totalMinutes = totalDuration.inMinutes;
    if (totalMinutes == 0) return [answers.length];

    final result = List<int>.filled(totalMinutes + 1, 0);

    for (final answer in answers) {
      final minuteIndex = answer.timeTaken.inMinutes;
      if (minuteIndex < result.length) {
        result[minuteIndex]++;
      }
    }

    return result;
  }
}
