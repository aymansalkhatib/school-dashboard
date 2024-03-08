import 'package:flutter/material.dart';
import 'package:sama/view/teacher/teacher_view.dart';
import 'package:sama/view/trailing_dashboard/trailing_dashboard_view.dart';

class TeachersWithTrailing extends StatelessWidget {
  const TeachersWithTrailing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Row(
            children: [
              Expanded(flex: 1180, child: Teachers()),
              Expanded(flex: 395, child: TrailingDashBoard()),
            ],
          ),
        )
      ],
    );
  }
}
