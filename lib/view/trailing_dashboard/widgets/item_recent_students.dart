import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';

class ItemRecentStudents extends StatefulWidget {
  const ItemRecentStudents({
    super.key,
  });

  @override
  State<ItemRecentStudents> createState() => _ItemRecentStudentsState();
}

class _ItemRecentStudentsState extends State<ItemRecentStudents> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -1),
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(radius: 24 * getScaleFactor(context)),
      trailing: Container(
        padding: EdgeInsets.all(8 * getScaleFactor(context)),
        width: 48 * getScaleFactor(context),
        height: 48 * getScaleFactor(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              width: 1.5,
              color: isHovering ? AppColors.primaryPurple : AppColors.darkGray),
        ),
        child: SvgPicture.asset(
          Assets.iconsEmail,
          colorFilter: ColorFilter.mode(
            isHovering ? AppColors.primaryPurple : AppColors.darkGray,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Samantha William",
              style: AppFontStyle.styleSemiBold15_5(context),
            ),
            Text(
              "Class VII A",
              style: AppFontStyle.styleRegular14(context).copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
