import 'package:flutter/material.dart';
import 'package:sama/utils/adaptive_layout_widget.dart';
import 'package:sama/view/desktop.dart';

class SAMA extends StatelessWidget {
  const SAMA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const FlutterLogo(),
        tabletLayout: (context) => const FlutterLogo(),
        desktopLayout: (context) => const Desktop(),
      ),
    );
  }
}
