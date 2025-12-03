import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/pauli_answer.dart';
import '../../domain/models/pauli_config.dart';
import '../../domain/models/pauli_problem.dart';

part 'pauli_test_bloc.freezed.dart';
part 'pauli_test_state.dart';
part 'pauli_test_event.dart';

class PauliTestBloc extends Bloc<PauliTestEvent, PauliTestState> {
  Timer? _timer;

  PauliTestBloc() : super(const PauliTestState.initial()) {
    on<_StartTest>(_onStartTest);
    on<_SubmitAnswer>(_onSubmitAnswer);
    on<_Tick>(_onTick);
    on<_FinishTest>(_onFinishTest);
    on<_Reset>(_onReset);
    on<_SelectCell>(_onSelectCell);
  }

  void _onStartTest(_StartTest event, Emitter<PauliTestState> emit) {
    final now = DateTime.now();
    final totalDuration = Duration(minutes: event.config.durationMinutes);

    // Generate problems based on format
    final columns = PauliProblem.generateColumns(
      event.config.columnCount,
      event.config.rowsPerColumn,
    );

    emit(
      PauliTestState.running(
        config: event.config,
        startedAt: now,
        elapsed: Duration.zero,
        remaining: totalDuration,
        answers: [],
        currentProblem: PauliProblem.random(),
        problemStartTime: now,
        columns: columns,
        currentColumn: 0,
        currentRow: 0,
        answeredCells: {},
      ),
    );

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(const PauliTestEvent.tick());
    });
  }

  void _onSubmitAnswer(_SubmitAnswer event, Emitter<PauliTestState> emit) {
    final currentState = state;
    if (currentState is! _Running) return;

    final now = DateTime.now();

    // Get the correct answer based on format
    int firstNumber;
    int secondNumber;
    int correctAnswer;

    switch (currentState.config.displayFormat) {
      case DisplayFormat.singleProblem:
        final problem = currentState.currentProblem;
        firstNumber = problem.firstNumber;
        secondNumber = problem.secondNumber;
        correctAnswer = problem.correctAnswer;
        break;

      case DisplayFormat.columnFormat:
      case DisplayFormat.gridFormat:
        // For column/grid, we add adjacent numbers in the column
        final column = currentState.columns[currentState.currentColumn];
        final currentProblem = column[currentState.currentRow];
        firstNumber = currentProblem.firstNumber;

        // The second number is the first number of the NEXT row
        if (currentState.currentRow < column.length - 1) {
          final nextProblem = column[currentState.currentRow + 1];
          secondNumber = nextProblem.firstNumber;
        } else {
          // Last row in column - shouldn't have an answer box, but fallback
          secondNumber = 0;
        }
        correctAnswer = firstNumber + secondNumber;
        break;
    }

    final answer = PauliAnswer(
      firstNumber: firstNumber,
      secondNumber: secondNumber,
      userAnswer: event.answer,
      correctAnswer: correctAnswer,
      timeTaken: now.difference(currentState.problemStartTime),
      answeredAt: now,
    );

    final newAnswers = [...currentState.answers, answer];

    // Update state based on format
    switch (currentState.config.displayFormat) {
      case DisplayFormat.singleProblem:
        emit(
          currentState.copyWith(
            answers: newAnswers,
            currentProblem: PauliProblem.random(),
            problemStartTime: now,
          ),
        );
        break;

      case DisplayFormat.columnFormat:
        // Track answered cell with correct/wrong status
        final cellKey =
            '${currentState.currentColumn}-${currentState.currentRow}';
        final newAnsweredCells =
            Map<String, AnsweredCell>.from(currentState.answeredCells);
        newAnsweredCells[cellKey] = AnsweredCell(
          userAnswer: event.answer,
          isCorrect: answer.isCorrect,
        );

        var newRow = currentState.currentRow + 1;
        var newColumn = currentState.currentColumn;

        // Move to next column if we've finished this one (skip last row - no answer box)
        if (newRow >= currentState.config.rowsPerColumn - 1) {
          newRow = 0;
          newColumn++;

          // Generate more columns if needed
          if (newColumn >= currentState.columns.length) {
            final newColumns = [
              ...currentState.columns,
              ...PauliProblem.generateColumns(
                currentState.config.columnCount,
                currentState.config.rowsPerColumn,
              ),
            ];
            emit(
              currentState.copyWith(
                answers: newAnswers,
                columns: newColumns,
                currentColumn: newColumn,
                currentRow: newRow,
                answeredCells: newAnsweredCells,
                problemStartTime: now,
              ),
            );
            return;
          }
        }

        emit(
          currentState.copyWith(
            answers: newAnswers,
            currentColumn: newColumn,
            currentRow: newRow,
            answeredCells: newAnsweredCells,
            problemStartTime: now,
          ),
        );
        break;

      case DisplayFormat.gridFormat:
        final cellKey =
            '${currentState.currentColumn}-${currentState.currentRow}';
        final newAnsweredCells =
            Map<String, AnsweredCell>.from(currentState.answeredCells);
        newAnsweredCells[cellKey] = AnsweredCell(
          userAnswer: event.answer,
          isCorrect: answer.isCorrect,
        );

        // Move to next unanswered cell (skip last row - no answer box)
        var nextRow = currentState.currentRow + 1;
        var nextColumn = currentState.currentColumn;

        if (nextRow >= currentState.config.rowsPerColumn - 1) {
          nextRow = 0;
          nextColumn++;

          if (nextColumn >= currentState.columns.length) {
            // Add more columns
            final newColumns = [
              ...currentState.columns,
              ...PauliProblem.generateColumns(
                currentState.config.columnCount,
                currentState.config.rowsPerColumn,
              ),
            ];
            emit(
              currentState.copyWith(
                answers: newAnswers,
                columns: newColumns,
                currentColumn: nextColumn,
                currentRow: nextRow,
                answeredCells: newAnsweredCells,
                problemStartTime: now,
              ),
            );
            return;
          }
        }

        emit(
          currentState.copyWith(
            answers: newAnswers,
            currentColumn: nextColumn,
            currentRow: nextRow,
            answeredCells: newAnsweredCells,
            problemStartTime: now,
          ),
        );
        break;
    }
  }

  void _onSelectCell(_SelectCell event, Emitter<PauliTestState> emit) {
    final currentState = state;
    if (currentState is! _Running) return;
    if (currentState.config.displayFormat != DisplayFormat.gridFormat) return;

    // Check if cell is already answered
    final cellKey = '${event.columnIndex}-${event.rowIndex}';
    if (currentState.answeredCells.containsKey(cellKey)) return;

    emit(
      currentState.copyWith(
        currentColumn: event.columnIndex,
        currentRow: event.rowIndex,
        problemStartTime: DateTime.now(),
      ),
    );
  }

  void _onTick(_Tick event, Emitter<PauliTestState> emit) {
    final currentState = state;
    if (currentState is! _Running) return;

    final elapsed = DateTime.now().difference(currentState.startedAt);
    final totalDuration =
        Duration(minutes: currentState.config.durationMinutes);
    final remaining = totalDuration - elapsed;

    if (remaining <= Duration.zero) {
      add(const PauliTestEvent.finishTest());
      return;
    }

    emit(
      currentState.copyWith(
        elapsed: elapsed,
        remaining: remaining,
      ),
    );
  }

  void _onFinishTest(_FinishTest event, Emitter<PauliTestState> emit) {
    _timer?.cancel();

    final currentState = state;
    if (currentState is! _Running) return;

    final result = PauliResult(
      answers: currentState.answers,
      totalDuration: currentState.elapsed,
      startedAt: currentState.startedAt,
      finishedAt: DateTime.now(),
    );

    emit(PauliTestState.finished(result: result));
  }

  void _onReset(_Reset event, Emitter<PauliTestState> emit) {
    _timer?.cancel();
    emit(const PauliTestState.initial());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
