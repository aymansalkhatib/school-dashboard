import 'package:flutter/material.dart';
import 'package:sama/view/drawer/trailing_dashboard/widgets/trailing_dashboard_header.dart';

class TrailingDashBoard extends StatelessWidget {
  const TrailingDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFEFBFC),
      child: const Column(
        children: [
          SizedBox(height: 40),
          TrailingDashboardHeader(),
        ],
      ),
    );
  }
}
