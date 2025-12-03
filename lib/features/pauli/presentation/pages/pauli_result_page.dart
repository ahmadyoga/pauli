import 'package:flutter/material.dart';
import 'package:pauli/core/router/app_routes.dart';
import 'package:pauli/core/theme/app_colors.dart';
import 'package:pauli/features/pauli/domain/models/pauli_answer.dart';

class PauliResultPage extends StatelessWidget {
  final PauliResult result;

  const PauliResultPage({super.key, required this.result});

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
              automaticallyImplyLeading: false,
              title: Text(
                'Hasil Tes',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Score Card
                  _buildScoreCard(context),

                  const SizedBox(height: 24),

                  // Stats Grid
                  _buildStatsGrid(context),

                  const SizedBox(height: 24),

                  // Performance Chart
                  _buildPerformanceSection(context),

                  const SizedBox(height: 24),

                  // Analysis
                  _buildAnalysisSection(context),

                  const SizedBox(height: 32),

                  // Action Buttons
                  _buildActionButtons(context),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard(BuildContext context) {
    final accuracy = result.accuracy;
    Color scoreColor;
    String scoreLabel;
    IconData scoreIcon;

    if (accuracy >= 90) {
      scoreColor = AppColors.success;
      scoreLabel = 'Sangat Baik';
      scoreIcon = Icons.emoji_events_outlined;
    } else if (accuracy >= 75) {
      scoreColor = AppColors.info;
      scoreLabel = 'Baik';
      scoreIcon = Icons.thumb_up_outlined;
    } else if (accuracy >= 60) {
      scoreColor = AppColors.warning;
      scoreLabel = 'Cukup';
      scoreIcon = Icons.trending_flat_outlined;
    } else {
      scoreColor = AppColors.error;
      scoreLabel = 'Perlu Latihan';
      scoreIcon = Icons.fitness_center_outlined;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            scoreColor.withOpacity(0.1),
            scoreColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scoreColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scoreColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              scoreIcon,
              size: 40,
              color: scoreColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${accuracy.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: scoreColor,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: scoreColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              scoreLabel,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: scoreColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Akurasi Jawaban',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.neutral600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistik',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatItem(
                context,
                icon: Icons.check_circle_outline,
                value: '${result.correctCount}',
                label: 'Benar',
                color: AppColors.success,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatItem(
                context,
                icon: Icons.cancel_outlined,
                value: '${result.wrongCount}',
                label: 'Salah',
                color: AppColors.error,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatItem(
                context,
                icon: Icons.format_list_numbered,
                value: '${result.totalAnswered}',
                label: 'Total Dijawab',
                color: AppColors.info,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatItem(
                context,
                icon: Icons.speed_outlined,
                value: '${result.averageTimePerAnswer.toStringAsFixed(1)}s',
                label: 'Rata-rata/Soal',
                color: AppColors.warning,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatItem(
                context,
                icon: Icons.timer_outlined,
                value: _formatDuration(result.totalDuration),
                label: 'Durasi Tes',
                color: AppColors.neutral700,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatItem(
                context,
                icon: Icons.trending_up_outlined,
                value:
                    '${(result.totalAnswered / (result.totalDuration.inMinutes == 0 ? 1 : result.totalDuration.inMinutes)).toStringAsFixed(1)}',
                label: 'Soal/Menit',
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.neutral600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceSection(BuildContext context) {
    final answersPerMinute = result.answersPerMinute;
    if (answersPerMinute.isEmpty) return const SizedBox.shrink();

    final maxValue =
        answersPerMinute.reduce((a, b) => a > b ? a : b).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performa per Menit',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 180,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: answersPerMinute.asMap().entries.map((entry) {
              final index = entry.key;
              final value = entry.value;
              final barHeight = maxValue > 0 ? (value / maxValue) * 100 : 0.0;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '$value',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: barHeight,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${index + 1}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.neutral600,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Menit ke-',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.neutral500,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnalysisSection(BuildContext context) {
    final accuracy = result.accuracy;
    final avgTime = result.averageTimePerAnswer;
    final totalAnswered = result.totalAnswered;
    final duration = result.totalDuration.inMinutes;

    final List<String> insights = [];

    if (accuracy >= 90) {
      insights.add('✨ Akurasi sangat tinggi! Konsentrasi Anda sangat baik.');
    } else if (accuracy >= 75) {
      insights.add('👍 Akurasi baik. Terus pertahankan fokus Anda.');
    } else if (accuracy < 60) {
      insights.add('💡 Coba lebih fokus pada keakuratan daripada kecepatan.');
    }

    if (avgTime < 2) {
      insights.add('⚡ Kecepatan menjawab sangat cepat!');
    } else if (avgTime > 5) {
      insights.add('🎯 Waktu menjawab cukup lama. Coba tingkatkan kecepatan.');
    }

    if (duration > 0 && totalAnswered / duration >= 20) {
      insights.add(
        '🚀 Produktivitas tinggi dengan ${(totalAnswered / duration).toStringAsFixed(0)} soal per menit.',
      );
    }

    if (insights.isEmpty) {
      insights.add('📊 Terus berlatih untuk meningkatkan performa.');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Analisis',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        ...insights.map(
          (insight) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                insight,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              const PauliSettingsRoute().go(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neutral800,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh_outlined, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'Tes Lagi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              const PauliSettingsRoute().go(context);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Kembali ke Menu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    }
    return '${seconds}s';
  }
}
