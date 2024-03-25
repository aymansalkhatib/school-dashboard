import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/shared/contacts.dart';
import 'package:sama/model/teacher_model.dart';

import '../../../core/constants/app_colors.dart';

class ItemGridVewTeachers extends StatelessWidget {
  const ItemGridVewTeachers({
    super.key,
    required this.teacherModel,
  });
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              SizedBox(width: 26 * getScaleFactor(context), height: 5.28),
              Container(
                width: 120 * getScaleFactor(context),
                height: 120 * getScaleFactor(context),
                decoration: const BoxDecoration(
                  color: AppColors.lightBlue,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 26 * getScaleFactor(context),
                height: 5.28,
                child: SvgPicture.asset(Assets.iconsDotsWithoutSpace),
              ),
            ],
          ),
          const Spacer(),
          Text("Tom Housenburg", style: AppFontStyle.styleBold24(context, lower: 0.6)),
          SizedBox(height: 9 * getScaleFactor(context)),
          Text("Science",
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
    );
  }
}
