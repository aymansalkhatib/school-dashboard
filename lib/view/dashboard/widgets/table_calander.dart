import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/dashboard_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

class TableCalander extends StatelessWidget {
  const TableCalander({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: const Color.fromARGB(255, 240, 232, 232),
        width: 1,
        borderRadius: BorderRadius.circular(2),
      ),
      children: [
        for (int i = 0; i < 5; i++)
          TableRow(
            children: [
              for (int j = 0; j < 7; j++)
                GetBuilder<DashboardControllerImp>(builder: (controller) {
                  bool isToday = controller.dateTableModel.today ==
                      controller.dateTableModel.fillGrid[j + 7 * i];
                  return TableCell(
                    child: AspectRatio(
                      aspectRatio: 65 / 74,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: isToday
                                  ? AppColors.primaryPurple
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              controller.dateTableModel.fillGrid[j + 7 * i]
                                  .toString(),
                              style: AppFontStyle.styleRegular18(context,
                                      lower: 0.6)
                                  .copyWith(
                                      color: isToday ? Colors.white : null,
                                      height: 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            ],
          ),
      ],
    );
  }
}
