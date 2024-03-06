import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';

class TrailingDashboardHeader extends StatelessWidget {
  const TrailingDashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.sizeOf(context).width / 1920;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 32 * scale),
        Container(
          width: 60 * scale,
          height: 60 * scale,
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            Assets.iconsBell,
            colorFilter: const ColorFilter.mode(AppColors.darkGray, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: 14 * scale),
        Container(
          width: 60 * scale,
          height: 60 * scale,
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            Assets.iconsGear,
            colorFilter: const ColorFilter.mode(AppColors.darkGray, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: 20 * scale),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Ayman Al-Katib",
                style: AppFontStyle.styleSemiBold14(context).copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "Admin",
                style: AppFontStyle.styleSemiBold14(context).copyWith(
                  color: AppColors.darkGray,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20 * scale),
        Container(
          width: 55 * scale,
          height: 55 * scale,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            Assets.iconsUser,
            colorFilter: const ColorFilter.mode(AppColors.backgroundWhite, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: 35 * scale),
      ],
    );
  }
}
