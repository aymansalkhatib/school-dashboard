import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/controller/view_student_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/enum/navigations_enum.dart';

class PopMenuOptionsStudents extends GetView<ViewStudentControllerImp> {
  const PopMenuOptionsStudents({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: "",
      color: AppColors.lightPurple,
      elevation: 0,
      onSelected: (value) {
        switch (value) {
          case 'Edit':
            Get.find<NavigationControllerImp>().replaceLastWidget(
                NavigationEnum.AddNewStudent,
                info: {"model": controller.students[index]});
            break;
          case 'Delete':
            controller.removeStudent(index);
            break;
          case 'Paid':
            break;
        }
      },
      child: SvgPicture.asset(
        Assets.iconsDots,
        width: 24 * getScaleFactor(context),
        height: 24 * getScaleFactor(context),
        colorFilter:
            const ColorFilter.mode(AppColors.darkGray, BlendMode.srcIn),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(right: 20, left: 15),
          height: 45 * getScaleFactor(context),
          value: "Edit",
          child: Text(
            "Edit",
            style: AppFontStyle.styleRegular18(context)
                .copyWith(fontSize: 18 * getScaleFactor(context)),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(right: 20, left: 15),
          height: 45 * getScaleFactor(context),
          value: "Delete",
          child: Text(
            "Delete",
            style: AppFontStyle.styleRegular18(context)
                .copyWith(fontSize: 18 * getScaleFactor(context)),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(right: 20, left: 15),
          height: 45 * getScaleFactor(context),
          value: "Paid",
          child: Text(
            "Paid",
            style: AppFontStyle.styleRegular18(context)
                .copyWith(fontSize: 18 * getScaleFactor(context)),
          ),
        ),
      ],
    );
  }
}
