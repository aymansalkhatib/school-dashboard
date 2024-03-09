import 'package:flutter/material.dart';
import 'package:sama/view/teacher/teacher_view.dart';
import 'package:sama/view/teacher/widgets/teacher_header_with_search.dart';
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
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                TeacherHeaderWithSearch(),
                SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1180, child: Teachers()),
                    Expanded(flex: 395, child: TrailingDashBoard()),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
