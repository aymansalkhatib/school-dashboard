import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/dashboard_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';

class RowDays extends StatelessWidget {
  const RowDays({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardControllerImp>(builder: (controller) {
      return Row(children: [
        for (int i = 0; i < 7; i++)
          Expanded(
            child: Center(
              child: Tooltip(
                message: controller.dateTableModel.titleTable[i],
                child: Text(
                  controller.dateTableModel.titleTable[i].substring(0, 3),
                  style: AppFontStyle.styleRegular18(context)
                      .copyWith(fontSize: 18 * getScaleFactor(context)),
                ),
              ),
            ),
          ),
      ]);
    });
  }
}
