import 'package:flutter/material.dart';

import 'package:sama/view/trailing_teacher/widgets/header_trailing_teacher.dart';
import 'package:sama/view/trailing_teacher/widgets/list_item_schedule_details.dart';

class TrailingTeacher extends StatelessWidget {
  const TrailingTeacher({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 40),
      child: Column(
        children: [
          HeaderTrailingTeacher(),
          SizedBox(height: 30),
          ListItemScheduleDetails(),
        ],
      ),
    );
  }
}
