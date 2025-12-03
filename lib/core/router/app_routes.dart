import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/pauli/domain/models/pauli_answer.dart';
import '../../features/pauli/domain/models/pauli_config.dart';
import '../../features/pauli/presentation/bloc/pauli_test_bloc.dart';
import '../../features/pauli/presentation/pages/pauli_result_page.dart';
import '../../features/pauli/presentation/pages/pauli_settings_page.dart';
import '../../features/pauli/presentation/pages/pauli_test_page.dart';

part 'app_routes.g.dart';

// Pauli Test Settings Route (Main Route)
@TypedGoRoute<PauliSettingsRoute>(
  path: '/',
)
class PauliSettingsRoute extends GoRouteData with _$PauliSettingsRoute {
  const PauliSettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PauliSettingsPage();
  }
}

// Pauli Test Route
@TypedGoRoute<PauliTestRoute>(
  path: '/test',
)
class PauliTestRoute extends GoRouteData with _$PauliTestRoute {
  final int durationMinutes;
  final String displayFormat;

  const PauliTestRoute({
    required this.durationMinutes,
    required this.displayFormat,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final format = DisplayFormat.values.firstWhere(
      (f) => f.name == displayFormat,
      orElse: () => DisplayFormat.singleProblem,
    );

    final config = PauliConfig(
      durationMinutes: durationMinutes,
      displayFormat: format,
    );

    return BlocProvider(
      create: (_) => PauliTestBloc()..add(PauliTestEvent.startTest(config)),
      child: const PauliTestPage(),
    );
  }
}

// Pauli Result Route
@TypedGoRoute<PauliResultRoute>(
  path: '/result',
)
class PauliResultRoute extends GoRouteData with _$PauliResultRoute {
  final int correctCount;
  final int wrongCount;
  final int totalDurationSeconds;
  final String answersPerMinuteJson;

  const PauliResultRoute({
    required this.correctCount,
    required this.wrongCount,
    required this.totalDurationSeconds,
    this.answersPerMinuteJson = '[]',
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Parse answers per minute from JSON string
    try {
      final jsonStr = answersPerMinuteJson;
      if (jsonStr.isNotEmpty && jsonStr != '[]') {}
    } catch (_) {}

    final now = DateTime.now();
    final startedAt = now.subtract(Duration(seconds: totalDurationSeconds));

    // Create dummy answers with correct/wrong counts
    final answers = <PauliAnswer>[];
    for (int i = 0; i < correctCount; i++) {
      answers.add(
        PauliAnswer(
          firstNumber: 0,
          secondNumber: 0,
          userAnswer: 0,
          correctAnswer: 0,
          timeTaken: const Duration(seconds: 1),
          answeredAt: now,
        ),
      );
    }
    for (int i = 0; i < wrongCount; i++) {
      answers.add(
        PauliAnswer(
          firstNumber: 0,
          secondNumber: 0,
          userAnswer: 1,
          correctAnswer: 0,
          timeTaken: const Duration(seconds: 1),
          answeredAt: now,
        ),
      );
    }

    final result = PauliResult(
      answers: answers,
      totalDuration: Duration(seconds: totalDurationSeconds),
      startedAt: startedAt,
      finishedAt: now,
    );

    return PauliResultPage(result: result);
  }
}
