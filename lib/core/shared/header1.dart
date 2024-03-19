import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class Header1 extends StatelessWidget {
  const Header1({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppFontStyle.styleBold36(context),
        ),
        const Spacer(
          flex: 5,
        ),
        Container(
          width: 56 * getScaleFactor(context),
          height: 56 * getScaleFactor(context),
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
        SizedBox(width: 14 * getScaleFactor(context)),
        Container(
          width: 56 * getScaleFactor(context),
          height: 56 * getScaleFactor(context),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Omar Bkdash",
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
        SizedBox(width: 20 * getScaleFactor(context)),
        Container(
          width: 55 * getScaleFactor(context),
          height: 55 * getScaleFactor(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(
            Assets.imagesLogo,
            color: AppColors.primaryPurple,
          ),
        ),
      ],
    );
  }
}
