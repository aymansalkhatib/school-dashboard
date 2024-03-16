import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

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
          width: 24 * getScaleFactor(context),
          height: 24 * getScaleFactor(context),
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppFontStyle.styleRegular14(context, lower: 0.7).copyWith(
            color: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}
