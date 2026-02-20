import 'dart:async';
import 'package:flutter/foundation.dart';

/// Service to detect and handle debugging/devtools in web
class AntiDebuggingService {
  static final AntiDebuggingService _instance = AntiDebuggingService._internal();
  factory AntiDebuggingService() => _instance;
  AntiDebuggingService._internal();

  final _devToolsStateController = StreamController<bool>.broadcast();
  Stream<bool> get devToolsStateStream => _devToolsStateController.stream;

  bool _isDevToolsOpen = false;
  bool get isDevToolsOpen => _isDevToolsOpen;

  /// Initialize anti-debugging detection (web only)
  void initialize() {
    if (!kIsWeb) return;

    // On web, we rely on JavaScript detection in index.html
    // The overlay is handled by JavaScript for better performance
    _setupWebListener();
  }

  void _setupWebListener() {
    // Web JS handles the detection and overlay
    // This method is a placeholder for future Dart-side handling if needed
  }

  void updateDevToolsState(bool isOpen) {
    if (_isDevToolsOpen != isOpen) {
      _isDevToolsOpen = isOpen;
      _devToolsStateController.add(isOpen);
    }
  }

  void dispose() {
    _devToolsStateController.close();
  }
}
