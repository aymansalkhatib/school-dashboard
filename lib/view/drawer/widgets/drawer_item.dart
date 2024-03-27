import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/model/drawer_item_model.dart';

class DrawerItem extends StatelessWidget {
  final DrawerItemModel drawerItemModel;
  final bool isActive;

  const DrawerItem(
      {super.key, required this.drawerItemModel, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17 * getScaleFactor(context)),
      decoration: BoxDecoration(
        color: isActive ? AppColors.lightPurple : null,
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(100)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 24,
          ),
          SvgPicture.asset(
            width: max(28, 38 * getScaleFactor(context)),
            drawerItemModel.icon,
            colorFilter: ColorFilter.mode(
                isActive ? AppColors.primaryPurple : AppColors.lightBlue,
                BlendMode.srcIn),
          ),
          const SizedBox(
            width: 24,
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                drawerItemModel.title,
                style: AppFontStyle.styleMedium18(context).copyWith(
                    color: isActive
                        ? AppColors.primaryPurple
                        : AppColors.lightBlue),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
