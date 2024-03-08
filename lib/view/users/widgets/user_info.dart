import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sama/constants/app_colors.dart';
import 'package:sama/constants/app_font_style.dart';
import 'package:sama/constants/assets.dart';
import 'package:sama/model/item_card_user.dart';
import 'package:sama/utils/row_info.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.constraints,
    required this.inforamtions,
    required this.name,
  });
  final BoxConstraints constraints;
  final List<ItemCardUserModel> inforamtions;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
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
          const Spacer(flex: 1),
          Text(
            name,
            style: AppFontStyle.styleBold32(context)
                .copyWith(fontSize: 32 * MediaQuery.sizeOf(context).width / 1700),
          ),
          const Spacer(flex: 2),
          RowInfo(inforamtions: inforamtions)
        ],
      ),
    );
  }
}
