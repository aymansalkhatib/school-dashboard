import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/core/utils/adaptive_layout_widget.dart';
import 'package:sama/view/desktop.dart';

class SAMA extends StatelessWidget {
  const SAMA({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationControllerImp());

    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const FlutterLogo(),
        tabletLayout: (context) => const FlutterLogo(),
        desktopLayout: (context) => const Desktop(),
      ),
    );
  }
}
