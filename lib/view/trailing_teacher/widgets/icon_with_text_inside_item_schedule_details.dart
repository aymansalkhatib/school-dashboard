import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';

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
