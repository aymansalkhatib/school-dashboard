import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';

class MyPaginations extends StatelessWidget {
  const MyPaginations({
    super.key,
    this.length = 3,
  });
  final int length;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Showing ',
                    style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray)),
                TextSpan(text: '1-5 ', style: AppFontStyle.styleRegular14(context)),
                TextSpan(
                    text: 'from ',
                    style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray)),
                TextSpan(text: '100 ', style: AppFontStyle.styleRegular14(context)),
                TextSpan(
                    text: 'data',
                    style: AppFontStyle.styleRegular14(context).copyWith(color: AppColors.darkGray)),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Dropdown(angle: 22 / 7 / 2),
            ...List.generate(length, (index) {
              bool isActive = index == 1;
              return Padding(
                padding: EdgeInsets.only(right: index + 1 < length ? 6 : 0),
                child: CircleAvatar(
                  radius: 24 * getScaleFactor(context),
                  backgroundColor: !isActive ? AppColors.darkGray : AppColors.primaryPurple,
                  child: CircleAvatar(
                    radius: 24 * getScaleFactor(context) - 1.7,
                    backgroundColor: isActive ? AppColors.primaryPurple : Colors.white,
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: AppFontStyle.styleMedium18(context).copyWith(
                          color: !isActive ? AppColors.darkGray : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            const Dropdown(angle: 22 / 7 / -2),
          ],
        ),
      ],
    );
  }
}

class Dropdown extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.angle,
    this.onTap,
  });
  final double angle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          Assets.iconsDropdown,
          height: 32 * getScaleFactor(context),
          colorFilter: const ColorFilter.mode(AppColors.primaryPurple, BlendMode.srcIn),
        ),
      ),
    );
  }
}
