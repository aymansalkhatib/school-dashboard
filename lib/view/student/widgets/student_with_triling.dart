import 'package:flutter/material.dart';
import 'package:sama/utils/header_with_search.dart';
import 'package:sama/view/student/students_view.dart';
import 'package:sama/view/trailing_teacher/trailing_teacher.dart';

class StudentWithTrailing extends StatelessWidget {
  const StudentWithTrailing({super.key});
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
                HeaderWithSearch(title: "Student Details"),
                SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1180, child: Students()),
                    Expanded(flex: 395, child: TrailingTeacher()),
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
