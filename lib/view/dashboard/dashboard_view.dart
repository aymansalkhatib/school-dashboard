import 'package:flutter/material.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/view/dashboard/widgets/dashboard_section_calender.dart';
import 'package:sama/view/dashboard/widgets/dashboard_section_details.dart';
import 'package:sama/view/dashboard/widgets/fl_char.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Column(
        children: [
          const DashboardSectionDetails(),
          SizedBox(height: 40 * getScaleFactor(context)),
          Row(
            children: [
              const Expanded(
                child: SectionCalender(),
              ),
              SizedBox(width: 40 * getScaleFactor(context)),
              Expanded(
                child: FlChar(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
