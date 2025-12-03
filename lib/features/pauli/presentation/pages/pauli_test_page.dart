import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pauli/core/router/app_routes.dart';
import 'package:pauli/core/theme/app_colors.dart';
import 'package:pauli/features/pauli/domain/models/pauli_config.dart';
import 'package:pauli/features/pauli/presentation/bloc/pauli_test_bloc.dart';
import 'package:pauli/features/pauli/presentation/widgets/column_format_view.dart';
import 'package:pauli/features/pauli/presentation/widgets/grid_format_view.dart';
import 'package:pauli/features/pauli/presentation/widgets/number_pad.dart';
import 'package:pauli/features/pauli/presentation/widgets/single_problem_view.dart';

class PauliTestPage extends StatelessWidget {
  const PauliTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _showExitConfirmation(context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<PauliTestBloc, PauliTestState>(
            listener: (context, state) {
              state.maybeWhen(
                finished: (result) {
                  final answersJson = '[${result.answersPerMinute.join(',')}]';
                  PauliResultRoute(
                    correctCount: result.correctCount,
                    wrongCount: result.wrongCount,
                    totalDurationSeconds: result.totalDuration.inSeconds,
                    answersPerMinuteJson: answersJson,
                  ).go(context);
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                running: (
                  config,
                  startedAt,
                  elapsed,
                  remaining,
                  answers,
                  currentProblem,
                  problemStartTime,
                  columns,
                  currentColumn,
                  currentRow,
                  answeredCells,
                ) {
                  return Column(
                    children: [
                      // Timer Header
                      _buildTimerHeader(context, remaining, answers.length),

                      // Problem Display
                      Expanded(
                        child: _buildProblemDisplay(
                          context,
                          config,
                          currentProblem,
                          columns,
                          currentColumn,
                          currentRow,
                          answeredCells,
                        ),
                      ),

                      // Number Pad
                      NumberPad(
                        onNumberPressed: (number) {
                          context.read<PauliTestBloc>().add(
                                PauliTestEvent.submitAnswer(number),
                              );
                        },
                        onSkipPressed: () {
                          context.read<PauliTestBloc>().add(
                                const PauliTestEvent.finishTest(),
                              );
                        },
                      ),
                    ],
                  );
                },
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTimerHeader(
      BuildContext context, Duration remaining, int answeredCount) {
    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds % 60;
    final timeString =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    // Warning when less than 1 minute
    final isWarning = remaining.inSeconds < 60;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.neutral200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          GestureDetector(
            onTap: () => _showExitConfirmation(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 20,
                color: AppColors.neutral700,
              ),
            ),
          ),

          // Timer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isWarning
                  ? AppColors.error.withOpacity(0.1)
                  : AppColors.neutral100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 20,
                  color: isWarning ? AppColors.error : AppColors.neutral700,
                ),
                const SizedBox(width: 8),
                Text(
                  timeString,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFeatures: const [FontFeature.tabularFigures()],
                    color: isWarning ? AppColors.error : AppColors.neutral800,
                  ),
                ),
              ],
            ),
          ),

          // Answered Count
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  size: 16,
                  color: AppColors.success,
                ),
                const SizedBox(width: 4),
                Text(
                  '$answeredCount',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProblemDisplay(
    BuildContext context,
    PauliConfig config,
    currentProblem,
    List<List<dynamic>> columns,
    int currentColumn,
    int currentRow,
    Map<String, AnsweredCell> answeredCells,
  ) {
    switch (config.displayFormat) {
      case DisplayFormat.singleProblem:
        return SingleProblemView(problem: currentProblem);

      case DisplayFormat.columnFormat:
        return ColumnFormatView(
          columns: columns.map((col) => col.cast<dynamic>()).toList(),
          currentColumn: currentColumn,
          currentRow: currentRow,
          answeredCells: answeredCells,
        );

      case DisplayFormat.gridFormat:
        return GridFormatView(
          columns: columns.map((col) => col.cast<dynamic>()).toList(),
          currentColumn: currentColumn,
          currentRow: currentRow,
          answeredCells: answeredCells,
          onCellSelected: (col, row) {
            context.read<PauliTestBloc>().add(
                  PauliTestEvent.selectCell(col, row),
                );
          },
        );
    }
  }

  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Keluar dari Tes?'),
        content: const Text(
          'Progres tes akan hilang jika Anda keluar sekarang.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context
                  .read<PauliTestBloc>()
                  .add(const PauliTestEvent.finishTest());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text(
              'Selesai & Keluar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
