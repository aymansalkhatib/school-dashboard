import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/view/dashboard/widgets/row_days.dart';
import 'package:sama/view/dashboard/widgets/table_calander.dart';
import 'package:sama/view/dashboard/widgets/title_with_month.dart';

class SectionCalender extends StatelessWidget {
  const SectionCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32 * getScaleFactor(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const TitleWithMonth(),
          SizedBox(height: 14 * getScaleFactor(context)),
          const RowDays(),
          const SizedBox(height: 4),
          const TableCalander(),
        ],
      ),
    );
  }
}
