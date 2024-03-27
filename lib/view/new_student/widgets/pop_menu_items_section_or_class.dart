import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sama/controller/add_new_student_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/classes.dart';

class PopMenuItemsSectionOrClass extends StatelessWidget {
  const PopMenuItemsSectionOrClass({
    super.key,
    required this.menuClass,
  });
  final bool menuClass;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewStudentControllerImp>(builder: (controller) {
      return PopupMenuButton<String>(
        color: AppColors.lightPurple,
        elevation: 0,
        tooltip: menuClass ? "Choose Grade" : "Choose Section",
        onSelected: (value) {
          menuClass ? controller.setGrade(value) : controller.setSection(value);
        },
        child: Container(
          height: 45,
          padding: const EdgeInsets.only(left: 8, right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xffC1BBEB), width: 1.5),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              menuClass ? controller.grade : controller.activeSection ?? "",
              style: AppFontStyle.styleRegular16(context, lower: 0.7).copyWith(
                color: AppColors.textBlack,
                height: 1.2,
              ),
            ),
          ),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          for (int i = 0;
              i < (menuClass ? levels.length : controller.sections.length);
              i++)
            PopupMenuItem<String>(
              padding: const EdgeInsets.only(right: 20, left: 15),
              height: 45 * getScaleFactor(context),
              value: menuClass ? levels[i] : controller.sections[i].name,
              child: Text(
                menuClass ? levels[i] : controller.sections[i].name,
                style: AppFontStyle.styleRegular18(context)
                    .copyWith(fontSize: 18 * getScaleFactor(context)),
              ),
            ),
        ],
      );
    });
  }
}
