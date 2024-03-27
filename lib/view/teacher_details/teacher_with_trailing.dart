import 'package:flutter/material.dart';
import 'package:sama/model/teacher_model.dart';
import 'package:sama/view/teacher_details/teacher_view.dart';
import 'package:sama/core/utils/header_with_search.dart';
import 'package:sama/view/trailing_teacher/trailing_teacher.dart';

class TeachersWithTrailing extends StatelessWidget {
  const TeachersWithTrailing({
    super.key,
    required this.teacherModel,
  });
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 28),
                child: HeaderWithSearch(title: "Teacher Details"),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1180,
                      child: Teachers(
                        teacherModel: teacherModel,
                      )),
                  const Expanded(flex: 395, child: TrailingTeacher()),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
