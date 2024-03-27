import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';

import '../../../model/item_card_user_model.dart';

class UserItemCard extends StatelessWidget {
  const UserItemCard({super.key, required this.itemCardUserModel});
  final ItemCardUserModel itemCardUserModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          itemCardUserModel.title,
          style: AppFontStyle.styleRegular18(context, lower: 0.7).copyWith(
            color: AppColors.darkGray,
          ),
        ),
        SizedBox(height: 12 * getScaleFactor(context)),
        Row(
          children: [
            const SizedBox(width: 2),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.accentOrange,
              ),
              child: SvgPicture.asset(
                itemCardUserModel.icon,
                width: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 12),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(itemCardUserModel.body,
                    style: AppFontStyle.styleSemiBold18(context, lower: 0.7))),
          ],
        )
      ],
    );
  }
}
