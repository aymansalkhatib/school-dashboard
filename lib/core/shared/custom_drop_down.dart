import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.angle,
    this.onTap,
    this.size,
  });
  final double angle;
  final double? size;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          Assets.iconsDropdown,
          height: (size ?? 32) * getScaleFactor(context),
          colorFilter: const ColorFilter.mode(AppColors.primaryPurple, BlendMode.srcIn),
        ),
      ),
    );
  }
}
