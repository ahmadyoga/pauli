import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Wraps the app in a phone-like frame when running on web
class WebFrameWrapper extends StatelessWidget {
  final Widget child;

  const WebFrameWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Only apply frame on web
    if (!kIsWeb) {
      return child;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Phone dimensions - responsive based on screen height
        const double phoneWidth = 390;
        const double borderRadius = 44;
        const double bezelWidth = 10;

        // Calculate phone height based on available screen height (leave space for title)
        final double maxPhoneHeight = constraints.maxHeight - 100;
        final double phoneHeight = maxPhoneHeight.clamp(500, 844);

        // If screen is small (mobile browser), show full screen
        if (constraints.maxWidth < phoneWidth + 60) {
          return child;
        }

        return Container(
          color: const Color(0xFF1a1a2e), // Dark background
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // App title
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Tes Pauli / Kraepelin',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),

                // Phone frame
                Container(
                  width: phoneWidth + (bezelWidth * 2),
                  height: phoneHeight + (bezelWidth * 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2d2d44),
                    borderRadius:
                        BorderRadius.circular(borderRadius + bezelWidth),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(100),
                        blurRadius: 30,
                        spreadRadius: 2,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFF3d3d5c),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(bezelWidth),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius - 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(borderRadius - 4),
                        ),
                        child: Stack(
                          children: [
                            // App content with safe area padding for notch
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: child,
                              ),
                            ),

                            // Home indicator
                            Positioned(
                              bottom: 6,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width: 120,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withAlpha(60),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
