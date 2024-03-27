import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/core/utils/row_info.dart';
import 'package:sama/model/teacher_model.dart';
import 'package:sama/view/teacher_details/widgets/education_item.dart';

class TeachersInfo extends StatelessWidget {
  const TeachersInfo({
    super.key,
    required this.teacherModel,
  });
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    double top = lerpDouble(
        60, 44, ((1600 - width) > 0 ? (1600 - width) : -(1600 - width)) / 400)!;
    double sizeBoxHeight = lerpDouble(43, 10.5,
        ((1600 - width) > 0 ? (1600 - width) : -(1600 - width)) / 400)!;
    return Padding(
      padding: EdgeInsets.only(left: 32, top: top, right: 32, bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${teacherModel.firstName} ${teacherModel.lastName}",
            style: AppFontStyle.styleBold32(context).copyWith(
                fontSize: 30 * MediaQuery.sizeOf(context).width / 1700),
          ),
          Text(teacherModel.degree,
              style: AppFontStyle.styleSemiBold15_5(context).copyWith(
                  fontSize: 15 * MediaQuery.sizeOf(context).width / 1700,
                  color: AppColors.darkGray)),
          SizedBox(height: sizeBoxHeight),
          RowInfo(inforamtions: itemCardUserModel),
          const SizedBox(height: 30),
          Text(
            "About:",
            style: AppFontStyle.styleBold24(context, lower: 0.7),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  teacherModel.about,
                  style:
                      AppFontStyle.styleRegular18(context, lower: 0.7).copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
          const SizedBox(height: 30),
          Text(
            "Education:",
            style: AppFontStyle.styleBold24(context, lower: 0.7),
          ),
          const SizedBox(height: 12),
          EducationItem(
            title: teacherModel.university,
            body: "${teacherModel.startDate} ${teacherModel.endDate}",
          ),
          const SizedBox(height: 18),
          EducationItem(
            title: teacherModel.university,
            body: "${teacherModel.startDate} ${teacherModel.endDate}",
          ),
          const SizedBox(height: 30),
          Text(
            "Expertise:",
            style: AppFontStyle.styleBold24(context, lower: 0.7),
          ),
          const SizedBox(height: 6),
          Text(
            teacherModel.expiration,
            style: AppFontStyle.styleRegular18(context, lower: 0.7).copyWith(
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
