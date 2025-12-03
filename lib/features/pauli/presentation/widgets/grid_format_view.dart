import 'package:flutter/material.dart';
import 'package:pauli/core/theme/app_colors.dart';
import 'package:pauli/features/pauli/domain/models/pauli_problem.dart';
import 'package:pauli/features/pauli/presentation/bloc/pauli_test_bloc.dart';

class GridFormatView extends StatefulWidget {
  final List<List<dynamic>> columns;
  final int currentColumn;
  final int currentRow;
  final Map<String, AnsweredCell> answeredCells;
  final Function(int columnIndex, int rowIndex) onCellSelected;

  const GridFormatView({
    super.key,
    required this.columns,
    required this.currentColumn,
    required this.currentRow,
    required this.answeredCells,
    required this.onCellSelected,
  });

  @override
  State<GridFormatView> createState() => _GridFormatViewState();
}

class _GridFormatViewState extends State<GridFormatView> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  // Dimensions for calculating scroll positions
  static const double _columnWidth = 52.0; // 40 + 8 margin + 4 padding
  static const double _rowHeight = 65.0; // 36 + 22 + margins

  @override
  void didUpdateWidget(GridFormatView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Auto-scroll when current position changes
    if (oldWidget.currentRow != widget.currentRow ||
        oldWidget.currentColumn != widget.currentColumn) {
      _scrollToCurrentCell();
    }
  }

  void _scrollToCurrentCell() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Scroll horizontally to current column
      if (_horizontalScrollController.hasClients) {
        final targetX =
            (widget.currentColumn * _columnWidth) - (_columnWidth * 2);
        final clampedX = targetX.clamp(
          0.0,
          _horizontalScrollController.position.maxScrollExtent,
        );
        _horizontalScrollController.animateTo(
          clampedX,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }

      // Scroll vertically to current row
      if (_verticalScrollController.hasClients) {
        final targetY = (widget.currentRow * _rowHeight) - (_rowHeight * 2);
        final clampedY = targetY.clamp(
          0.0,
          _verticalScrollController.position.maxScrollExtent,
        );
        _verticalScrollController.animateTo(
          clampedY,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        controller: _horizontalScrollController,
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          controller: _verticalScrollController,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.columns.asMap().entries.map((colEntry) {
              final colIndex = colEntry.key;
              final column = colEntry.value;

              return _buildGridColumn(context, column, colIndex);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildGridColumn(
      BuildContext context, List<dynamic> column, int colIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: column.asMap().entries.map((rowEntry) {
          final rowIndex = rowEntry.key;
          final problem = rowEntry.value as PauliProblem;
          final cellKey = '$colIndex-$rowIndex';
          final answeredCell = widget.answeredCells[cellKey];
          final isAnswered = answeredCell != null;
          final isCorrect = answeredCell?.isCorrect ?? false;
          final isCurrent =
              colIndex == widget.currentColumn && rowIndex == widget.currentRow;
          final isSecondsNumber = colIndex == widget.currentColumn &&
              rowIndex == widget.currentRow + 1;
          final hasNextRow = rowIndex < column.length - 1;

          return _buildGridCell(
            context,
            problem,
            colIndex,
            rowIndex,
            isCurrent,
            isSecondsNumber,
            isAnswered,
            isCorrect,
            hasNextRow,
            answeredCell?.userAnswer,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGridCell(
    BuildContext context,
    PauliProblem problem,
    int colIndex,
    int rowIndex,
    bool isCurrent,
    bool isSecondsNumber,
    bool isAnswered,
    bool isCorrect,
    bool hasNextRow,
    int? userAnswer,
  ) {
    return GestureDetector(
      onTap:
          isAnswered ? null : () => widget.onCellSelected(colIndex, rowIndex),
      child: Container(
        margin: const EdgeInsets.all(2),
        child: Column(
          children: [
            // Number (top)
            Container(
              width: 40,
              height: 36,
              decoration: BoxDecoration(
                color: isCurrent || isSecondsNumber
                    ? AppColors.neutral100
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: isCurrent || isSecondsNumber
                    ? Border.all(color: AppColors.neutral800, width: 2)
                    : null,
              ),
              child: Center(
                child: Text(
                  '${problem.firstNumber}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                    color: isAnswered
                        ? AppColors.neutral400
                        : AppColors.neutral800,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 2),
            // Plus and answer indicator (between numbers)
            if (hasNextRow)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '+',
                      style: TextStyle(
                        fontSize: 11,
                        color: isAnswered
                            ? AppColors.neutral400
                            : AppColors.neutral600,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? AppColors.neutral800
                            : isAnswered
                                ? (isCorrect
                                    ? AppColors.success.withAlpha(38)
                                    : AppColors.error.withAlpha(38))
                                : AppColors.neutral100,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isCurrent
                              ? AppColors.neutral800
                              : isAnswered
                                  ? (isCorrect
                                      ? AppColors.success
                                      : AppColors.error)
                                  : AppColors.neutral300,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          isAnswered ? (isCorrect ? '✓' : '✗') : '?',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: isCurrent
                                ? Colors.white
                                : isAnswered
                                    ? (isCorrect
                                        ? AppColors.success
                                        : AppColors.error)
                                    : AppColors.neutral500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
