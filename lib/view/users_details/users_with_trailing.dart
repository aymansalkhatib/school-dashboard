import 'package:flutter/material.dart';
import 'package:sama/view/trailing_dashboard/trailing_dashboard_view.dart';
import 'package:sama/view/users_details/users_view.dart';

class UsersWithTrailing extends StatelessWidget {
  const UsersWithTrailing({
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
              Expanded(flex: 1180, child: Users()),
              Expanded(flex: 395, child: TrailingDashboard()),
            ],
          ),
        )
      ],
    );
  }
}
