import 'package:flutter/material.dart';
import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/student_details/students_view.dart';
import 'package:sama/view/trailing_teacher/trailing_teacher.dart';

class StudentWithTrailing extends StatelessWidget {
  const StudentWithTrailing({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 28),
                child: HeaderWithSearch(title: "Student Details"),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1180, child: Students()),
                  Expanded(flex: 395, child: TrailingTeacher()),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
