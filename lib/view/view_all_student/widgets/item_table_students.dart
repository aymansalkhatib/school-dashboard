import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/classes.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/core/helper/new_line.dart';
import 'package:sama/core/shared/contacts.dart';
import 'package:sama/model/student_model.dart';
import 'package:sama/view/view_all_student/widgets/image_with_name_student.dart';
import 'package:sama/view/view_all_student/widgets/pop_menu_options_students.dart';

import '../../../controller/navigations_controller.dart';

class ItemTableStudents extends StatelessWidget {
  const ItemTableStudents(
      {super.key, required this.studentModel, required this.index});
  final StudentModel studentModel;
  final int index;
  Widget fittedText(String text, {TextStyle? style}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: style ?? AppFontStyle.styleRegular14(Get.context!),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // index 0 -> 11
    int grade = (int.tryParse(studentModel.grade
                .substring(studentModel.grade.length - 2)
                .trim()) ??
            1) -
        1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: GestureDetector(
        onTap: () {
          Get.find<NavigationControllerImp>().replaceLastWidget(
              NavigationEnum.StudentDetails,
              info: {"model": studentModel});
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: fittedText(
                "#${index + 1}",
                style: AppFontStyle.styleSemiBold18(Get.context!)
                    .copyWith(color: AppColors.primaryPurple),
              ),
            ),
            Expanded(
              flex: 3,
              child: ImageWithNameStudent(
                studentModel: studentModel,
              ),
            ),
            Expanded(
              flex: 2,
              child: fittedText(
                studentModel.dateOfBirth,
                style: AppFontStyle.styleRegular14(Get.context!).copyWith(
                  color: AppColors.darkGray,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: fittedText(
                studentModel.parentName,
              ),
            ),
            Expanded(
              flex: 2,
              child: Tooltip(
                preferBelow: true,
                verticalOffset: 20,
                margin: const EdgeInsets.only(right: 50),
                padding: const EdgeInsets.all(5),
                height: 16,
                message: studentModel.address.length > 12
                    ? addNewlines(studentModel.address, 50)
                    : studentModel.address,
                child: fittedText(
                  studentModel.address.substring(
                        0,
                        min(12, studentModel.address.length),
                      ) +
                      ((studentModel.address.length > 12) ? ".." : ""),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Contacts(
                email: studentModel.email,
                phone: studentModel.phone,
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40 * getScaleFactor(context),
                  width: 90 * getScaleFactor(context),
                  decoration: BoxDecoration(
                    color: [
                      AppColors.accentOrange,
                      AppColors.primaryPurple,
                      AppColors.highlightYellow,
                    ][grade > 8
                        ? 0
                        : grade > 5
                            ? 1
                            : 2],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      romanNumerals[grade],
                      style: AppFontStyle.styleRegular16(context, lower: 0.7)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20 * getScaleFactor(context)),
            SizedBox(
              width: 45,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: PopMenuOptionsStudents(
                    index: index,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// tooltip
