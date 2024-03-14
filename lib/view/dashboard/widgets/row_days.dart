import 'package:flutter/material.dart';
import 'package:sama/constants/app_font_style.dart';

class RowDays extends StatelessWidget {
  const RowDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    return Row(children: [
      for (int i = 0; i < days.length; i++)
        Expanded(
            child: Center(
          child: Text(
            days[i],
            style: AppFontStyle.styleRegular18(context).copyWith(fontSize: 18 * getScaleFactor(context)),
          ),
        )),
    ]);
  }
}
