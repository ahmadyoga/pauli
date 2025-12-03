// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $pauliSettingsRoute,
      $pauliTestRoute,
      $pauliResultRoute,
    ];

RouteBase get $pauliSettingsRoute => GoRouteData.$route(
      path: '/',
      factory: _$PauliSettingsRoute._fromState,
    );

mixin _$PauliSettingsRoute on GoRouteData {
  static PauliSettingsRoute _fromState(GoRouterState state) =>
      const PauliSettingsRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pauliTestRoute => GoRouteData.$route(
      path: '/test',
      factory: _$PauliTestRoute._fromState,
    );

mixin _$PauliTestRoute on GoRouteData {
  static PauliTestRoute _fromState(GoRouterState state) => PauliTestRoute(
        durationMinutes:
            int.parse(state.uri.queryParameters['duration-minutes']!)!,
        displayFormat: state.uri.queryParameters['display-format']!,
      );

  PauliTestRoute get _self => this as PauliTestRoute;

  @override
  String get location => GoRouteData.$location(
        '/test',
        queryParams: {
          'duration-minutes': _self.durationMinutes.toString(),
          'display-format': _self.displayFormat,
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pauliResultRoute => GoRouteData.$route(
      path: '/result',
      factory: _$PauliResultRoute._fromState,
    );

mixin _$PauliResultRoute on GoRouteData {
  static PauliResultRoute _fromState(GoRouterState state) => PauliResultRoute(
        correctCount: int.parse(state.uri.queryParameters['correct-count']!)!,
        wrongCount: int.parse(state.uri.queryParameters['wrong-count']!)!,
        totalDurationSeconds:
            int.parse(state.uri.queryParameters['total-duration-seconds']!)!,
        answersPerMinuteJson:
            state.uri.queryParameters['answers-per-minute-json'] ?? '[]',
      );

  PauliResultRoute get _self => this as PauliResultRoute;

  @override
  String get location => GoRouteData.$location(
        '/result',
        queryParams: {
          'correct-count': _self.correctCount.toString(),
          'wrong-count': _self.wrongCount.toString(),
          'total-duration-seconds': _self.totalDurationSeconds.toString(),
          if (_self.answersPerMinuteJson != '[]')
            'answers-per-minute-json': _self.answersPerMinuteJson,
        },
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
