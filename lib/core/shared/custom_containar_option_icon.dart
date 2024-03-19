import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class CustomContaniarOptionIcon extends StatelessWidget {
  const CustomContaniarOptionIcon(
      {super.key,
      this.color,
      this.icon = Assets.iconsStudent,
      this.withIcon = false,
      this.distance,
      this.iconColor,
      this.padding});
  final Color? color;
  final String icon;
  final bool withIcon;
  final double? distance;
  final Color? iconColor;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (distance ?? 56) * getScaleFactor(context),
      height: (distance ?? 56) * getScaleFactor(context),
      padding: EdgeInsets.all(padding ?? 9),
      decoration: BoxDecoration(
        color: color ?? AppColors.lightGray,
        borderRadius: BorderRadius.circular(100),
      ),
      child: withIcon
          ? SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(iconColor ?? Colors.white, BlendMode.srcIn),
            )
          : const SizedBox(),
    );
  }
}
