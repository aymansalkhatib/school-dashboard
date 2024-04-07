import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/dashboard_controller.dart';
import 'package:sama/controller/finance_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/view/dashboard/widgets/dashboard_section_calender.dart';
import 'package:sama/view/dashboard/widgets/dashboard_section_details.dart';
import 'package:sama/view/dashboard/widgets/fl_char.dart';
import 'package:sama/view/dashboard/widgets/unpaid_student.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FinanceControllerImp());
    Get.put(DashboardControllerImp());

    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, bottom: 40),
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
          SizedBox(height: 40 * getScaleFactor(context)),
          const UnpaidStudent()
        ],
      ),
    );
  }
}
