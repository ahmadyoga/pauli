import 'package:flutter/material.dart';
import 'package:pauli/core/theme/app_colors.dart';
import 'package:pauli/features/pauli/domain/models/pauli_problem.dart';

class SingleProblemView extends StatelessWidget {
  final PauliProblem problem;

  const SingleProblemView({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Problem display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // First number
                _buildNumber(context, problem.firstNumber),

                const SizedBox(height: 16),

                // Plus sign
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.neutral200,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 24,
                    color: AppColors.neutral600,
                  ),
                ),

                const SizedBox(height: 16),

                // Second number
                _buildNumber(context, problem.secondNumber),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Hint text
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.neutral200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 16,
                  color: AppColors.neutral600,
                ),
                const SizedBox(width: 8),
                Text(
                  'Masukkan digit terakhir dari ${problem.firstNumber} + ${problem.secondNumber}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.neutral600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumber(BuildContext context, int number) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neutral300, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral800,
          ),
        ),
      ),
    );
  }
}
