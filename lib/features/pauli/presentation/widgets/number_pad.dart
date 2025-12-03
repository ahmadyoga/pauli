import 'package:flutter/material.dart';
import 'package:pauli/core/theme/app_colors.dart';

class NumberPad extends StatelessWidget {
  final Function(int) onNumberPressed;
  final VoidCallback onSkipPressed;

  const NumberPad({
    super.key,
    required this.onNumberPressed,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1-3
          Row(
            children: [
              _buildNumberButton(1),
              _buildNumberButton(2),
              _buildNumberButton(3),
            ],
          ),
          const SizedBox(height: 8),
          // Row 4-6
          Row(
            children: [
              _buildNumberButton(4),
              _buildNumberButton(5),
              _buildNumberButton(6),
            ],
          ),
          const SizedBox(height: 8),
          // Row 7-9
          Row(
            children: [
              _buildNumberButton(7),
              _buildNumberButton(8),
              _buildNumberButton(9),
            ],
          ),
          const SizedBox(height: 8),
          // Row 0 and Skip
          Row(
            children: [
              const Spacer(),
              _buildNumberButton(0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Material(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: onSkipPressed,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 64,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(int number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: AppColors.neutral700,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () => onNumberPressed(number),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 64,
              alignment: Alignment.center,
              child: Text(
                '$number',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
