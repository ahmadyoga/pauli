import 'dart:math';

class PauliProblem {
  final int firstNumber;
  final int secondNumber;

  PauliProblem({
    required this.firstNumber,
    required this.secondNumber,
  });

  int get correctAnswer => firstNumber + secondNumber;

  // For Pauli test, we only need the last digit of the sum
  int get lastDigitAnswer => correctAnswer % 10;

  factory PauliProblem.random() {
    final random = Random();
    return PauliProblem(
      firstNumber: random.nextInt(9) + 1, // 1-9
      secondNumber: random.nextInt(9) + 1, // 1-9
    );
  }

  static List<PauliProblem> generateColumn(int count) {
    return List.generate(count, (_) => PauliProblem.random());
  }

  static List<List<PauliProblem>> generateColumns(
    int columnCount,
    int rowCount,
  ) {
    return List.generate(columnCount, (_) => generateColumn(rowCount));
  }
}
