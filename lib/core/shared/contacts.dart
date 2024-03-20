import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class Contacts extends StatelessWidget {
  const Contacts({
    super.key,
    this.isStudent = true,
  });
  final bool isStudent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104 * getScaleFactor(context),
      child: Row(
        children: [
          Container(
            width: 44 * getScaleFactor(context),
            height: 44 * getScaleFactor(context),
            decoration: BoxDecoration(
                color: isStudent ? AppColors.lightPurple : AppColors.primaryPurple, shape: BoxShape.circle),
            child: Padding(
              padding: EdgeInsets.all(9 * getScaleFactor(context)),
              child: SvgPicture.asset(
                  colorFilter:
                      ColorFilter.mode(isStudent ? AppColors.primaryPurple : Colors.white, BlendMode.srcIn),
                  Assets.iconsCall),
            ),
          ),
          SizedBox(width: 16 * getScaleFactor(context)),
          Container(
            width: 44 * getScaleFactor(context),
            height: 44 * getScaleFactor(context),
            decoration: BoxDecoration(
                color: isStudent ? AppColors.lightPurple : AppColors.primaryPurple, shape: BoxShape.circle),
            child: Padding(
              padding: EdgeInsets.all(9 * getScaleFactor(context)),
              child: SvgPicture.asset(
                  colorFilter:
                      ColorFilter.mode(isStudent ? AppColors.primaryPurple : Colors.white, BlendMode.srcIn),
                  Assets.iconsEmail),
            ),
          ),
        ],
      ),
    );
  }
}
