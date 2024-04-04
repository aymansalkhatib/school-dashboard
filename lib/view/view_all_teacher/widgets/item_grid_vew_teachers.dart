import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/navigations_controller.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/enum/navigations_enum.dart';
import 'package:sama/core/shared/contacts.dart';
import 'package:sama/model/teacher_model.dart';
import 'package:sama/view/view_all_teacher/widgets/pop_menu_options_teacher.dart';
import '../../../core/constants/app_colors.dart';

class ItemGridVewTeachers extends StatelessWidget {
  const ItemGridVewTeachers({
    super.key,
    required this.teacherModel,
    required this.index,
  });
  final TeacherModel teacherModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<NavigationControllerImp>()
            .replaceLastWidget(NavigationEnum.TeacherDetails, info: {"model": teacherModel});
      },
      child: Container(
        padding: EdgeInsets.all(32 * getScaleFactor(context)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 26 * getScaleFactor(context), height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 120 * getScaleFactor(context),
                    height: 120 * getScaleFactor(context),
                    color: AppColors.lightBlue,
                    child: teacherModel.image != null && (teacherModel.image ?? '').isNotEmpty
                        ? Image.file(
                            File(teacherModel.image!),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            Assets.imagesTeacherDefault,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  width: 26 * getScaleFactor(context),
                  height: 30,
                  child: PopMenuOptionsTeacher(index: index, teacherModel),
                ),
              ],
            ),
            const Spacer(),
            Text("${teacherModel.firstName} ${teacherModel.lastName}",
                style: AppFontStyle.styleBold24(context, lower: 0.6)),
            SizedBox(height: 9 * getScaleFactor(context)),
            Text(teacherModel.degree,
                style: AppFontStyle.styleRegular18(context, lower: 0.6).copyWith(color: AppColors.darkGray)),
            const Spacer(),
            Center(
              child: Contacts(
                isStudent: false,
                email: teacherModel.email,
                phone: teacherModel.phone,
              ),
            )
          ],
        ),
      ),
    );
  }
}
