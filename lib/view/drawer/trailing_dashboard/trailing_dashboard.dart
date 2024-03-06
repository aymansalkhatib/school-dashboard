import 'package:flutter/material.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';
import 'package:sama/view/drawer/trailing_dashboard/widgets/trailing_dashboard_header.dart';
import 'package:sama/view/drawer/trailing_dashboard/widgets/trailing_dashboard_section_student.dart';

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
          SizedBox(height: 40),
          TrailingDashboardSectionStudent(),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
