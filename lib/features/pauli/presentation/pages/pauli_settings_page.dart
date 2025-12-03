import 'package:flutter/material.dart';
import 'package:pauli/core/router/app_routes.dart';
import 'package:pauli/core/theme/app_colors.dart';
import 'package:pauli/features/pauli/domain/models/pauli_config.dart';

class PauliSettingsPage extends StatefulWidget {
  const PauliSettingsPage({super.key});

  @override
  State<PauliSettingsPage> createState() => _PauliSettingsPageState();
}

class _PauliSettingsPageState extends State<PauliSettingsPage> {
  int _selectedDuration = 5; // Default 5 minutes
  DisplayFormat _selectedFormat = DisplayFormat.singleProblem;

  final List<int> _durationOptions = [1, 2, 3, 5, 10, 15, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                'Tes Pauli',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Header Section
                  _buildHeaderSection(context),

                  const SizedBox(height: 32),

                  // Duration Section
                  _buildDurationSection(context),

                  const SizedBox(height: 32),

                  // Display Format Section
                  _buildFormatSection(context),

                  const SizedBox(height: 48),

                  // Start Button
                  _buildStartButton(context),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.neutral200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.neutral800,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.psychology_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tes Kraepelin/Pauli',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tes konsentrasi & kecepatan',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.neutral600,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Jumlahkan dua angka yang berdekatan dan masukkan digit terakhir dari hasil penjumlahan.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.neutral700,
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildExampleNumber('7'),
                const SizedBox(width: 8),
                const Text('+',
                    style:
                        TextStyle(fontSize: 20, color: AppColors.neutral600)),
                const SizedBox(width: 8),
                _buildExampleNumber('8'),
                const SizedBox(width: 8),
                const Text('=',
                    style:
                        TextStyle(fontSize: 20, color: AppColors.neutral600)),
                const SizedBox(width: 8),
                _buildExampleNumber('15'),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward,
                    size: 16, color: AppColors.neutral600),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.neutral800,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  Widget _buildExampleNumber(String number) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDurationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Durasi Tes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Pilih lama waktu tes',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.neutral600,
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _durationOptions.map((duration) {
            final isSelected = _selectedDuration == duration;
            return GestureDetector(
              onTap: () => setState(() => _selectedDuration = duration),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.neutral800 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.neutral800
                        : AppColors.neutral300,
                  ),
                ),
                child: Text(
                  '$duration menit',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : AppColors.neutral800,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFormatSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Format Tampilan',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Pilih gaya tampilan soal',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.neutral600,
              ),
        ),
        const SizedBox(height: 16),
        ...DisplayFormat.values.map((format) {
          final isSelected = _selectedFormat == format;
          return GestureDetector(
            onTap: () => setState(() => _selectedFormat = format),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.neutral800 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      isSelected ? AppColors.neutral800 : AppColors.neutral300,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withOpacity(0.2)
                          : AppColors.neutral100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getFormatIcon(format),
                      color: isSelected ? Colors.white : AppColors.neutral700,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          format.label,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : AppColors.neutral800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          format.description,
                          style: TextStyle(
                            fontSize: 13,
                            color: isSelected
                                ? Colors.white.withOpacity(0.8)
                                : AppColors.neutral600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Radio<DisplayFormat>(
                    value: format,
                    groupValue: _selectedFormat,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _selectedFormat = value);
                      }
                    },
                    activeColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return isSelected ? Colors.white : AppColors.neutral800;
                      }
                      return AppColors.neutral400;
                    }),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  IconData _getFormatIcon(DisplayFormat format) {
    switch (format) {
      case DisplayFormat.singleProblem:
        return Icons.crop_square_outlined;
      case DisplayFormat.columnFormat:
        return Icons.view_column_outlined;
      case DisplayFormat.gridFormat:
        return Icons.grid_view_outlined;
    }
  }

  Widget _buildStartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          PauliTestRoute(
            durationMinutes: _selectedDuration,
            displayFormat: _selectedFormat.name,
          ).go(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mulai Tes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
