import 'package:flutter/material.dart';
import 'package:pauli/core/theme/app_colors.dart';
import 'package:pauli/features/pauli/domain/models/pauli_problem.dart';
import 'package:pauli/features/pauli/presentation/bloc/pauli_test_bloc.dart';

class ColumnFormatView extends StatefulWidget {
  final List<List<dynamic>> columns;
  final int currentColumn;
  final int currentRow;
  final Map<String, AnsweredCell> answeredCells;

  const ColumnFormatView({
    super.key,
    required this.columns,
    required this.currentColumn,
    required this.currentRow,
    required this.answeredCells,
  });

  @override
  State<ColumnFormatView> createState() => _ColumnFormatViewState();
}

class _ColumnFormatViewState extends State<ColumnFormatView> {
  final Map<int, ScrollController> _scrollControllers = {};

  // Height of each row item (number + answer row + margins)
  static const double _itemHeight = 72.0;

  @override
  void initState() {
    super.initState();
    _initScrollControllers();
  }

  void _initScrollControllers() {
    // Initialize controllers for visible columns
    final startColumn = (widget.currentColumn ~/ 3) * 3;
    for (int i = 0; i < 3; i++) {
      final colIndex = startColumn + i;
      if (!_scrollControllers.containsKey(colIndex)) {
        _scrollControllers[colIndex] = ScrollController();
      }
    }
  }

  @override
  void didUpdateWidget(ColumnFormatView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if we need new scroll controllers
    _initScrollControllers();

    // Auto-scroll when current row changes
    if (oldWidget.currentRow != widget.currentRow ||
        oldWidget.currentColumn != widget.currentColumn) {
      _scrollToCurrentRow();
    }
  }

  void _scrollToCurrentRow() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = _scrollControllers[widget.currentColumn];
      if (controller != null && controller.hasClients) {
        // Calculate target scroll position to keep current row visible
        // We want to show a few items above the current one for context
        final targetOffset =
            (widget.currentRow * _itemHeight) - (_itemHeight * 2);
        final clampedOffset = targetOffset.clamp(
          0.0,
          controller.position.maxScrollExtent,
        );

        controller.animateTo(
          clampedOffset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    for (final controller in _scrollControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show 3 columns at a time, centered on current
    final startColumn = (widget.currentColumn ~/ 3) * 3;
    final visibleColumns = widget.columns.skip(startColumn).take(3).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: visibleColumns.asMap().entries.map((entry) {
          final colIndex = startColumn + entry.key;
          final column = entry.value;

          return Expanded(
            child: _buildColumn(context, column, colIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildColumn(
    BuildContext context,
    List<dynamic> column,
    int colIndex,
  ) {
    final isCurrentColumn = colIndex == widget.currentColumn;

    // Get or create scroll controller for this column
    if (!_scrollControllers.containsKey(colIndex)) {
      _scrollControllers[colIndex] = ScrollController();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ListView.builder(
        controller: _scrollControllers[colIndex],
        itemCount: column.length,
        itemBuilder: (context, rowIndex) {
          return _buildNumberAndAnswerRow(
            context,
            column,
            colIndex,
            rowIndex,
            isCurrentColumn,
          );
        },
      ),
    );
  }

  Widget _buildNumberAndAnswerRow(
    BuildContext context,
    List<dynamic> column,
    int colIndex,
    int rowIndex,
    bool isCurrentColumn,
  ) {
    final problem = column[rowIndex] as PauliProblem;
    final isCurrentCell = isCurrentColumn && rowIndex == widget.currentRow;
    final cellKey = '$colIndex-$rowIndex';
    final answeredCell = widget.answeredCells[cellKey];
    final isAnswered = answeredCell != null;
    final userAnswer = answeredCell?.userAnswer.toString() ?? '';
    final isCorrect = answeredCell?.isCorrect ?? false;

    // Get the next problem for the second number (if exists)
    final hasNextNumber = rowIndex < column.length - 1;

    final isSecondsNumber =
        hasNextNumber && rowIndex - 1 == widget.currentRow && isCurrentColumn;

    return SizedBox(
      height: _itemHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // First Number (top)
          Container(
            width: 40,
            height: 36,
            decoration: BoxDecoration(
              color: isCurrentCell || isSecondsNumber
                  ? AppColors.neutral100
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: isCurrentCell || isSecondsNumber
                  ? Border.all(color: AppColors.neutral800, width: 2)
                  : null,
            ),
            child: Center(
              child: Text(
                '${problem.firstNumber}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: isCurrentCell ? FontWeight.bold : FontWeight.w500,
                  color: isCurrentCell || isSecondsNumber
                      ? AppColors.neutral800
                      : AppColors.neutral400,
                ),
              ),
            ),
          ),

          // Answer row (+ and ?) - between the two numbers
          if (hasNextNumber)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isAnswered
                          ? AppColors.neutral400
                          : AppColors.neutral600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: isCurrentCell
                          ? AppColors.neutral800
                          : isAnswered
                              ? (isCorrect
                                  ? AppColors.success.withAlpha(25)
                                  : AppColors.error.withAlpha(25))
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isCurrentCell
                            ? AppColors.neutral800
                            : isAnswered
                                ? (isCorrect
                                    ? AppColors.success
                                    : AppColors.error)
                                : AppColors.neutral300,
                        width: isCurrentCell ? 2 : 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        isAnswered ? userAnswer : '?',
                        style: TextStyle(
                          fontSize: isAnswered ? 12 : 16,
                          fontWeight: FontWeight.bold,
                          color: isCurrentCell
                              ? Colors.white
                              : isAnswered
                                  ? (isCorrect
                                      ? AppColors.success
                                      : AppColors.error)
                                  : AppColors.neutral400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
