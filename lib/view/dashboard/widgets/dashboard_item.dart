import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/model/dashboard_item_model.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({super.key, required this.dashboardItemModel});
  final DashboardItemModel dashboardItemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 65 / 2 * getScaleFactor(context),
          backgroundColor: dashboardItemModel.color,
          child: Padding(
              padding: EdgeInsets.all(16 * getScaleFactor(context)),
              child: SvgPicture.asset(
                dashboardItemModel.icon,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              )),
        ),
        SizedBox(width: 18 * getScaleFactor(context)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dashboardItemModel.text,
              style: AppFontStyle.styleMedium18(context).copyWith(
                  color: AppColors.darkGray,
                  fontSize: 16 * getScaleFactor(context)),
            ),
            Text(
              dashboardItemModel.number.toString(),
              style: AppFontStyle.styleBold36(context)
                  .copyWith(fontSize: 30 * getScaleFactor(context)),
            ),
          ],
        ),
      ],
    );
  }
}
