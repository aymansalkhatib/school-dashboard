import 'package:flutter/material.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/view/trailing_Dashboard/widgets/trailing_Dashboard_header.dart';
import 'package:sama/view/trailing_Dashboard/widgets/trailing_Dashboard_section_student.dart';
import 'package:sama/view/trailing_Dashboard/widgets/trailing_Dashboard_students.dart';

class TrailingDashboard extends StatelessWidget {
  const TrailingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getScaleFactor(context) * 35),
      color: const Color(0xffFEFBFC),
      child: const Column(
        children: [
          SizedBox(height: 40),
          TrailingDashboardHeader(),
          SizedBox(height: 40),
          TrailingDashboardSectionStudent(),
          SizedBox(height: 25),
          TrailingDashboadRecentStudents()
        ],
      ),
    );
  }
}
