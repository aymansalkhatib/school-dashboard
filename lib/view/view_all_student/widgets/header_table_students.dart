import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/core/constants/app_font_style.dart';

class HeaderTableStudents extends StatelessWidget {
  const HeaderTableStudents({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(children: [
        text("ID", flex: 1),
        text("Name", align: Alignment.centerLeft, flex: 3),
        text("Date"),
        text("Parent Name"),
        text("City"),
        text("Contact"),
        text("Grade", flex: 1),
        SizedBox(width: 20 * getScaleFactor(context)),
        SizedBox(
          width: 45,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Action",
              style: AppFontStyle.styleSemiBold16(context),
            ),
          ),
        ),
      ]),
    );
  }

  Widget text(String text, {int? flex, AlignmentGeometry? align}) {
    return Expanded(
      flex: flex ?? 2,
      child: Align(
        alignment: align ?? Alignment.centerLeft,
        child: Text(
          text,
          style: AppFontStyle.styleSemiBold16(Get.context!),
        ),
      ),
    );
  }
}
