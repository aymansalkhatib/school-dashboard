import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';
import 'package:sama/model/item_card_user_model.dart';
import 'package:sama/utils/row_info.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.constraints,
    required this.inforamtions,
    required this.name,
    required this.isFoundSibTitle,
  });
  final BoxConstraints constraints;
  final List<ItemCardUserModel> inforamtions;
  final String name;
  final bool isFoundSibTitle;
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
          const Spacer(
            flex: 3,
          ),
          Text(
            name,
            style: AppFontStyle.styleBold32(context)
                .copyWith(fontSize: 30 * MediaQuery.sizeOf(context).width / 1700),
          ),
          const Spacer(flex: 1),
          isFoundSibTitle
              ? Text(
                  "Student",
                  style: AppFontStyle.styleMedium16(context).copyWith(
                      fontSize: 15 * MediaQuery.sizeOf(context).width / 1700, color: AppColors.darkGray),
                )
              : const SizedBox.shrink(),
          const Spacer(flex: 5),
          RowInfo(inforamtions: inforamtions)
        ],
      ),
    );
  }
}
