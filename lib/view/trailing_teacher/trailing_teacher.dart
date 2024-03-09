import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/view/trailing_teacher/widgets/header_trailing_teacher.dart';
 import 'package:sama/view/trailing_teacher/widgets/list_item_schedule_details.dart';

class TrailingTeacher extends StatelessWidget {
  const TrailingTeacher({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderTrailingTeacher(),
        SizedBox(height: 30),
        ListItemScheduleDetails(),
      ],
    );
  }
}


class IconWithTextInsideItemScheduleDetails extends StatelessWidget {
  const IconWithTextInsideItemScheduleDetails({
    super.key,
    required this.iconColor,
    required this.icon,
    required this.text,
  });
  final Color iconColor;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 28 * getScaleFactor(context),
          height: 28 * getScaleFactor(context),
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppFontStyle.styleRegular14(context).copyWith(
            color: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}

