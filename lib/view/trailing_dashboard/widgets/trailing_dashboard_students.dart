import 'package:flutter/material.dart';

import 'package:sama/view/trailing_Dashboard/widgets/item_recent_students.dart';

class TrailingDashboadRecentStudents extends StatelessWidget {
  const TrailingDashboadRecentStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ItemRecentStudents(),
        ItemRecentStudents(),
        ItemRecentStudents(),
        ItemRecentStudents(),
        ItemRecentStudents(),
      ],
    );
  }
}
