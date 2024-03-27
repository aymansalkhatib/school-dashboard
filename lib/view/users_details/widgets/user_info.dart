import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/constants/assets.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/core/utils/row_info.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.constraints,
    required this.inforamtions,
    required this.name,
    required this.subtitle,
  });
  final BoxConstraints constraints;
  final List<ItemCardUserModel> inforamtions;
  final String name;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      height: constraints.maxHeight / 3 * 2,
      width: constraints.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              width: 24,
              height: 24,
              Assets.iconsDots,
              colorFilter: const ColorFilter.mode(
                AppColors.darkGray,
                BlendMode.srcIn,
              ),
            ),
          ),
          Spacer(
            flex: MediaQuery.sizeOf(context).width > 1400 ? 2 : 1,
          ),
          Text(
            name,
            style: AppFontStyle.styleBold32(context).copyWith(
                fontSize: 30 * MediaQuery.sizeOf(context).width / 1700),
          ),
          Text(
            "Student",
            style: AppFontStyle.styleSemiBold15_5(context).copyWith(
                fontSize: 15 * MediaQuery.sizeOf(context).width / 1700,
                color: AppColors.darkGray),
          ),
          const Spacer(flex: 5),
          RowInfo(inforamtions: inforamtions)
        ],
      ),
    );
  }
}
