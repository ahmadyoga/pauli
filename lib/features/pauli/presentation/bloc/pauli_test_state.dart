part of 'pauli_test_bloc.dart';

/// Stores the result of an answered cell
class AnsweredCell {
  final int userAnswer;
  final bool isCorrect;

  const AnsweredCell({required this.userAnswer, required this.isCorrect});
}

@freezed
class PauliTestState with _$PauliTestState {
  const factory PauliTestState.initial() = _Initial;
  const factory PauliTestState.running({
    required PauliConfig config,
    required DateTime startedAt,
    required Duration elapsed,
    required Duration remaining,
    required List<PauliAnswer> answers,
    // For single problem format
    required PauliProblem currentProblem,
    required DateTime problemStartTime,
    // For column format
    required List<List<PauliProblem>> columns,
    required int currentColumn,
    required int currentRow,
    // For column/grid format - track answered cells with results
    required Map<String, AnsweredCell>
        answeredCells, // "col-row" -> AnsweredCell
  }) = _Running;
  const factory PauliTestState.finished({
    required PauliResult result,
  }) = _Finished;
}
