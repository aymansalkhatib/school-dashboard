import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/core/constants/classes.dart';
import 'package:sama/model/student_model.dart';

class RowUnpaidStudent extends StatelessWidget {
  final StudentModel studentModel;
  final double remainingBalance;
  const RowUnpaidStudent({
    super.key,
    required this.studentModel,
    required this.remainingBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28 * getScaleFactor(context),
                backgroundColor: AppColors.primaryPurple,
                child: Padding(
                  padding: EdgeInsets.all(12.0 * getScaleFactor(context)),
                  child: SvgPicture.asset(
                    Assets.iconsStudent,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "${studentModel.firstName} ${studentModel.lastName}",
                    style: AppFontStyle.styleSemiBold18(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "ID ${studentModel.id}",
                style: AppFontStyle.styleSemiBold18(context).copyWith(color: AppColors.primaryPurple),
              ),
            ),
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 28 * getScaleFactor(context),
                backgroundColor: AppColors.accentOrange,
                child: Padding(
                  padding: EdgeInsets.all(12.0 * getScaleFactor(context)),
                  child: SvgPicture.asset(
                    Assets.iconsUser,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Class",
                    style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray),
                  ),
                  Text(
                    "${romanNumerals[levels.indexOf(studentModel.grade)]} ${letters[ordinalNames.indexOf(studentModel.section)]}",
                    style: AppFontStyle.styleSemiBold18(context),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "\$ $remainingBalance",
                style: AppFontStyle.styleSemiBold18(context),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                Assets.iconsPrint,
                width: 28 * getScaleFactor(context),
              ),
              const SizedBox(width: 24),
              SvgPicture.asset(
                Assets.iconsDots,
                width: 28 * getScaleFactor(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
