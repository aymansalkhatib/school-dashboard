import 'package:flutter/material.dart';
import 'package:sama/view/drawer/custom_drawer.dart';
import 'package:sama/view/drawer/trailing_dashboard/trailing_dashboard.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 345, child: CustomDrawer()),
        Expanded(flex: 1180, child: Container()),
        const Expanded(flex: 395, child: TrailingDashBoard()),
      ],
    );
  }
}
