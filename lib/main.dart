import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pauli/app.dart';
import 'package:pauli/core/presentation/utils/app_bloc_observer.dart';
import 'package:pauli/core/utils/constants.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:pauli/core/locator/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencyInjection();

  Bloc.observer = AppBlocObserver();

  runApp(
    const RequestsInspector(
      enabled: Constants.kEnableChucker,
      child: MyApp(),
    ),
  );
}
